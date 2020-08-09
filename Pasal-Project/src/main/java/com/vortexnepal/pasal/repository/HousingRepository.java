package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.Housing;

public interface HousingRepository extends CrudRepository<Housing,Integer>{
	List<Housing> findByBrandBrandId(int brandId);
	
	List<Housing> findTop4ByBrandActivateTrue();
	
	List<Housing> findByBrandType(String type);
}
