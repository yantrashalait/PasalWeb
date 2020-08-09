package com.vortexnepal.pasal.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="tbl_users")
public class User {
	@Id
	@NotEmpty(message = "email field must not be empty")
	@Size(max = 100, message = "Email too long")
	private String email;
	@Size(max = 30, message = "You sure you can remember password that long?")
	@NotEmpty(message="Password field must not be empty")
	private String password;
	
	private boolean enabled;
	
	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY, mappedBy="user")
	private UserRole userRole;
	
	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY, mappedBy="user")
	private Customer customer;
	
	public User() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}
