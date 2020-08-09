package com.vortexnepal.pasal.ads.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.vortexnepal.pasal.model.Car;
import com.vortexnepal.pasal.model.Housing;

@Entity
@Table(name="tbl_pictures")
public class Picture {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String pictureName;
	@Transient
	private MultipartFile pictureFile;
	
	@ManyToOne
	@JoinColumn(name = "main_ads_id")
	private MainAds mainAds;
	
	@ManyToOne
	@JoinColumn(name = "housing_id")
	private Housing housing;
	
	@ManyToOne
	@JoinColumn(name = "car_id")
	private Car car;
	
	public Picture() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public MainAds getMainAds() {
		return mainAds;
	}

	public void setMainAds(MainAds mainAds) {
		this.mainAds = mainAds;
	}

	public MultipartFile getPictureFile() {
		return pictureFile;
	}

	public void setPictureFile(MultipartFile pictureFile) {
		this.pictureFile = pictureFile;
	}

	public Housing getHousing() {
		return housing;
	}

	public void setHousing(Housing housing) {
		this.housing = housing;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
	
}
