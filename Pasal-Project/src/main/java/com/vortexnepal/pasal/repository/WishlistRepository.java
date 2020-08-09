package com.vortexnepal.pasal.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.model.Wishlist;

public interface WishlistRepository extends CrudRepository<Wishlist, Integer>{
	List<Wishlist> findByCustomerCustomerId(int id);
	Wishlist findByIdAndCustomerCustomerId(int id, int customerId);
}
