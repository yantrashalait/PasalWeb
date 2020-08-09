package com.vortexnepal.pasal.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/send-mail")
public class SendMailController {
	@Autowired
    private JavaMailSender sender;
	
	@PostMapping()
	public String sendMail(@RequestParam String name,@RequestParam String date,@RequestParam String phone, @RequestParam String email, @RequestParam String subject, @RequestParam("message") String text) throws MessagingException{
		/*
		 * Spring Mail dependency Added.
		 * Helper and Message is from the dependency.
		 * This Email is for the admin regarding the tour details.
		 */
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		
        helper.setTo("premtamang046@gmail.com");	//Main mail Address from which we recieve - mail address
        helper.setSubject("New message from Pasal E-Market site"); 
        helper.setText("<p>You have received a new message. Here are the details:</p>"
        		+ "Date For Tour: "+date+"<br/>"
        		+ "Name: "+name+"<br/>"
        		+ "Phone: "+phone+"<br/>"
        		+ "Email: "+email+"<br/>"
        		+ "Subject: "+subject+"<br/>"
        		+ "Message: "+text+"<br/>", true);
        
        sender.send(message);
        
        /*
         * This Email is send to the Customer that Request a Tour.
         */
        helper.setTo(email);
        helper.setSubject("Thank you for your inquiry,	"+name);
        helper.setText("Thank you for your inquiry. <br/>"
        		+ "We will respond as soon as possible. <br/><br/>"
        		+ "Pasal | E-Market Buy and Sell Anything<br/>"
        		+ "Kathmandu, Nepal <br/>" //Address
        		+ "email: mail@pasal.com.np<br/>" //Respective Site email
        		+ "www.pasal.com.np", true); //Respective site address
        sender.send(message);
        
        System.err.println("Subject -> "+ subject);
        
        if(subject.equalsIgnoreCase("Housing")) {
        		return "redirect:/housing?success";
        }else{
        	return "redirect:/car?success";
        }
	}
}

