package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.BusinessSaleSpec;

public interface BusinessSaleSpecRepository extends CrudRepository<BusinessSaleSpec, Integer>{
	BusinessSaleSpec findByMainAdsId(int id);
}
