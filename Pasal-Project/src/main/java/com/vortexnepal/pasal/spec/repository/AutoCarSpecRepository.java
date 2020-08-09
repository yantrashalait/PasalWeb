package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.AutoCarSpec;

public interface AutoCarSpecRepository extends CrudRepository<AutoCarSpec, Integer>{
	AutoCarSpec findByMainAdsId(int id);
}
