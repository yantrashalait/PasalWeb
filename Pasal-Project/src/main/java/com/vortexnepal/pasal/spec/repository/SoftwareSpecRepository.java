package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.SoftwareSpec;

public interface SoftwareSpecRepository extends CrudRepository<SoftwareSpec, Integer>{
	SoftwareSpec findByMainAdsId(int id);
}
