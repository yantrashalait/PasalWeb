package com.vortexnepal.pasal.ads.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.ads.model.Picture;

public interface PictureRepository extends CrudRepository<Picture, Integer>{
	List<Picture> findByMainAdsId(int id);
	List<Picture> findByHousingHousingId(int id);
	List<Picture> findByCarCarId(int id);
}
