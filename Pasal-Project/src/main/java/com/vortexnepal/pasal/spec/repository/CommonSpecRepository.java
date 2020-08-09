package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;
import com.vortexnepal.pasal.spec.model.CommonSpec;

public interface CommonSpecRepository extends CrudRepository<CommonSpec, Integer>{
	CommonSpec findByMainAdsId(int id);
	
}
