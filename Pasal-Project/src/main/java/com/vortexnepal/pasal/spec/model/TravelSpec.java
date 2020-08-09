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
@Table(name="tbl_travel_spec")
public class TravelSpec {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String duration;
	private int rating;
	private String inclusion;
	
	@OneToOne
	@JoinColumn(name="main_ads_id", unique=true)
	private MainAds mainAds;
	
	public TravelSpec() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getInclusion() {
		return inclusion;
	}

	public void setInclusion(String inclusion) {
		this.inclusion = inclusion;
	}

	public MainAds getMainAds() {
		return mainAds;
	}

	public void setMainAds(MainAds mainAds) {
		this.mainAds = mainAds;
	}
	
}
