package com.vortexnepal.pasal.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.ads.model.Picture;
import com.vortexnepal.pasal.ads.repository.MainAdsRepository;
import com.vortexnepal.pasal.ads.repository.PictureRepository;

@Controller
public class PictureController {
	private final String homeDir = System.getProperty("user.home");
	private Path path;
	
	@Autowired
	private MainAdsRepository mainAdsRepo;
	@Autowired
	private PictureRepository pictureRepo;
	
	@GetMapping("/savePicture/{id}")
	public String savePicture(Model model, @PathVariable("id") int id) {
		/*
		 * Identifying the MainAds Object.
		 */
		try {
			MainAds mainAds = mainAdsRepo.findOne(id);
			String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
			// If the adv belongs to the respective person
			if(mainAds.getCustomer().getUser().getEmail().equals(userEmail)) {
				model.addAttribute("mainads", mainAds);
				/*
				 * Save The Picture Object.
				 */
				Picture picture = new Picture();
				model.addAttribute("picture", picture);
				
				model.addAttribute("pictures", pictureRepo.findByMainAdsId(id));
				
				return "site/picture/addPicture";
			}else {
				return "redirect:/error";
			}
		}catch(NullPointerException ex) {
			return "redirect:/error";
		}		
	}
	
	@PostMapping("/savePicture/{id}")
	public String savePicture(@ModelAttribute("picture") Picture picture,@PathVariable("id") int id) {
		MainAds main = mainAdsRepo.findOne(id);
		try {
			
			Picture pic = new Picture();
			
			pic.setPictureName(main.getSubCategory().getCategory().getCategoryName()+"_"+
					main.getSubCategory().getSubCategoryName()+"_"+
					picture.getPictureFile().getOriginalFilename());
			
			picture.setPictureName(main.getSubCategory().getCategory().getCategoryName()+"_"+
					main.getSubCategory().getSubCategoryName()+"_"+
					picture.getPictureFile().getOriginalFilename());
			
			pic.setMainAds(main);
			
			imageSave(picture);
			
			pictureRepo.save(pic);
			return "redirect:/savePicture/"+main.getId()+"?success";
			
		}catch(Exception ex) {
			return "redirect:/savePicture/"+main.getId()+"?error";
		}
		
	}
	
	private void imageSave(Picture picture) {
		MultipartFile image = picture.getPictureFile();
		if(!image.isEmpty()) {
			path = Paths.get(homeDir+"/eclipse/pasalImages/mainads/"+ picture.getPictureName());
			try {
				image.transferTo(new File(path.toString()));
			}catch(Exception ex) {
				ex.printStackTrace();
				throw new RuntimeException("Image saving failed", ex);
			}
			
		}
	}
	
	@GetMapping("/deletePicture/m={mainAdsId}/p={pictureId}")
	public String deletePicture(@PathVariable("pictureId") int id, @PathVariable("mainAdsId") int mainId) {
//		subCategoryRepo.delete(subCategoryRepo.findOne(id));
		pictureRepo.delete(pictureRepo.findOne(id));
		return "redirect:/savePicture/"+mainId+"?delete-"+id;
	}
}
