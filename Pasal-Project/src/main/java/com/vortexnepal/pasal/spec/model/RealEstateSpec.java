package com.vortexnepal.pasal.spec.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.vortexnepal.pasal.ads.model.MainAds;

@Entity
@Table(name="tbl_realestate_spec")
public class RealEstateSpec {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String propertyType;
	private String area;
	private String propertyLocation;
	private String accessRoad;
	private int landSize;
	private int floors;
	private int builtUp;
	private int bedroom;
	private int bathroom;
	private int livingroom;
	private String waterSupply;
	private String furnishing;
	private String features;
	
	@OneToOne
	@JoinColumn(name="main_ads_id", unique=true)
	private MainAds mainAds;
	
	public RealEstateSpec() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPropertyLocation() {
		return propertyLocation;
	}

	public void setPropertyLocation(String propertyLocation) {
		this.propertyLocation = propertyLocation;
	}

	public String getAccessRoad() {
		return accessRoad;
	}

	public void setAccessRoad(String accessRoad) {
		this.accessRoad = accessRoad;
	}

	public int getLandSize() {
		return landSize;
	}

	public void setLandSize(int landSize) {
		this.landSize = landSize;
	}

	public int getFloors() {
		return floors;
	}

	public void setFloors(int floors) {
		this.floors = floors;
	}

	public int getBuiltUp() {
		return builtUp;
	}

	public void setBuiltUp(int builtUp) {
		this.builtUp = builtUp;
	}

	public int getBedroom() {
		return bedroom;
	}

	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}

	public int getBathroom() {
		return bathroom;
	}

	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}

	public int getLivingroom() {
		return livingroom;
	}

	public void setLivingroom(int livingroom) {
		this.livingroom = livingroom;
	}

	public String getWaterSupply() {
		return waterSupply;
	}

	public void setWaterSupply(String waterSupply) {
		this.waterSupply = waterSupply;
	}

	public String getFurnishing() {
		return furnishing;
	}

	public void setFurnishing(String furnishing) {
		this.furnishing = furnishing;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public MainAds getMainAds() {
		return mainAds;
	}

	public void setMainAds(MainAds mainAds) {
		this.mainAds = mainAds;
	}
}
