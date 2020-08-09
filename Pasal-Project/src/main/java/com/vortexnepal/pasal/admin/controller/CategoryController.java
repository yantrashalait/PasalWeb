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

import com.vortexnepal.pasal.model.Category;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.CategoryRepository;

@Controller
@RequestMapping("/admin")
public class CategoryController {
	
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private BrandRepository brandRepo;
	
	@GetMapping("category")
	public String getCategories(Model model) {
		model.addAttribute("categories", categoryRepo.findAll());
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		return "admin/category/category";
	}
	
	@GetMapping("addcategory")
	public String addCategory(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		
		return "admin/category/addCategory";
	}
	
	@PostMapping("addcategory/save")
	public String addCategory(@ModelAttribute("category") Category category) {
		categoryRepo.save(category);
		return "redirect:/admin/category";
	}
	
	@GetMapping("editcategory/{categoryId}")
	public String editCategory(@PathVariable("categoryId") int id, Model model) {
		model.addAttribute("category", categoryRepo.findOne(id));
		return "admin/category/editCategory";
	}
	
	@PostMapping("editcategory/save")
	public String editCategory(@Valid @ModelAttribute("category") Category category) {
		try {
			categoryRepo.save(category);
			return "redirect:/admin/category?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/category?error";
		}
	}
	
	@GetMapping("deletecategory/{categoryId}")
	public String deleteCategory(@PathVariable("categoryId") int id) {
		categoryRepo.delete(categoryRepo.findOne(id));
		return "redirect:/admin/category";
	}
	
}
