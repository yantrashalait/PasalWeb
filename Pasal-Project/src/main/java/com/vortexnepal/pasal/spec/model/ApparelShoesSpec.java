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
@Table(name="tbl_shoes_spec")
public class ApparelShoesSpec {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String type;
	private String size;
	private String color;
	
	@OneToOne
	@JoinColumn(name="main_ads_id", unique=true)
	private MainAds mainAds;
	
	public ApparelShoesSpec() {
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

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public MainAds getMainAds() {
		return mainAds;
	}

	public void setMainAds(MainAds mainAds) {
		this.mainAds = mainAds;
	}
	
}
