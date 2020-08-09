package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.HandsetSpec;

public interface HandsetSpecRepository extends CrudRepository<HandsetSpec, Integer>{
	HandsetSpec findByMainAdsId(int id);
}
