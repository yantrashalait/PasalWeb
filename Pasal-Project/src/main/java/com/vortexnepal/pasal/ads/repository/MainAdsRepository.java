package com.vortexnepal.pasal.ads.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.vortexnepal.pasal.ads.model.MainAds;

public interface MainAdsRepository
		extends CrudRepository<MainAds, Integer>, PagingAndSortingRepository<MainAds, Integer> {

	MainAds findByIdAndCustomerCustomerId(int id, int customerId);

	@Query("FROM MainAds WHERE expired = 0 And featured = 1 ORDER BY addedDate DESC")
	List<MainAds> findAllDESC();

	@Query(value = "SELECT * FROM `tbl_main_ads` WHERE expired = 0 ORDER BY main_ads_id DESC LIMIT 16", nativeQuery = true)
	List<MainAds> recentAds();
	
	int countBySubModelSubModelId(int id);

	@Transactional
	@Modifying
	@Query("FROM MainAds WHERE subCategory.subCategoryId IN (FROM SubCategory WHERE category.categoryId = :categoryId) And expired = 0")
	List<MainAds> selectByCategory(@Param("categoryId") int categoryId);

	@Transactional
	@Modifying
	@Query("FROM MainAds WHERE subCategory.subCategoryId = :subCategoryId And expired = 0")
	List<MainAds> selectBySubCategory(@Param("subCategoryId") int subCategoryId);

	@Query(value = "SELECT COUNT(m.main_ads_id)\n" + "  FROM tbl_main_ads m \n"
			+ "  JOIN tbl_sub_categories s ON m.sub_category_id = s.sub_category_id\n"
			+ "  JOIN tbl_categories c ON c.category_id = s.category_id\n"
			+ "WHERE s.sub_category_id = :subCategoryId AND c.category_id = :categoryId AND m.expired = false", nativeQuery = true)
	int selectBySubCategorySpec(@Param("subCategoryId") int subCategoryId, @Param("categoryId") int categoryId);

	int countBySubModelSubModelIdAndExpiredFalse(int subModelId);

	int countByCustomerCustomerId(int customerId);

	@Query("FROM MainAds WHERE viewCount >= 10 AND expired = 0 ORDER BY viewCount DESC")
	List<MainAds> popularTrendings();

	@Transactional
	@Modifying
	@Query("FROM MainAds WHERE subModel.subModelId = :subModelId")
	List<MainAds> selectBySubModel(@Param("subModelId") int subModelId);

	List<MainAds> findByCustomerCustomerId(int customerId);

	/*
	 * Pagination Logic
	 */

	Page<MainAds> findBySubCategoryCategoryCategoryId(Pageable page, int categoryId);
	
	@Query("FROM MainAds ORDER BY id DESC")
	List<MainAds> findMainAds();
	
	@Query("SELECT COUNT(*) FROM MainAds")
	int countAllAds();
	
	@Query("SELECT COUNT(*) FROM MainAds where expired = 0")
	int countActiveAds();
	
	@Query("SELECT COUNT(*) FROM MainAds where expired = 1")
	int countExpiredAds();
}
