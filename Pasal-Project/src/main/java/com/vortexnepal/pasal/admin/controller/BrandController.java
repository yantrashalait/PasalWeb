package com.vortexnepal.pasal.admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vortexnepal.pasal.model.Brand;
import com.vortexnepal.pasal.repository.BrandRepository;

@Controller
@RequestMapping(value="/admin")
public class BrandController {
	
	@Autowired
	private BrandRepository brandRepo;
	
	@GetMapping("brands")
	public String getBrand(Model model) {
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		return  "admin/module/brand/brand";
	}
	
	@GetMapping("addbrand")
	public String addBrand(Model model) {
		Brand brand = new Brand();
		model.addAttribute("brand", brand);
		
		return "admin/module/brand/addBrand";
	}
	
	@PostMapping("addbrand/save")
	public String addBrand(@ModelAttribute("brand") Brand brand) {
		try {
			if(brandRepo.findByBrandName(brand.getBrandName()) != null) {
				return "redirect:/admin/addbrand?error";
			}
			
			brandRepo.save(brand);
			return "redirect:/admin/brands";
			
		}catch(NullPointerException nu) {
			return "redirect:/admin/addbrand?error";
		}
	}
	
	@GetMapping("editbrand/{brandId}")
	public String editBrand(@PathVariable("brandId") int id, Model model) {
		model.addAttribute("brand", brandRepo.findOne(id));
		return "admin/module/brand/editBrand";
	}
	
	@PostMapping("editbrand/save")
	public String editBrand(@Valid @ModelAttribute("brand") Brand brand) {
		try {
			brandRepo.save(brand);
			return "redirect:/admin/brands?success";
		}catch(NullPointerException ex) {
			ex.printStackTrace();
			return "redirect:/admin/brands?error";
		}
	}
	
	@GetMapping("deletebrand/{brandId}")
	public String deleteBrand(@PathVariable("brandId") int id) {
		brandRepo.delete(brandRepo.findOne(id));
		return "redirect:/admin/brands";
	}
	
	@GetMapping("activatebrand/{brandId}")
	public String activateBrand(@PathVariable("brandId") int brandId) {
		
		Brand brand = brandRepo.findOne(brandId);
		
		if(brand.getType().equalsIgnoreCase("housing")) {
			brand.setActivate(true);
			brandRepo.save(brand);
			
			for(Brand b : brandRepo.findByType("housing")) {
				if(b != brand) {
					b.setActivate(false);
					brandRepo.save(b);
				}
			}
			return  "redirect:/admin/brands?success";
		}else if(brand.getType().equalsIgnoreCase("cars")) {
			brand.setActivate(true);
			brandRepo.save(brand);
			
			for(Brand b : brandRepo.findByType("cars")) {
				if(b != brand) {
					b.setActivate(false);
					brandRepo.save(b);
				}
			}
			return  "redirect:/admin/brands?success";
		}
		return "redirect:/admin/brands?error";
	}

}
