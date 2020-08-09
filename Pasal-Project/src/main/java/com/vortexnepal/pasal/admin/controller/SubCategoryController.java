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

import com.vortexnepal.pasal.model.SubCategory;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.CategoryRepository;
import com.vortexnepal.pasal.repository.SubCategoryRepository;

@Controller
@RequestMapping("/admin")
public class SubCategoryController {
	
	@Autowired
	private SubCategoryRepository subCategoryRepo;
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private BrandRepository brandRepo;
	
	@GetMapping("subcategory")
	public String getCategories(Model model) {
		model.addAttribute("subcategories", subCategoryRepo.findAll());
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		return "admin/subcategory/subCategory";
	}
	
	@GetMapping("addsubcategory")
	public String addCategory(Model model) {
		SubCategory subCategory = new SubCategory();
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("categories", categoryRepo.findAll());
		model.addAttribute("subcategories", subCategoryRepo.findAll());
		
		return "admin/subcategory/addSubCategory";
	}
	
	@PostMapping("addsubcategory/save")
	public String addSubCategory(@ModelAttribute("subcategory") SubCategory subCategory) {
		try {
			subCategoryRepo.save(subCategory);
			return "redirect:/admin/subcategory?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/subcategory?error";
		}
	}
	
	@GetMapping("editsubcategory/{subCategoryId}")
	public String editSubCategory(@PathVariable("subCategoryId") int id, Model model) {
		model.addAttribute("subcategory", subCategoryRepo.findOne(id));
		model.addAttribute("categories", categoryRepo.findAll());
		return "admin/subcategory/editSubCategory";
	}
	
	@PostMapping("editsubcategory/save")
	public String editSubCategory(@Valid @ModelAttribute("subcategory") SubCategory subCategory) {
		try {
			subCategoryRepo.save(subCategory);
			return "redirect:/admin/subcategory?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/subcategory?error";
		}
	}
	
	@GetMapping("deletesubcategory/{subCategoryId}")
	public String deleteCategory(@PathVariable("subCategoryId") int id) {
		subCategoryRepo.delete(subCategoryRepo.findOne(id));
		return "redirect:/admin/subcategory";
	}
	
}
