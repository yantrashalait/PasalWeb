package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.SubModel;

public interface SubModelRepository extends CrudRepository<SubModel, Integer>{
	List<SubModel> findBySubCategorySubCategoryId(int subcategoryid);
	
	List<SubModel> findBySubModelName(String name);
	
	int countBySubCategorySubCategoryId(int subCategory);
}
