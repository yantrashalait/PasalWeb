package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.TabletSpec;

public interface TabletSpecRepository extends CrudRepository<TabletSpec, Integer>{
	TabletSpec findByMainAdsId(int id);
}
