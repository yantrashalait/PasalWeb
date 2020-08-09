package com.vortexnepal.pasal.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.vortexnepal.pasal.ads.model.Picture;

@Entity
@Table(name="tbl_housings")
public class Housing {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int housingId;
	private String housingName;
	private int bedroom;
	private int bathroom;
	private int area;
	private String description;
	private String purpose;
	private double price;
	private String type;
	private String laundry;
	private String heating;
	private String cooling;
	private String pets;
	private String parking;
	private String available;
	@Temporal(TemporalType.DATE)
	private Date addedDate;
	private int unitFloor;
	private double rentPerSqft;
	private String flooring;
	private String appliances;
	private int dates;
	private String others;
	
	@ManyToOne
	@JoinColumn(name = "brand_id", unique=false)
	private Brand brand;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "housing")
	@JsonIgnore
	private List<Picture> picture = new ArrayList<>();
	
	public Housing() {
		// TODO Auto-generated constructor stub
	}

	public int getHousingId() {
		return housingId;
	}

	public void setHousingId(int housingId) {
		this.housingId = housingId;
	}

	public String getHousingName() {
		return housingName;
	}

	public void setHousingName(String housingName) {
		this.housingName = housingName;
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

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLaundry() {
		return laundry;
	}

	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}

	public String getHeating() {
		return heating;
	}

	public void setHeating(String heating) {
		this.heating = heating;
	}

	public String getCooling() {
		return cooling;
	}

	public void setCooling(String cooling) {
		this.cooling = cooling;
	}

	public String getPets() {
		return pets;
	}

	public void setPets(String pets) {
		this.pets = pets;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public int getUnitFloor() {
		return unitFloor;
	}

	public void setUnitFloor(int unitFloor) {
		this.unitFloor = unitFloor;
	}

	public double getRentPerSqft() {
		return rentPerSqft;
	}

	public void setRentPerSqft(double rentPerSqft) {
		this.rentPerSqft = rentPerSqft;
	}

	public String getFlooring() {
		return flooring;
	}

	public void setFlooring(String flooring) {
		this.flooring = flooring;
	}

	public String getAppliances() {
		return appliances;
	}

	public void setAppliances(String appliances) {
		this.appliances = appliances;
	}

	public int getDates() {
		return dates;
	}

	public void setDates(int dates) {
		this.dates = dates;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}
	
}
