package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.NetworkingEquipmentSpec;

public interface NetworkingEquipmentSpecRepository extends CrudRepository<NetworkingEquipmentSpec, Integer>{
	NetworkingEquipmentSpec findByMainAdsId(int id);
}
