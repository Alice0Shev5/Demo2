package com.example.demo.controller;


import com.example.demo.models.EntertainmentMap;
import com.example.demo.service.EntertainmentMapService;

import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Page;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@RestController
@RequestMapping("/api/entertainment_map")

public class EntertainmentMapController {
    private final EntertainmentMapService mapService;

    private static final Logger logger = LoggerFactory.getLogger(EntertainmentMapController.class);

    public EntertainmentMapController(EntertainmentMapService mapService) {
        this.mapService = mapService;
    }


    @GetMapping
    public List<EntertainmentMap> findAll() {
        logger.info("Fetching all entertainments");
        return mapService.findAll();
    }

    // Добавление новой записи
    @PostMapping
    public EntertainmentMap save(@RequestBody EntertainmentMap place) {
        logger.info("Saving new entertainment map: {}", place);
        return mapService.save(place);
    }

    // Получение по ID
    @GetMapping("/{id}")
    public EntertainmentMap findById(@PathVariable Long id) {
        logger.info("Fetching entertainment map with id: {}", id);
        return mapService.findById(id);
    }

    // Удаление
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        logger.info("Deleting entertainment map with id: {}", id);
        mapService.deleteById(id);
    }

    // Поиск с фильтрами
    @GetMapping("/search")
    public Page<EntertainmentMap> search(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) List<Integer> category_id,
            @RequestParam(required = false) Float minRating,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "rating") String sortBy,
            @RequestParam(defaultValue = "DESC") Sort.Direction direction) {

        logger.info("Search request - name: {}, category_id: {}, minRating: {}",
                name, category_id, minRating);

        return mapService.search(name, category_id, minRating, page, size, sortBy, direction);
    }

    // Пагинация
    @GetMapping("/paged")
    public Page<EntertainmentMap> findAllPaged(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "name") String sortBy,
            @RequestParam(defaultValue = "true") boolean desc) {

        logger.info("Paged request - page: {}, size: {}, sortBy: {}, desc: {}", page, size, sortBy, desc);
        return mapService.findAllPaged(page, size, sortBy, desc);
    }

    // Обработка ошибок
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<String> handleNotFound(ResourceNotFoundException ex) {
        logger.error("Resource not found: {}", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
    }

}
