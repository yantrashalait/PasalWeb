package com.vortexnepal.pasal.ads.repository;

import org.springframework.data.repository.CrudRepository;
import com.vortexnepal.pasal.ads.model.Warranty;

public interface WarrantyRepository extends CrudRepository<Warranty, Integer>{
	Warranty findByMainAdsId(int id);
}
