package com.vortexnepal.pasal.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.vortexnepal.pasal.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer>{
	Customer findByUserEmail(String email);
	
	@Query("Select COUNT(*) from Customer")
	int countAllCustomers();
	
	@Transactional
	@Modifying
    @Query("UPDATE Customer c SET c.verified = :verified WHERE c.customerId = :customerId")
    void updateVerified(@Param("customerId") int customerId, @Param("verified") boolean verified);
}
