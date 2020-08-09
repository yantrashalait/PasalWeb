package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.SubCategory;

public interface SubCategoryRepository extends CrudRepository<SubCategory, Integer>{
	SubCategory findBySubCategoryName(String name);
	List<SubCategory> findByCategoryCategoryId(int categoryId);
	
	int countByCategoryCategoryId(int categoryId);
}
