package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.LaptopSpec;

public interface LaptopSpecRepository extends CrudRepository<LaptopSpec, Integer>{
	LaptopSpec findByMainAdsId(int id);
}
