package com.vortexnepal.pasal.repository;

import org.springframework.data.repository.CrudRepository;

import com.vortexnepal.pasal.model.User;

public interface UserRepository extends CrudRepository<User, String>{
	User findByEmail(String email);
	User findByEmailAndPasswordAndEnabled(String email, String password, boolean enabled);
}
