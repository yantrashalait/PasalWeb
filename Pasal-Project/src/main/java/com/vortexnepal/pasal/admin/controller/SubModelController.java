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
import com.vortexnepal.pasal.model.SubModel;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.SubCategoryRepository;
import com.vortexnepal.pasal.repository.SubModelRepository;

@Controller
@RequestMapping("/admin")
public class SubModelController {
	@Autowired
	private SubModelRepository subModelRepo;
	@Autowired
	private SubCategoryRepository subCategoryRepo;
	@Autowired
	private BrandRepository brandRepo;
	
	@GetMapping("submodel")
	public String getSubModel(Model model) {
		model.addAttribute("submodel", subModelRepo.findAll());
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		return "admin/submodel/subModel";
	}
	
	@GetMapping("addsubmodel")
	public String addSubModel(Model model) {
		SubModel submodel = new SubModel();
		model.addAttribute("submodel", submodel);
		model.addAttribute("subcategories", subCategoryRepo.findAll());
		
		return "admin/submodel/addSubModel";
	}
	
	@PostMapping("addsubmodel/save")
	public String addSubModel(@ModelAttribute("submodel") SubModel subModel) {
		try {
			subModelRepo.save(subModel);
			return "redirect:/admin/submodel?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/submodel?error";
		}
	}
	
	@GetMapping("editsubmodel/{subModelId}")
	public String editSubModel(@PathVariable("subModelId") int id, Model model) {
		model.addAttribute("submodel", subModelRepo.findOne(id));
		model.addAttribute("subcategories", subCategoryRepo.findAll());
		return "admin/submodel/editSubModel";
	}
	
	@PostMapping("editsubmodel/save")
	public String editSubModel(@Valid @ModelAttribute("submodel") SubModel subModel) {
		try {
			subModelRepo.save(subModel);
			return "redirect:/admin/submodel?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/submodel?error";
		}
	}
	
	@GetMapping("deletesubmodel/{subModelId}")
	public String deleteModel(@PathVariable("subModelId") int id) {
		subModelRepo.delete(subModelRepo.findOne(id));
		return "redirect:/admin/submodel";
	}
}
