package com.vortexnepal.pasal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sub_categories")
public class SubCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int subCategoryId;
	private String subCategoryName;
	
	@ManyToOne
	@JoinColumn(name = "category_id", unique=false)
	private Category category;
	
	public SubCategory() {
		// TODO Auto-generated constructor stub
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	
}
