package com.vortexnepal.pasal.ads.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;

import com.vortexnepal.pasal.model.Customer;
import com.vortexnepal.pasal.model.SubCategory;
import com.vortexnepal.pasal.model.SubModel;
import com.vortexnepal.pasal.spec.model.AutoCarSpec;
import com.vortexnepal.pasal.spec.model.AutoMotocycleSpec;
import com.vortexnepal.pasal.spec.model.CommonSpec;

@Entity
@Table(name = "tbl_main_ads")
public class MainAds {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "main_ads_id")
	private int id;
	@NotEmpty(message = "Please enter your Title.")
	private String adTitle;
	private String description;
	private int adRunDays;
	@Min(value = 10, message = "Price should be more than or equals to 10")
	private long price;
	private String priceNegotiable;
	@Temporal(TemporalType.DATE)
	@Column(name = "added_date")
	private Date addedDate;
	@Temporal(TemporalType.DATE)
	@Column(name = "expiry_date")
	private Date expiryDate;
	private int viewCount;
	private boolean expired;
	private boolean featured;

	@ManyToOne
	@JoinColumn(name = "sub_category_id")
	private SubCategory subCategory;

	@ManyToOne
	@JoinColumn(name = "model_id")
	private SubModel subModel;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	@OneToMany(mappedBy = "mainAds", cascade = CascadeType.ALL, orphanRemoval = false)
	private List<Picture> picture;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mainAds")
	private Delivery delivery;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mainAds")
	private Warranty warranty;

	@OneToOne(mappedBy = "mainAds")
	private CommonSpec commonSpec;

	@OneToOne(mappedBy = "mainAds")
	private AutoCarSpec autoCarSpec;

	@OneToOne(mappedBy = "mainAds")
	private AutoMotocycleSpec autoMotocycleSpec;

	public MainAds() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAdRunDays() {
		return adRunDays;
	}

	public void setAdRunDays(int adRunDays) {
		this.adRunDays = adRunDays;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getPriceNegotiable() {
		return priceNegotiable;
	}

	public void setPriceNegotiable(String priceNegotiable) {
		this.priceNegotiable = priceNegotiable;
	}

	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	public SubModel getSubModel() {
		return subModel;
	}

	public void setSubModel(SubModel subModel) {
		this.subModel = subModel;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	public Warranty getWarranty() {
		return warranty;
	}

	public void setWarranty(Warranty warranty) {
		this.warranty = warranty;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public boolean isExpired() {
		return expired;
	}

	public void setExpired(boolean expired) {
		this.expired = expired;
	}

	public AutoCarSpec getAutoCarSpec() {
		return autoCarSpec;
	}

	public void setAutoCarSpec(AutoCarSpec autoCarSpec) {
		this.autoCarSpec = autoCarSpec;
	}

	public AutoMotocycleSpec getAutoMotocycleSpec() {
		return autoMotocycleSpec;
	}

	public void setAutoMotocycleSpec(AutoMotocycleSpec autoMotocycleSpec) {
		this.autoMotocycleSpec = autoMotocycleSpec;
	}

	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}

	public CommonSpec getCommonSpec() {
		return commonSpec;
	}

	public void setCommonSpec(CommonSpec commonSpec) {
		this.commonSpec = commonSpec;
	}

	public boolean isFeatured() {
		return featured;
	}

	public void setFeatured(boolean featured) {
		this.featured = featured;
	}

}