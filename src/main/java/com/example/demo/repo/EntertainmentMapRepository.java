package com.example.demo.repo;

import com.example.demo.models.EntertainmentMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;


public interface EntertainmentMapRepository extends JpaRepository<EntertainmentMap, Long>, JpaSpecificationExecutor<EntertainmentMap> {
}
