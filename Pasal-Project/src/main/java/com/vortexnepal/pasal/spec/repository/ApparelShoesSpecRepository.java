package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;
import com.vortexnepal.pasal.spec.model.ApparelShoesSpec;

public interface ApparelShoesSpecRepository extends CrudRepository<ApparelShoesSpec, Integer>{
	ApparelShoesSpec findByMainAdsId(int id);
}
