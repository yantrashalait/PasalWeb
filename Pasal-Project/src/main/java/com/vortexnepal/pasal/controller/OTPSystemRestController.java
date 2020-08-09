package com.vortexnepal.pasal.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import com.vortexnepal.pasal.model.OTPSystem;
import com.vortexnepal.pasal.repository.CustomerRepository;

@RestController
public class OTPSystemRestController {
	
	private Map<String, OTPSystem> otp_data =  new HashMap<>();
	/*
	 * You can get your account_sid & auth_id
	 */
    public static final String ACCOUNT_SID = "ACe3f8c565c4dbf5d2d614fc21cf60bce6";
    public static final String AUTH_ID = "3990113cad527bda09411505fedeebee";
    
	@Autowired
	CustomerRepository customerRepo;
	
	static {
		Twilio.init(ACCOUNT_SID, AUTH_ID);
	}
	
	@PostMapping("/mobilenumbers/{mobilenum}/otp")
	public ResponseEntity<Object> sendOTP(@PathVariable("mobilenum") String mobilenum){
		String twilioNumber = "+12073877824"; //Please enter your twilio Number
		String mobilenumber =  "+977"+ mobilenum;
		OTPSystem otpSystem = new OTPSystem();
		otpSystem.setMobilenumber(mobilenumber);
		otpSystem.setOtp(String.valueOf((int)(Math.random()*(10000-1000))));
		otpSystem.setExpirytime(System.currentTimeMillis()+20000);
		
		otp_data.put(mobilenumber, otpSystem);
		
		Message.creator(new PhoneNumber(mobilenumber), new PhoneNumber(twilioNumber), "Your OTP-Token is: " + otpSystem.getOtp()).create();
		
		return new ResponseEntity<Object>("OTP is Successfully Send", HttpStatus.OK);
	}
	
	@PutMapping("/mobilenumbers/{customerid}/{mobilenumber}/otp")
	public ResponseEntity<Object> verifyOTP(@PathVariable("mobilenumber") String mobilenumber,@PathVariable("customerid") int customerId, @RequestBody OTPSystem requestBodyOTPSystem){
		
		System.err.println("mobile Number Verify number >>>>>> "+ mobilenumber);
		
		if(requestBodyOTPSystem.getOtp()==null || requestBodyOTPSystem.getOtp().trim().length()<=0) {
			return new ResponseEntity<Object>("Please provide OTP.",HttpStatus.BAD_REQUEST);
		}
		
		if(otp_data.containsKey("+977"+mobilenumber)) {
			OTPSystem otpSystem = otp_data.get("+977"+mobilenumber);
			if(otpSystem!=null) {
				if(otpSystem.getExpirytime()>=System.currentTimeMillis()) {
					if(requestBodyOTPSystem.getOtp().equals(otpSystem.getOtp())) {
						otp_data.remove("+977"+mobilenumber);
						customerRepo.updateVerified(customerId, true);
						
						return new ResponseEntity<Object>("OTP is Verified Successfully",HttpStatus.OK);
					}
					return new ResponseEntity<Object>("Invalid OTP",HttpStatus.BAD_REQUEST);
				}
				return new ResponseEntity<Object>("OTP is Expired",HttpStatus.BAD_REQUEST);
			}
			return new ResponseEntity<Object>("Something went Wrong!!",HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Object>("MObile Number Not Found", HttpStatus.NOT_FOUND);
	}
}
