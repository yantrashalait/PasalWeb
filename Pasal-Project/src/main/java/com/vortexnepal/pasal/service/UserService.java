package com.vortexnepal.pasal.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vortexnepal.pasal.model.User;
import com.vortexnepal.pasal.repository.UserRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	UserRepository userRepository;
	
	/*
	 * User Crud Operation
	 */
	public void save(User user){
		userRepository.save(user);
	}
	
	public User getUserByEmail(String email){
		return userRepository.findByEmail(email);
	}
	
	public void delete(User user){
		userRepository.delete(user);
	}
	
	/*
	 * User operations
	 */
	public User findByEmailPassAndEnabled(String email, String pass, boolean enabled){
		return userRepository.findByEmailAndPasswordAndEnabled(email, pass, enabled);
	}
}
