package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.SportBicycleSpec;

public interface SportBicycleSpecRepository extends CrudRepository<SportBicycleSpec, Integer>{
	SportBicycleSpec findByMainAdsId(int id);
}
