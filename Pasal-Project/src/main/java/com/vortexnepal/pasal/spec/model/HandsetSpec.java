package com.vortexnepal.pasal.spec.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.vortexnepal.pasal.ads.model.MainAds;

@Entity
@Table(name="tbl_handset_spec")
public class HandsetSpec {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String ownership;
	private String simSlot;
	private String screenSize;
	@Column(name="smartphone_OS")
	private String smartphoneOS;
	private String backCamera;
	private String frontCamera;
	private String cpuCore;
	private String ram;
	private String internalStorage;
	private String features;
	
	@OneToOne
	@JoinColumn(name="main_ads_id", unique=true)
	private MainAds mainAds;
	
	public HandsetSpec() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOwnership() {
		return ownership;
	}

	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}

	public String getSimSlot() {
		return simSlot;
	}

	public void setSimSlot(String simSlot) {
		this.simSlot = simSlot;
	}

	public String getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(String screenSize) {
		this.screenSize = screenSize;
	}

	public String getSmartphoneOS() {
		return smartphoneOS;
	}

	public void setSmartphoneOS(String smartphoneOS) {
		this.smartphoneOS = smartphoneOS;
	}

	public String getBackCamera() {
		return backCamera;
	}

	public void setBackCamera(String backCamera) {
		this.backCamera = backCamera;
	}

	public String getFrontCamera() {
		return frontCamera;
	}

	public void setFrontCamera(String frontCamera) {
		this.frontCamera = frontCamera;
	}

	public String getCpuCore() {
		return cpuCore;
	}

	public void setCpuCore(String cpuCore) {
		this.cpuCore = cpuCore;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getInternalStorage() {
		return internalStorage;
	}

	public void setInternalStorage(String internalStorage) {
		this.internalStorage = internalStorage;
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
