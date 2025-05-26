package com.example.demo.service;

import com.example.demo.models.EntertainmentMap;
import com.example.demo.repo.EntertainmentMapRepository;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;


import java.util.List;

@Service
public class EntertainmentMapService {
    private final EntertainmentMapRepository mapRepository;

    public EntertainmentMapService(EntertainmentMapRepository MapRepository) {
        this.mapRepository = MapRepository;
    }

    public List<EntertainmentMap> findAll() {
        return mapRepository.findAll();
    }

    public EntertainmentMap save(EntertainmentMap map) {
        return mapRepository.save(map);
    }

    public EntertainmentMap findById(Long id) {
        return mapRepository.findById(id).orElse(null);
    }

    public void deleteById(Long id) {
        mapRepository.deleteById(id);
    }

    public Page<EntertainmentMap> search(String name,
                                         List<Integer> category_id,
                                         Float minRating,
                                         int page,
                                         int size,
                                         String sortBy,
                                         Sort.Direction direction) {
        // Простая валидация параметров пагинации
        if (page < 0) {
            page = 0;
        }
        if (size <= 0 || size > 100) {
            size = 10;
        }

        // Создаем спецификации для каждого критерия поиска
        Specification<EntertainmentMap> spec = Specification.where(null);

        if (name != null && !name.isBlank()) {
            spec = spec.and((root, query, cb) ->
                    cb.like(cb.lower(root.get("name")), "%" + name.toLowerCase() + "%"));
        }

        if (category_id != null && !category_id.isEmpty()) {
            spec = spec.and((root, query, cb) ->
                    root.get("category_id").in(category_id));
        }

        if (minRating != null) {
            spec = spec.and((root, query, cb) ->
                    cb.greaterThanOrEqualTo(root.get("rating"), minRating));
        }

        Sort sort;
        try {
            // Проверяем, что sortBy - это реальное поле класса
            if (sortBy == null || sortBy.isEmpty() ||
                    EntertainmentMap.class.getDeclaredField(sortBy) == null) {
                sortBy = "id"; // сортировка по умолчанию
            }

            sort = Sort.by(direction != null ? direction : Sort.Direction.ASC, sortBy)
                    .and(Sort.by(Sort.Direction.ASC, "name"));
        } catch (NoSuchFieldException e) {
            sort = Sort.by("id"); // fallback если поле не найдено
        }

//        Sort sort = Sort.by(new Sort.Order(direction, sortBy),
//                new Sort.Order(Sort.Direction.ASC, "name")); // Всегда сортируем по имени вторым параметром

        Pageable pageable = PageRequest.of(page, size, sort);
        return mapRepository.findAll(spec, pageable);
    }

    public Page<EntertainmentMap> findAllPaged(int page, int size, String sortBy, boolean desc) {
        // Валидация параметров
        if (page < 0) page = 0;
        if (size <= 0 || size > 100) size = 10;

        // Безопасная сортировка
        Sort sort;
        try {
            if (sortBy == null || sortBy.isEmpty() ||
                    EntertainmentMap.class.getDeclaredField(sortBy) == null) {
                sortBy = "id";
            }
            sort = desc
                    ? Sort.by(sortBy).descending() // Сортировка по убыванию
                    : Sort.by(sortBy).ascending(); // Сортировка по возрастанию
        } catch (NoSuchFieldException e) {
            sort = Sort.by("id");
        }

        Pageable pageable = PageRequest.of(page, size, sort);
        return mapRepository.findAll(pageable);
    }
}