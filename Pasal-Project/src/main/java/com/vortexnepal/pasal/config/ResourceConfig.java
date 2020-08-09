
package com.vortexnepal.pasal.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ResourceConfig extends WebMvcConfigurerAdapter {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("pasal/images/**")
				.addResourceLocations("file:///Users/sumanheuju/eclipse/pasalImages/");   //This is the location of the imageFile : Source :Please give your server source 
	}
}

//"file:///home_ssd/heuju33/pasal/pasalImages/"
//"file:///Users/sumanheuju/eclipse/pasalImages/"
