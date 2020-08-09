package com.vortexnepal.pasal.admin.controller;

import java.io.File;
import java.io.IOException;

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
import com.vortexnepal.pasal.model.Car;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.CarRepository;

@Controller
public class CarController {
	private final String homeDir = System.getProperty("user.home");
	
	@Autowired
	private CarRepository carRepo;
	@Autowired
	private BrandRepository brandRepo;
	@Autowired
	private PictureRepository pictureRepo;
	
	@GetMapping("/admin/car")
	public String car(Model model) {
		model.addAttribute("cars", carRepo.findAll());
		model.addAttribute("brands", brandRepo.findAll());
		return "admin/module/car/car";
	}
	
	@GetMapping("/admin/addcar")
	public String addCar(Model model) {
		Car car = new Car();
		model.addAttribute("car", car);
		model.addAttribute("brands", brandRepo.findByType("Cars"));
		
		return "admin/module/car/addCar";
	}
	
	@PostMapping("/admin/addcar/save")
	public String addCar(@ModelAttribute("car") Car car, 
			@RequestParam("uploadingFiles") MultipartFile[] uploadingFiles, 
			BindingResult result) {
		
		try {
			
			/*
			 * Multiple Upload Picture
			 */
				String pictureGallery = homeDir + "/eclipse/pasalImages/car/" + car.getBrand().getBrandName()+ "/";
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
							pic.setCar(car);
							pic.setMainAds(null);
							pic.setHousing(null);
						
						/*
						 * While the relationship between Model Trip and GalleryPicture is One-To-Many,
						 * this is how the galleryPicture class is added to trips.
						 */
							car.getPicture().add(pic);
							carRepo.save(car);	
						
					}
				}
			
			return "redirect:/admin/car?success";
			
		}catch(IOException ex) {
			return "redirect:/admin/addcar?error";
		}
	}
	
	@GetMapping("/admin/editcar/{carId}")
	public String editCar(@PathVariable("carId") int id, Model model) {
		model.addAttribute("car", carRepo.findOne(id));
		model.addAttribute("brands", brandRepo.findByType("Cars"));
		model.addAttribute("searchedCarPictures", pictureRepo.findByCarCarId(id));
		
		return "admin/module/car/editCar";
	}
	
	@PostMapping("/admin/editcar/save")
	public String editCar(@Valid @ModelAttribute("car") Car car, 
			@RequestParam("uploadingFiles") MultipartFile[] uploadingFiles, 
			BindingResult result) {
		
		try {
				/*
				 * Multiple Upload Picture
				 */
					String pictureGallery = homeDir + "/eclipse/pasalImages/car/" + car.getBrand().getBrandName()+ "/";
					File galleryDir = new File(pictureGallery);
		
					if (!galleryDir.isDirectory()) {
						galleryDir.mkdirs();
					}
				/*
				 * Each Picture that have been uploaded is in uploadingFiles
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
								
//								List<Picture> pics= pictureRepo.findByCarCarId(car.getCarId());
//								
//								if(pics.size() > i) {
//									pics.get(i).setId(pics.get(i).getId());
//									pics.get(i).setPictureName(uploadedFile.getOriginalFilename());
//									pics.get(i).setCar(car);
//									pics.get(i).setHousing(null);
//									pics.get(i).setMainAds(null);
//									
//									car.getPicture().add(pics.get(i));
//									
//								}else{
//									Picture pic = new Picture();
//									
//									pic.setPictureName(uploadedFile.getOriginalFilename());
//									pic.setCar(car);
//									pic.setHousing(null);
//									pic.setMainAds(null);
//									
//									car.getPicture().add(pic);
//								}
							
								if(temp.equalsIgnoreCase(uploadedFile.getOriginalFilename())) {
									System.err.println(">>>>> Name Matched - donot Save this image again !!");
								}else {
									pic.setPictureName(uploadedFile.getOriginalFilename());
									pic.setCar(car);
									pic.setHousing(null);
									pic.setMainAds(null);
									temp=pic.getPictureName();
									
									car.getPicture().add(pic);	
								}

							/*
							 * While the relationship between Model Trip and GalleryPicture is One-To-Many,
							 * this is how the galleryPicture class is added to trips.
							 */
								
								carRepo.save(car);
							
						}else {
							carRepo.save(car);
							return "redirect:/admin/car?success";
						}
					}
			return "redirect:/admin/editcar/"+car.getCarId()+"?success";
		}catch(Exception ex) {
			ex.printStackTrace();
			return "redirect:/admin/editcar/"+car.getCarId()+"?error";
		}
	}
	
	@GetMapping("/admin/deletecar/{carId}")
	public String deleteCar(@PathVariable("carId") int id) {
		carRepo.delete(carRepo.findOne(id));
		return "redirect:/admin/car";
	}
	
	@GetMapping("/admin/car/{brandId}")
	public String carByBrand(@PathVariable("brandId") int brandId, Model model) {
		
		model.addAttribute("brands", brandRepo.findAll());
		
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		model.addAttribute("carByBrand", carRepo.findByBrandBrandId(brandId));
		
		return  "admin/module/car/carByBrand";
	}
	
	@GetMapping("/admin/deletecarpicture/{carid}/{pictureid}")
	public String deleteCarPicture(@PathVariable("carid") int carId, @PathVariable("pictureid") int pictureId) {
		pictureRepo.delete(pictureId);
		return "redirect:/admin/editcar/"+carId+"?DeletedSuccessfully";
	}

	
}
