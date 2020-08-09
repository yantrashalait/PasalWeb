package com.vortexnepal.pasal.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vortexnepal.pasal.ads.repository.MainAdsRepository;

@Service
@Transactional
public class MainAdsService {
	@Autowired
	MainAdsRepository mainAdsRepo;
	@PersistenceContext
	EntityManager entityManager;
	
	public Object[] filterCategoryLevel(String location, String condition, Long startRange, Long endRange, String search, Integer subId, int page, int size, int catid) {
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		HashMap<String, String> searchParam = new HashMap<String, String>();
		HashMap<String, Integer> subIdParam = new HashMap<String, Integer>();
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		if(search !=null && !search.isEmpty() && subId !=0 ) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" subCategory.subCategoryId = :subId AND adTitle LIKE CONCAT('%', :search, '%')");
				searchParam.put("search", search);
				subIdParam.put("subId", subId);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" subCategory.subCategoryId = :subId AND adTitle LIKE CONCAT('%', :search, '%')");
				searchParam.put("search", search);
				subIdParam.put("subId", subId);
			}
		}
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
	
		if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			queryBuilder.append(" AND ");
			queryBuilder.append(" subCategory.category.categoryId = :catId AND expired = false ORDER BY addedDate DESC");
		}else {
			queryBuilder.append(" WHERE ");
			queryBuilder.append(" subCategory.category.categoryId = :catId AND expired = false ORDER BY addedDate DESC");
		}
		
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: searchParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: subIdParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("catId", catid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableAds(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, searchParam, subIdParam, catid);
		
		return object;
	}
	
	private long countPageableAds(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, HashMap<String, String> searchParam, HashMap<String, Integer> subIdParam, int catId) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: searchParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: subIdParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("catId", catId);
		long count = (long) query.getSingleResult();
		return count;
	}
	
	public Object[] filterSearch(String fullSearch,int page, int size) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> fullSearchParam = new HashMap<String, String>();
		
		System.err.println("fulltextsearch -> "+ fullSearch);
		
		if(fullSearch !=null && !fullSearch.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" adTitle LIKE CONCAT('%', :fullSearch, '%') OR description LIKE CONCAT('%', :fullSearch, '%') OR commonSpec.specCondition LIKE CONCAT('%', :fullSearch, '%') OR price LIKE CONCAT('%', :fullSearch, '%') OR customer.cityName LIKE CONCAT('%', :fullSearch, '%') AND expired = false ORDER BY addedDate DESC");
				fullSearchParam.put("fullSearch", fullSearch);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" adTitle LIKE CONCAT('%', :fullSearch, '%') OR description LIKE CONCAT('%', :fullSearch, '%') OR commonSpec.specCondition LIKE CONCAT('%', :fullSearch, '%') OR price LIKE CONCAT('%', :fullSearch, '%') OR customer.cityName LIKE CONCAT('%', :fullSearch, '%') AND expired = false ORDER BY addedDate DESC");
				fullSearchParam.put("fullSearch", fullSearch);
			}
		}
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: fullSearchParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		System.out.println(query.getResultList().size());
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSearchAds(countQuery, fullSearchParam);
		
		return object;
		
	}
	
	private long countPageableSearchAds(String countQuery, HashMap<String, String> fullSearchParam) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: fullSearchParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		long count = (long) query.getSingleResult();
		return count;
	}
	
	public Object[] filterSubCarCategoryLevel(String location, String condition, Long startRange, Long endRange, String type, Integer startYear, Integer endYear, Integer startKilo, Integer endKilo, String fuel, String transmission, String features, int page, int size, int subid) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		/*
		 * Car Spec Params
		 */
		HashMap<String, String> typeParam = new HashMap<String, String>();
		HashMap<String, Integer> startYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> startKiloParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endKiloParam = new HashMap<String, Integer>();
		HashMap<String, String> fuelParam = new HashMap<String, String>();
		HashMap<String, String> transmissionParam = new HashMap<String, String>();
		HashMap<String, String> featuresParam = new HashMap<String, String>();
		
		/*
		 *  For Location Filter.
		 */
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		/*
		 *  For Condition Filter.
		 */
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		/*
		 *  For Price Range Filter.
		 */
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
		
		/*
		 *  For Make Year Filter.
		 */
		
		if(startYear != null && endYear!=null ) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}
		}
		
		/*
		 *  For Kilometers Filter.
		 */
		
		if(startKilo != null && endKilo!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				System.err.println("start kiloooo ;" + startKilo);
				System.err.println("End kiloooo ;" + endKilo);
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}
		}
		
		/*
		 *  For Fuel Filter.
		 */
		
		if(fuel !=null && !fuel.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.fuel = :fuel ");
				fuelParam.put("fuel", fuel);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.fuel = :fuel ");
				fuelParam.put("fuel", fuel);
			}
		}
		
		/*
		 *  For subCategoryId and Expired Filter.
		 */
		
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
			}
		
		/*
		 *  For Type Checkbox Filter.
		 */
		
		if(type!=null && !type.isEmpty()) {
			List<String> types = Arrays.asList(type.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< types.size();i++) {
					if(types.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoCarSpec.type = :type");
						
						typeParam.put("type", type);
						
					}else if(types.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoCarSpec.type = :type" + i);
							
							typeParam.put("type" + i, types.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoCarSpec.type = :type" + i);
						
						typeParam.put("type" + i, types.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.type = :type ");
				
				typeParam.put("type", type);
			}	
		}
		
		/*
		 *  For Transmission Checkbox Filter.
		 */
		
		if(transmission!=null && !transmission.isEmpty()) {
			List<String> transmissions = Arrays.asList(transmission.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< transmissions.size();i++) {
					if(transmissions.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoCarSpec.transmission = :transmission");
						
						typeParam.put("transmission", transmission);
						
					}else if(transmissions.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoCarSpec.transmission = :transmission" + i);
							
							typeParam.put("transmission" + i, transmissions.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoCarSpec.transmission = :transmission" + i);
						
						typeParam.put("transmission" + i, transmissions.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.transmission = :transmission ");
				
				typeParam.put("transmission", transmission);
			}	
		}
		
		/*
		 *  For Features Checkbox Filter.
		 */
		
		if(features!=null && !features.isEmpty()) {
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.features LIKE CONCAT('%', :features, '%')");
				
				typeParam.put("features", features);
						
			}else{
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.features LIKE CONCAT('%', :features, '%')");
				
				typeParam.put("features", features);
				}
						
			}
		
		/*
		 * End Filter.
		 */
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: fuelParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: transmissionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSubCarAds(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, typeParam, startYearParam, endYearParam, startKiloParam, endKiloParam, fuelParam, transmissionParam, featuresParam, subid);
		
		return object;
	}
	
	private long countPageableSubCarAds(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, HashMap<String, String> typeParam, HashMap<String, Integer> startYearParam, HashMap<String, Integer> endYearParam, HashMap<String, Integer> startKiloParam, HashMap<String, Integer> endKiloParam, HashMap<String, String> fuelParam, HashMap<String, String> transmissionParam, HashMap<String, String> featuresParam, int subId) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: fuelParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: transmissionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subId);
		long count = (long) query.getSingleResult();
		return count;
	}
	
	public Object[] filterSubMotoCategoryLevel(String location, String condition, Long startRange, Long endRange, String type, String anchal, Integer startLot, Integer endLot, Integer startEngine, Integer endEngine, Integer startYear, Integer endYear, Integer startKilo, Integer endKilo, String features, int page, int size, int subid) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		// For Price
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		/*
		 * Car Spec Params
		 */
		HashMap<String, String> typeParam = new HashMap<String, String>();
		HashMap<String, String> anchalParam = new HashMap<String, String>();
		HashMap<String, Integer> startLotParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endLotParam = new HashMap<String, Integer>();
		HashMap<String, Integer> startEngineParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endEngineParam = new HashMap<String, Integer>();
		HashMap<String, Integer> startYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> startKiloParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endKiloParam = new HashMap<String, Integer>();
		HashMap<String, String> featuresParam = new HashMap<String, String>();
		
		/*
		 *  For Location Filter.
		 */
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		/*
		 *  For Condition Filter.
		 */
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		/*
		 *  For Price Range Filter.
		 */
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
		
		/*
		 *  For Lot No Filter.
		 */
		
		if(startLot != null && endLot!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoMotocycleSpec.lotNo BETWEEN :startLot AND :endLot ");
				
				startLotParam.put("startLot", startLot);
				endLotParam.put("endLot", endLot);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoMotocycleSpec.lotNo BETWEEN :startLot AND :endLot ");
				
				startLotParam.put("startLot", startLot);
				endLotParam.put("endLot", endLot);
			}
		}
		
		/*
		 *  For Engine Filter.
		 */
		
		if(startEngine != null && endEngine!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoMotocycleSpec.makeYear BETWEEN :startEngine AND :endEngine ");
				
				startEngineParam.put("startEngine", startEngine);
				endEngineParam.put("endEngine", endEngine);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoMotocycleSpec.makeYear BETWEEN :startEngine AND :endEngine ");
				
				startEngineParam.put("startEngine", startEngine);
				endEngineParam.put("endEngine", endEngine);
			}
		}
		
		/*
		 *  For Make Year Filter.
		 */
		
		if(startYear != null && endYear!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoMotocycleSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoMotocycleSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}
		}
		
		/*
		 *  For Kilometers Filter.
		 */
		
		if(startKilo != null && endKilo!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoMotocycleSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoMotocycleSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				System.err.println("start kiloooo ;" + startKilo);
				System.err.println("End kiloooo ;" + endKilo);
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}
		}
		
		/*
		 *  For subCategoryId and Expired Filter.
		 */
			
		if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			queryBuilder.append(" AND ");
			queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
		}else {
			queryBuilder.append(" WHERE ");
			queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
		}
		
		/*
		 *  For Type Checkbox Filter.
		 */
		
		if(type!=null && !type.isEmpty()) {
			List<String> types = Arrays.asList(type.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< types.size();i++) {
					if(types.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoMotocycleSpec.type = :type");
						
						typeParam.put("type", type);
						
					}else if(types.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoMotocycleSpec.type = :type" + i);
							
							typeParam.put("type" + i, types.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoMotocycleSpec.type = :type" + i);
						
						typeParam.put("type" + i, types.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.type = :type ");
				
				typeParam.put("type", type);
			}	
		}
		
		/*
		 *  For Anchal Checkbox Filter.
		 */
		
		if(anchal!=null && !anchal.isEmpty()) {
			List<String> anchals = Arrays.asList(anchal.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< anchals.size();i++) {
					if(anchals.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoMotocycleSpec.anchal = :anchal");
						
						typeParam.put("anchal", anchal);
						
					}else if(anchals.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoMotocycleSpec.anchal = :anchal" + i);
							
							typeParam.put("anchal" + i, anchals.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoMotocycleSpec.anchal = :anchal" + i);
						
						typeParam.put("anchal" + i, anchals.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.anchal = :anchal ");
				
				typeParam.put("anchal", anchal);
			}	
		}
		
		/*
		 *  For Features Filter.
		 */
		
		if(features!=null && !features.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoMotocycleSpec.features LIKE CONCAT('%', :features, '%')");
						
						typeParam.put("features", features);
			}else {
					queryBuilder.append(" WHERE ");
					queryBuilder.append(" autoMotocycleSpec.features LIKE CONCAT('%', :features, '%')");
					
					typeParam.put("features", features );
				}
			}
		
		/*
		 * End Filter.
		 */
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: anchalParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startLotParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: endLotParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: startEngineParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: endEngineParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSubMotoAds(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, typeParam, anchalParam, startLotParam, endLotParam, startEngineParam, endEngineParam, startYearParam, endYearParam, startKiloParam, endKiloParam, featuresParam, subid);
		
		return object;
	}
	
	private long countPageableSubMotoAds(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, HashMap<String, String> typeParam, HashMap<String, String> anchalParam, HashMap<String, Integer> startLotParam, HashMap<String, Integer> endLotParam, HashMap<String, Integer> startEngineParam,HashMap<String, Integer> endEngineParam, HashMap<String, Integer> startYearParam, HashMap<String, Integer> endYearParam, HashMap<String, Integer> startKiloParam, HashMap<String, Integer> endKiloParam, HashMap<String, String> featuresParam, int subId) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: anchalParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startLotParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: endLotParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: startEngineParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		for(Entry<String, Integer> m: endEngineParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subId);
		long count = (long) query.getSingleResult();
		return count;
	}
	
	public Object[] filterSubCategoryLevel(String location, String condition, Long startRange, Long endRange, int page, int size, int subid) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		// For Price
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		
		/*
		 *  For Location Filter.
		 */
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		/*
		 *  For Condition Filter.
		 */
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		/*
		 *  For Price Range Filter.
		 */
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
		
		
		
		/*
		 *  For subCategoryId and Expired Filter.
		 */
			
		if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			queryBuilder.append(" AND ");
			queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
		}else {
			queryBuilder.append(" WHERE ");
			queryBuilder.append(" subCategory.subCategoryId = :subId AND expired = false ORDER BY addedDate DESC");
		}
		
		
		
		/*
		 * End Filter.
		 */
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSubAds(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, subid);
		
		return object;
	}
	
	private long countPageableSubAds(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, int subId) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("subId", subId);
		long count = (long) query.getSingleResult();
		return count;
	}
	
	
	
	/*
	 * Filter For Models :
	 * Car, Moto,
	 */
	
	public Object[] filterSubCarCategoryLevelModel(String location, String condition, Long startRange, Long endRange, String type, Integer startYear, Integer endYear, Integer startKilo, Integer endKilo, String fuel, String transmission, String features, int page, int size, int modelid) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		/*
		 * Car Spec Params
		 */
		HashMap<String, String> typeParam = new HashMap<String, String>();
		HashMap<String, Integer> startYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endYearParam = new HashMap<String, Integer>();
		HashMap<String, Integer> startKiloParam = new HashMap<String, Integer>();
		HashMap<String, Integer> endKiloParam = new HashMap<String, Integer>();
		HashMap<String, String> fuelParam = new HashMap<String, String>();
		HashMap<String, String> transmissionParam = new HashMap<String, String>();
		HashMap<String, String> featuresParam = new HashMap<String, String>();
		
		/*
		 *  For Location Filter.
		 */
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		/*
		 *  For Condition Filter.
		 */
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		/*
		 *  For Price Range Filter.
		 */
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
		
		/*
		 *  For Make Year Filter.
		 */
		
		if(startYear != null && endYear!=null ) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.makeYear BETWEEN :startYear AND :endYear ");
				
				startYearParam.put("startYear", startYear);
				endYearParam.put("endYear", endYear);
			}
		}
		
		/*
		 *  For Kilometers Filter.
		 */
		
		if(startKilo != null && endKilo!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.kilometers BETWEEN :startKilo AND :endKilo ");
				
				System.err.println("start kiloooo ;" + startKilo);
				System.err.println("End kiloooo ;" + endKilo);
				
				startKiloParam.put("startKilo", startKilo);
				endKiloParam.put("endKilo", endKilo);
			}
		}
		
		/*
		 *  For Fuel Filter.
		 */
		
		if(fuel !=null && !fuel.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.fuel = :fuel ");
				fuelParam.put("fuel", fuel);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.fuel = :fuel ");
				fuelParam.put("fuel", fuel);
			}
		}
		
		/*
		 *  For subModelId and Expired Filter.
		 */
		
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" subModel.subModelId = :modelid AND expired = false ORDER BY addedDate DESC");
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" subModel.subModelId = :modelid AND expired = false ORDER BY addedDate DESC");
			}
		
		/*
		 *  For Type Checkbox Filter.
		 */
		
		if(type!=null && !type.isEmpty()) {
			List<String> types = Arrays.asList(type.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< types.size();i++) {
					if(types.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoCarSpec.type = :type");
						
						typeParam.put("type", type);
						
					}else if(types.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoCarSpec.type = :type" + i);
							
							typeParam.put("type" + i, types.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoCarSpec.type = :type" + i);
						
						typeParam.put("type" + i, types.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.type = :type ");
				
				typeParam.put("type", type);
			}	
		}
		
		/*
		 *  For Transmission Checkbox Filter.
		 */
		
		if(transmission!=null && !transmission.isEmpty()) {
			List<String> transmissions = Arrays.asList(transmission.split(","));
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				
				for(int i=0; i< transmissions.size();i++) {
					if(transmissions.size() == 1) {
						queryBuilder.append(" AND ");
						queryBuilder.append(" autoCarSpec.transmission = :transmission");
						
						typeParam.put("transmission", transmission);
						
					}else if(transmissions.size() > 1) {
						System.err.println(">>>" + i);
						if(i == 0) {
							queryBuilder.append(" AND ");
							queryBuilder.append(" autoCarSpec.transmission = :transmission" + i);
							
							typeParam.put("transmission" + i, transmissions.get(i));
						}
						queryBuilder.append(" OR ");
						queryBuilder.append(" autoCarSpec.transmission = :transmission" + i);
						
						typeParam.put("transmission" + i, transmissions.get(i));
					}
				}
				
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.transmission = :transmission ");
				
				typeParam.put("transmission", transmission);
			}	
		}
		
		/*
		 *  For Features Checkbox Filter.
		 */
		
		if(features!=null && !features.isEmpty()) {
			
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			
				queryBuilder.append(" AND ");
				queryBuilder.append(" autoCarSpec.features LIKE CONCAT('%', :features, '%')");
				
				typeParam.put("features", features);
						
			}else{
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" autoCarSpec.features LIKE CONCAT('%', :features, '%')");
				
				typeParam.put("features", features);
				}
						
			}
		
		/*
		 * End Filter.
		 */
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: fuelParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: transmissionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("modelid", modelid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSubCarAdsModel(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, typeParam, startYearParam, endYearParam, startKiloParam, endKiloParam, fuelParam, transmissionParam, featuresParam, modelid);
		
		return object;
	}
	
	private long countPageableSubCarAdsModel(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, HashMap<String, String> typeParam, HashMap<String, Integer> startYearParam, HashMap<String, Integer> endYearParam, HashMap<String, Integer> startKiloParam, HashMap<String, Integer> endKiloParam, HashMap<String, String> fuelParam, HashMap<String, String> transmissionParam, HashMap<String, String> featuresParam, int modelid) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: typeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endYearParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: startKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Integer> m: endKiloParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: fuelParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: transmissionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: featuresParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("modelid", modelid);
		long count = (long) query.getSingleResult();
		return count;
	}
	
	public Object[] filterSubCategoryLevelModel(String location, String condition, Long startRange, Long endRange, int page, int size, int modelid) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("FROM MainAds ");
		
		/*
		 * Core filter logic starts
		 */
		
		HashMap<String, String> locationParam = new HashMap<String, String>();
		HashMap<String, String> conditionParam = new HashMap<String, String>();
		
		// For Price
		
		HashMap<String, Long> startRangeParam = new HashMap<String, Long>();
		HashMap<String, Long> endRangeParam = new HashMap<String, Long>();
		
		
		/*
		 *  For Location Filter.
		 */
		
		if(location !=null && !location.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" customer.cityName = :cityName ");
				locationParam.put("cityName", location);
			}
		}
		
		/*
		 *  For Condition Filter.
		 */
		
		if(condition !=null && !condition.isEmpty()) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" commonSpec.specCondition = :condition ");
				conditionParam.put("condition", condition);
			}
		}
		
		/*
		 *  For Price Range Filter.
		 */
		
		if(startRange != null && endRange!=null) {
			if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
				queryBuilder.append(" AND ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}else {
				queryBuilder.append(" WHERE ");
				queryBuilder.append(" price BETWEEN :startRange AND :endRange ");
				
				startRangeParam.put("startRange", startRange);
				endRangeParam.put("endRange", endRange);
			}
		}
		
		
		
		/*
		 *  For subCategoryId and Expired Filter.
		 */
			
		if(queryBuilder.toString().indexOf(" WHERE ") != -1) {
			queryBuilder.append(" AND ");
			queryBuilder.append(" subModel.subModelId = :modelid AND expired = false ORDER BY addedDate DESC");
		}else {
			queryBuilder.append(" WHERE ");
			queryBuilder.append(" subModel.subModelId = :modelid AND expired = false ORDER BY addedDate DESC");
		}
		
		
		
		/*
		 * End Filter.
		 */
		
		System.out.println(queryBuilder.toString());
		
		Query query = entityManager.createQuery(queryBuilder.toString());
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("modelid", modelid);
		
		/*
		 * Paginatinon Logic
		 */
		
		int adsIndex = page-1;
		
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + queryBuilder.toString();
		
		object[1] = countPageableSubAdsModel(countQuery, conditionParam, locationParam, startRangeParam, endRangeParam, modelid);
		
		return object;
	}
	
	private long countPageableSubAdsModel(String countQuery, HashMap<String, String> conditionParam,
			HashMap<String, String> locationParam, HashMap<String, Long> startRangeParam, HashMap<String, Long> endRangeParam, int modelid) {
		Query query = entityManager.createQuery(countQuery);
		
		for(Entry<String, String> m: conditionParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, String> m: locationParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: startRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		for(Entry<String, Long> m: endRangeParam.entrySet()) {
			query.setParameter(m.getKey(), m.getValue());
		}
		
		query.setParameter("modelid", modelid);
		long count = (long) query.getSingleResult();
		return count;
	}

}
