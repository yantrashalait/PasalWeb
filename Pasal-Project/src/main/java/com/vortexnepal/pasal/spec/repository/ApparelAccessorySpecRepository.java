package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.ApparelAccessorySpec;

public interface ApparelAccessorySpecRepository extends CrudRepository<ApparelAccessorySpec, Integer>{
	ApparelAccessorySpec findByMainAdsId(int id);
}
