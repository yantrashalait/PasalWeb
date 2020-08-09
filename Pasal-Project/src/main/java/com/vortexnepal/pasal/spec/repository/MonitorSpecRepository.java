package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.MonitorSpec;

public interface MonitorSpecRepository extends CrudRepository<MonitorSpec, Integer>{
	MonitorSpec findByMainAdsId(int id);
}
