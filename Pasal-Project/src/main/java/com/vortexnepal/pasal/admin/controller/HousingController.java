package com.vortexnepal.pasal.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.vortexnepal.pasal.ads.model.Picture;
import com.vortexnepal.pasal.ads.repository.PictureRepository;
import com.vortexnepal.pasal.model.Housing;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.CarRepository;
import com.vortexnepal.pasal.repository.HousingRepository;

@Controller
public class HousingController {
	private final String homeDir = System.getProperty("user.home");
	
	@Autowired
	private HousingRepository housingRepo;
	@Autowired
	private BrandRepository brandRepo;
	@Autowired
	private PictureRepository pictureRepo;
	@Autowired
	private CarRepository carRepo;
	
	@GetMapping("/admin/housing")
	public String house(Model model) {
		model.addAttribute("housings", housingRepo.findAll());
		model.addAttribute("brands", brandRepo.findAll());
		return "admin/module/housing/housing";
	}
	
	@GetMapping("/admin/addhousing")
	public String addHousing(Model model) {
		Housing housing = new Housing();
		model.addAttribute("housing", housing);
		model.addAttribute("brands", brandRepo.findByType("Housing"));
		
		return "admin/module/housing/addHousing";
	}
	
	@PostMapping("/admin/addhousing/save")
	public String addHousing(@ModelAttribute("housing") Housing housing, 
			@RequestParam("uploadingFiles") MultipartFile[] uploadingFiles, 
			BindingResult result) {
		
		try {
			housing.setAddedDate(Calendar.getInstance().getTime());
			/*
			 * Multiple Upload Picture
			 */
				String pictureGallery = homeDir + "/eclipse/pasalImages/housing/" + housing.getBrand().getBrandName()+ "/";
				File galleryDir = new File(pictureGallery);
	
				if (!galleryDir.isDirectory()) {
					galleryDir.mkdirs();
				}
			/*
			 * Each Picture that have been uploaded is in uoloadingFiles
			 */
				for (MultipartFile uploadedFile : uploadingFiles) {
					if (!uploadedFile.isEmpty()) {
						String galleryPictureName = pictureGallery + uploadedFile.getOriginalFilename();
						
						/*
						 * Creating File for Image to be saved. Saving the File.
						 */
							File file = new File(galleryPictureName);
							uploadedFile.transferTo(file);
						
						/*
						 * Setting the Model GalleryPicture to insert the value in Database.
						 */
						
							Picture pic = new Picture();
							pic.setPictureName(uploadedFile.getOriginalFilename());
							pic.setHousing(housing);
							pic.setMainAds(null);
							pic.setCar(null);
						
						/*
						 * While the relationship between Model Trip and GalleryPicture is One-To-Many,
						 * this is how the galleryPicture class is added to trips.
						 */
							housing.getPicture().add(pic);
							housingRepo.save(housing);	
						
					}
				}
			
			return "redirect:/admin/housing?success";
			
		}catch(IOException ex) {
			return "redirect:/admin/addhousing?error";
		}
	}
	
	@GetMapping("/admin/edithousing/{housingId}")
	public String editHousing(@PathVariable("housingId") int id, Model model) {
		model.addAttribute("housing", housingRepo.findOne(id));
		model.addAttribute("brands", brandRepo.findByType("Housing"));
		
		model.addAttribute("searchedHousingPictures", pictureRepo.findByHousingHousingId(id));
		return "admin/module/housing/editHousing";
	}
	
