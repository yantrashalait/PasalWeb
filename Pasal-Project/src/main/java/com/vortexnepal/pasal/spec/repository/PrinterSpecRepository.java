package com.vortexnepal.pasal.spec.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.spec.model.PrinterSpec;

public interface PrinterSpecRepository extends CrudRepository<PrinterSpec, Integer>{
	PrinterSpec findByMainAdsId(int id);
}
