package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.AutoMotocycleSpec;

public interface AutoMotocycleSpecRepository extends CrudRepository<AutoMotocycleSpec, Integer>{
	AutoMotocycleSpec findByMainAdsId(int id);
}