	@PostMapping("/admin/edithousing/save")
	public String editHousing(@Valid @ModelAttribute("housing") Housing housing, 
			@RequestParam("uploadingFiles") MultipartFile[] uploadingFiles, 
			BindingResult result) {
		
		try {
				/*
				 * Multiple Upload Picture
				 */
					String pictureGallery = homeDir + "/eclipse/pasalImages/housing/" + housing.getBrand().getBrandName()+ "/";
					File galleryDir = new File(pictureGallery);
		
					if (!galleryDir.isDirectory()) {
						galleryDir.mkdirs();
					}
				/*
				 * Each Picture that have been uploaded is in uoloadingFiles
				 */
					String temp = "";
					Picture pic = new Picture();
					for (MultipartFile uploadedFile : uploadingFiles) {
						if (!uploadedFile.isEmpty()) {
							String galleryPictureName = pictureGallery + uploadedFile.getOriginalFilename();
							
							/*
							 * Creating File for Image to be saved. Saving the File.
							 */
								File file = new File(galleryPictureName);
								uploadedFile.transferTo(file);
								
							/*
							 * Setting the Model GalleryPicture to insert the value in Database.
							 */
								
//								List<Picture> pics= pictureRepo.findByHousingHousingId(housing.getHousingId());
//								
//								if(pics.size() > i) {
//									pics.get(i).setId(pics.get(i).getId());
//									pics.get(i).setPictureName(uploadedFile.getOriginalFilename());
//									pics.get(i).setHousing(housing);
//									pics.get(i).setMainAds(null);
//									
//									housing.getPicture().add(pics.get(i));
//									
//								}else{
//									Picture pic = new Picture();
//									pic.setPictureName(uploadedFile.getOriginalFilename());
//									pic.setHousing(housing);
//									pic.setMainAds(null);
//									
//									housing.getPicture().add(pic);
//								}
								
								if(temp.equalsIgnoreCase(uploadedFile.getOriginalFilename())) {
									System.err.println(">>>>> Name Matched - donot Save this image again !!");
								}else {
									pic.setPictureName(uploadedFile.getOriginalFilename());
									pic.setHousing(housing);
									
									pic.setMainAds(null);
									pic.setCar(null);
									housing.getPicture().add(pic);
									temp=pic.getPictureName();
									
									housing.getPicture().add(pic);	
								}	
								
							/*
							 * While the relationship between Model Trip and GalleryPicture is One-To-Many,
							 * this is how the galleryPicture class is added to trips.
							 */
								
								housingRepo.save(housing);
							
						}else {
							housingRepo.save(housing);
							return "redirect:/admin/housing?success";
						}
					}
			
			return "redirect:/admin/edithousing/"+housing.getHousingId()+"?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/edithousing/"+housing.getHousingId()+"?error";
		}
	}
	
	@GetMapping("/admin/deletehousing/{housingId}")
	public String deleteHousing(@PathVariable("housingId") int id) {
		
		housingRepo.delete(housingRepo.findOne(id));
		return "redirect:/admin/housing?deleted";
	}
	
	@GetMapping("/admin/housing/{brandId}")
	public String housingByBrand(@PathVariable("brandId") int brandId, Model model) {
		model.addAttribute("brands", brandRepo.findAll());
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		model.addAttribute("housingByBrand", housingRepo.findByBrandBrandId(brandId));
		
		return  "admin/module/housing/housingByBrand";
	}
	
	@GetMapping("/detail/housing/{housingId}")
	public String housingDetail(@PathVariable("housingId") int housingId, Model model) {
		model.addAttribute("housing", housingRepo.findOne(housingId));
		model.addAttribute("housingPicture", pictureRepo.findByHousingHousingId(housingId));
		model.addAttribute("selectedHousing", housingRepo.findTop4ByBrandActivateTrue());
		return "site/housing/housingDetail";
	}
	
	@GetMapping("/detail/car/{carId}")
	public String carDetail(@PathVariable("carId") int carId, Model model) {
		model.addAttribute("car", carRepo.findOne(carId));
		model.addAttribute("carPicture", pictureRepo.findByCarCarId(carId));
		model.addAttribute("selectedCar", carRepo.findTop4ByBrandActivateTrue());
		return "site/car/carDetail";
	}
	
	@GetMapping("/admin/deletehousingpicture/{housingid}/{pictureid}")
	public String deleteHousingPicture(@PathVariable("housingid") int housingId, @PathVariable("pictureid") int pictureId) {
		pictureRepo.delete(pictureId);
		return "redirect:/admin/edithousing/"+housingId+"?DeletedSuccessfully";
	}
	
}
