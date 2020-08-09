package com.vortexnepal.pasal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.vortexnepal.pasal.ads.model.MainAds;

@Entity
@Table(name="tbl_wishlist")
public class Wishlist {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name = "main_ads_id")
	private MainAds mainads;
	
	public Wishlist() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public MainAds getMainads() {
		return mainads;
	}

	public void setMainads(MainAds mainads) {
		this.mainads = mainads;
	}
	
	
}
