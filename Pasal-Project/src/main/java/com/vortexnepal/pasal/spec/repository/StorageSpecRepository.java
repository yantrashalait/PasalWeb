package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.StorageSpec;

public interface StorageSpecRepository extends CrudRepository<StorageSpec, Integer>{
	StorageSpec findByMainAdsId(int id);
}
