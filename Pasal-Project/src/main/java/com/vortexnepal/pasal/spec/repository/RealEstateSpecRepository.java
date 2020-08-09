package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.RealEstateSpec;

public interface RealEstateSpecRepository extends CrudRepository<RealEstateSpec, Integer>{
	RealEstateSpec findByMainAdsId(int id);
}
