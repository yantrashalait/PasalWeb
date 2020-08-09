package com.vortexnepal.pasal.ads.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.ads.model.Delivery;

public interface DeliveryRepository extends CrudRepository<Delivery, Integer>{
	Delivery findByMainAdsId(int id);
}
