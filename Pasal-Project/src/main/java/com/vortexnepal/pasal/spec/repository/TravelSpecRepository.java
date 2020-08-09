package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.TravelSpec;

public interface TravelSpecRepository extends CrudRepository<TravelSpec, Integer>{
	TravelSpec findByMainAdsId(int id);
}
