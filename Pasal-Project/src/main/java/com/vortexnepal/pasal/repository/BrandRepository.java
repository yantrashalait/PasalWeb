package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.Brand;

public interface BrandRepository extends CrudRepository<Brand, Integer>{
	
	Brand findByBrandName(String brandName);	
	List<Brand> findByType(String type);
}
