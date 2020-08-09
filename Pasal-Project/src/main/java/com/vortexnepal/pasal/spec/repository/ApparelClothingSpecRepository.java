package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.ApparelClothingSpec;

public interface ApparelClothingSpecRepository extends CrudRepository<ApparelClothingSpec, Integer>{
	ApparelClothingSpec findByMainAdsId(int id);
}
