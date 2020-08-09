package com.vortexnepal.pasal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.vortexnepal.pasal.model.Customer;
import com.vortexnepal.pasal.repository.CustomerRepository;

@ControllerAdvice
public class GlobalControllerAdvice {
	
	@Autowired
	private CustomerRepository customerRepo;
	
	@ModelAttribute("customer")
	public Customer getCurrentCustomer() {
		/*
		 *  Making the customer a global object.
		 *  Using Controller Advice annotation for making it global.
		 *  if want to make it to certain controller only then do as follows:
		 *  @ControllerAdvice(assignableTypes=FooController.class,BarController.class})
			or
			@ControllerAdvice(basePackages="foo.bar.web.admin","foo.bar.web.management"}))
		 *  TASK:
		 *  Identify email taken from session and find the customer object which it indicates.
		 *  Return the founded customer object.
		 */
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			Customer customer = customerRepo.findByUserEmail(auth.getName());
			return customer;
		}catch(Exception ex) {
			ex.getMessage();
		}
		
		return null;
	}
}
