package com.vortexnepal.pasal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_models")
public class SubModel {
	@Id
	@Column(name="model_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int subModelId;
	@Column(name="model_name")
	private String subModelName;
	
	@ManyToOne
	@JoinColumn(name = "sub_category_id", unique=false)
	private SubCategory subCategory;

	public SubModel() {
	}

	public int getSubModelId() {
		return subModelId;
	}

	public void setSubModelId(int subModelId) {
		this.subModelId = subModelId;
	}

	public String getSubModelName() {
		return subModelName;
	}

	public void setSubModelName(String subModelName) {
		this.subModelName = subModelName;
	}

	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}
	
	
}
