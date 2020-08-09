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
@Table(name="tbl_motocycle_spec")
public class AutoMotocycleSpec {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String type;
	private String anchal;
	private int lotNo;
	private int engine;
	private int makeYear;
	private String mileage;
	private int kilometers;
	private String features;
	
	@OneToOne
	@JoinColumn(name="main_ads_id", unique=true)
	private MainAds mainAds;
	
	public AutoMotocycleSpec() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAnchal() {
		return anchal;
	}

	public void setAnchal(String anchal) {
		this.anchal = anchal;
	}
	
	public int getLotNo() {
		return lotNo;
	}

	public void setLotNo(int lotNo) {
		this.lotNo = lotNo;
	}

	public int getEngine() {
		return engine;
	}

	public void setEngine(int engine) {
		this.engine = engine;
	}

	public int getMakeYear() {
		return makeYear;
	}

	public void setMakeYear(int makeYear) {
		this.makeYear = makeYear;
	}

	public int getKilometers() {
		return kilometers;
	}

	public void setKilometers(int kilometers) {
		this.kilometers = kilometers;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
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
