package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.Car;

public interface CarRepository extends CrudRepository<Car, Integer>{
	List<Car> findByBrandBrandId(int brandId);
	List<Car> findTop4ByBrandActivateTrue();
}
