package com.vortexnepal.pasal.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vortexnepal.pasal.ads.model.Delivery;
import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.ads.model.Warranty;
import com.vortexnepal.pasal.ads.repository.DeliveryRepository;
import com.vortexnepal.pasal.ads.repository.MainAdsRepository;
import com.vortexnepal.pasal.ads.repository.WarrantyRepository;
import com.vortexnepal.pasal.model.SubCategory;
import com.vortexnepal.pasal.model.SubModel;
import com.vortexnepal.pasal.model.User;
import com.vortexnepal.pasal.repository.CategoryRepository;
import com.vortexnepal.pasal.repository.SubCategoryRepository;
import com.vortexnepal.pasal.repository.SubModelRepository;
import com.vortexnepal.pasal.spec.model.ApparelAccessorySpec;
import com.vortexnepal.pasal.spec.model.ApparelClothingSpec;
import com.vortexnepal.pasal.spec.model.ApparelShoesSpec;
import com.vortexnepal.pasal.spec.model.AutoCarSpec;
import com.vortexnepal.pasal.spec.model.AutoMotocycleSpec;
import com.vortexnepal.pasal.spec.model.BusinessSaleSpec;
import com.vortexnepal.pasal.spec.model.CommonSpec;
import com.vortexnepal.pasal.spec.model.HandsetSpec;
import com.vortexnepal.pasal.spec.model.LaptopSpec;
import com.vortexnepal.pasal.spec.model.MonitorSpec;
import com.vortexnepal.pasal.spec.model.NetworkingEquipmentSpec;
import com.vortexnepal.pasal.spec.model.PrinterSpec;
import com.vortexnepal.pasal.spec.model.RealEstateSpec;
import com.vortexnepal.pasal.spec.model.SoftwareSpec;
import com.vortexnepal.pasal.spec.model.SportBicycleSpec;
import com.vortexnepal.pasal.spec.model.StorageSpec;
import com.vortexnepal.pasal.spec.model.TabletSpec;
import com.vortexnepal.pasal.spec.model.TravelSpec;
import com.vortexnepal.pasal.spec.repository.ApparelAccessorySpecRepository;
import com.vortexnepal.pasal.spec.repository.ApparelClothingSpecRepository;
import com.vortexnepal.pasal.spec.repository.ApparelShoesSpecRepository;
import com.vortexnepal.pasal.spec.repository.AutoCarSpecRepository;
import com.vortexnepal.pasal.spec.repository.AutoMotocycleSpecRepository;
import com.vortexnepal.pasal.spec.repository.BusinessSaleSpecRepository;
import com.vortexnepal.pasal.spec.repository.CommonSpecRepository;
import com.vortexnepal.pasal.spec.repository.HandsetSpecRepository;
import com.vortexnepal.pasal.spec.repository.LaptopSpecRepository;
import com.vortexnepal.pasal.spec.repository.MonitorSpecRepository;
import com.vortexnepal.pasal.spec.repository.NetworkingEquipmentSpecRepository;
import com.vortexnepal.pasal.spec.repository.PrinterSpecRepository;
import com.vortexnepal.pasal.spec.repository.RealEstateSpecRepository;
import com.vortexnepal.pasal.spec.repository.SoftwareSpecRepository;
import com.vortexnepal.pasal.spec.repository.SportBicycleSpecRepository;
import com.vortexnepal.pasal.spec.repository.StorageSpecRepository;
import com.vortexnepal.pasal.spec.repository.TabletSpecRepository;
import com.vortexnepal.pasal.spec.repository.TravelSpecRepository;

@Controller
@RequestMapping("/new-ads")
public class AdsController {
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private SubCategoryRepository subCategoryRepo;
	@Autowired
	private SubModelRepository subModelRepo;
	@Autowired
	private MainAdsRepository mainAdsRepo;
	@Autowired
	private DeliveryRepository deliveryRepo;
	@Autowired
	private WarrantyRepository warrantyRepo;
	@Autowired
	private CommonSpecRepository commonSpecRepo;
	@Autowired
	private AutoCarSpecRepository carSpecRepo;
	@Autowired
	private AutoMotocycleSpecRepository autoMotoCycleSpecRepo;
	@Autowired 
	private ApparelClothingSpecRepository apparelClothingSpecRepo;
	@Autowired 
	private ApparelShoesSpecRepository apparelShoesSpecRepo;
	@Autowired 
	private ApparelAccessorySpecRepository apparelAccessorySpecRepo;
	@Autowired
	private RealEstateSpecRepository realEstateSpecRepo;
	@Autowired
	private BusinessSaleSpecRepository businessSaleSpecRepo;
	@Autowired
	private SportBicycleSpecRepository  sportBicycleSpecRepo;
	@Autowired
	private TravelSpecRepository travelSpecRepo;
	@Autowired 
	private HandsetSpecRepository handsetSpecRepo;
	@Autowired
	private LaptopSpecRepository laptopSpecRepo;
	@Autowired
	private NetworkingEquipmentSpecRepository networkingSpecRepo;
	@Autowired
	private MonitorSpecRepository monitorSpecRepo;
	@Autowired
	private PrinterSpecRepository printerSpecRepo;
	@Autowired
	private SoftwareSpecRepository softwareSpecRepo;
	@Autowired
	private StorageSpecRepository storageSpecRepo;
	@Autowired
	private TabletSpecRepository tabletSpecRepo;

	@GetMapping
	public String addNewAdsPage(Model model) {
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			model.addAttribute("categories", categoryRepo.findAll());
			model.addAttribute("subcategories", subCategoryRepo.findAll());
			model.addAttribute("submodels", subModelRepo.findAll());

			return "site/new-ads-page";
		}
	}

	@GetMapping("{subcategoryname}")
	public String addForm2(Model model, @PathVariable("subcategoryname") String name,
			@AuthenticationPrincipal User activeUser) {

		/*
		 * Model Class initialized for forms. userEmail returns anonymousUser if not
		 * logged in
		 */
			String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
			if (userEmail.equals("anonymousUser")) {
				return "redirect:/error";
			} else {
				model.addAttribute("mainAds", new MainAds());
				model.addAttribute("delivery", new Delivery());
				model.addAttribute("warranty", new Warranty());
				model.addAttribute("commonSpec", new CommonSpec());
				model.addAttribute("apparelClothingSpec", new ApparelClothingSpec());
				model.addAttribute("apparelShoesSpec", new ApparelShoesSpec());
				model.addAttribute("apparelAccessorySpec", new ApparelAccessorySpec());
				model.addAttribute("realEstateSpec", new RealEstateSpec());
				model.addAttribute("businessSaleSpec", new BusinessSaleSpec());
				model.addAttribute("sportBicycleSpec", new SportBicycleSpec());
				model.addAttribute("travelSpec", new TravelSpec());
				model.addAttribute("laptopSpec", new LaptopSpec());
				model.addAttribute("monitorSpec", new MonitorSpec());
				model.addAttribute("networkingSpec", new NetworkingEquipmentSpec());
				model.addAttribute("printerSpec", new PrinterSpec());
				model.addAttribute("softwareSpec", new SoftwareSpec());
				model.addAttribute("storageSpec", new StorageSpec());
				model.addAttribute("tabletSpec", new TabletSpec());
				
	
				/*
				 * Getting Object through name parameter and categorizing the sub-categories
				 * which has sub-model objects.
				 */
					SubCategory subcategory = subCategoryRepo.findBySubCategoryName(name);
					try {
						List<SubModel> subModelList = subModelRepo.findBySubCategorySubCategoryId(subcategory.getSubCategoryId());
		
						/*
						 * Filtering the Sub-categories that don't have models and giving them different
						 * view.
						 */
						if (subModelList.size() == 0) {
							model.addAttribute("categorybysubcategory", subcategory.getCategory());
							model.addAttribute("subcategory", subcategory);
		
							if (subcategory.getCategory().getCategoryName().equalsIgnoreCase("Books & Learning") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Beauty & Health") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Music Instrument") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Pets & Pet Care") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Toys & Video Games") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Home, Furnishing & Appliances")) {
								return "site/books_learning/books-learning";
							} else if (subcategory.getCategory().getCategoryName().equalsIgnoreCase("Events & Happenings") || subcategory.getCategory().getCategoryName().equalsIgnoreCase("Services")) {
								return "site/events_happenings/events";
							} else if (subcategory.getCategory().getCategoryName().equalsIgnoreCase("Apparels & Accessories")) {
								if(subcategory.getSubCategoryId() == 35 || subcategory.getSubCategoryId() == 39 || subcategory.getSubCategoryId() == 45) {
									return "site/apparels_accessories/apparel_clothing";
								}else if (subcategory.getSubCategoryId() == 40 || subcategory.getSubCategoryId() == 46) {
									return "site/apparels_accessories/apparel_shoes";
								}else if (subcategory.getSubCategoryId() == 42 || subcategory.getSubCategoryId() == 43) {
									return "site/apparels_accessories/apparel_accessory";
								}else {
									return "site/books_learning/books-learning";
								}
							}else if (subcategory.getCategory().getCategoryName().trim().equalsIgnoreCase("Real Estate")) {
								if(subcategory.getSubCategoryName().trim().equalsIgnoreCase("Flatmates & Paying Guests")) {
									return "site/events_happenings/events";
								}else {
									return "site/realestate/realestate";
								}
							}else if (subcategory.getCategory().getCategoryName().equalsIgnoreCase("Business & Industrial")) {
								if(subcategory.getSubCategoryName().trim().equalsIgnoreCase("business for sale")) {
									return "site/books_learning/business_for_sale";
								}else {
									return "site/books_learning/books-learning";
								}
							}else if (subcategory.getCategory().getCategoryName().trim().equalsIgnoreCase("Sports & Fitness")) {
								if(subcategory.getSubCategoryName().trim().equalsIgnoreCase("Bicycles")) {
									return "site/books_learning/sport_bicycle";
								}else {
									return "site/books_learning/books-learning";
								}
							}else if (subcategory.getCategory().getCategoryName().trim().equalsIgnoreCase("Travel, Tour & Packages")) {
								if(subcategory.getSubCategoryName().trim().equalsIgnoreCase("Tour Package - Domestic") || subcategory.getSubCategoryName().trim().equalsIgnoreCase("Tour Package - International")) {
									return "site/books_learning/travel";
								}else {
									return "site/events_happenings/events";
								}
							}else if (subcategory.getCategory().getCategoryName().equalsIgnoreCase("Computer & Peripherals")) {
								if(subcategory.getSubCategoryName().equalsIgnoreCase("Desktop PC") || subcategory.getSubCategoryName().equalsIgnoreCase("Laptops")) {
									return "site/books_learning/laptop";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Monitors")) {
									return "site/books_learning/monitor";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
									return "site/books_learning/networking";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
									return "site/books_learning/printer";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Software")) {
									return "site/books_learning/software";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
									return "site/books_learning/storage";
								}else if(subcategory.getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
									return "site/books_learning/tablet";
								}else {
									return "site/books_learning/books-learning";
								}
							}	
							 
					
					return "site/test?has_not_been_redirected_yet";
				}
				return "redirect:/new-ads";
			} catch (NullPointerException ex) {
				ex.getMessage();
				return "redirect:/error";
			}
		}
	}

	@PostMapping("addBooksAds")
	public String sendFormForBooks(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			@ModelAttribute("delivery") Delivery delivery, @ModelAttribute("warranty") Warranty warranty,
			@ModelAttribute("commonSpec") CommonSpec commonSpec, @ModelAttribute("apparelClothingSpec") ApparelClothingSpec apparelClothingSpec, 
			@ModelAttribute("apparelShoesSpec") ApparelShoesSpec apparelShoesSpec, @ModelAttribute("apparelAccessorySpec") ApparelAccessorySpec apparelAccessorySpec,
			@ModelAttribute("realEstateSpec") RealEstateSpec realEstateSpec, @ModelAttribute("businessSaleSpec") BusinessSaleSpec businessSaleSpec, 
			@ModelAttribute("sportBicycleSpec") SportBicycleSpec sportBicycleSpec, @ModelAttribute("travelSpec") TravelSpec travelSpec,
			@ModelAttribute("laptopSpec") LaptopSpec laptopSpec, @ModelAttribute("monitorSpec") MonitorSpec monitorSpec, @ModelAttribute("networkingSpec") NetworkingEquipmentSpec networkingSpec,
			@ModelAttribute("printerSpec") PrinterSpec printerSpec, @ModelAttribute("softwareSpec") SoftwareSpec softwareSpec, @ModelAttribute("storageSpec") StorageSpec storageSpec,
			@ModelAttribute("tabletSpec") TabletSpec tabletSpec, Model model) {
		/*
		 * Send Validation Message. Status: Done.
		 */
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			try {
				if (mainads.getCustomer().getCustomerId() != 0) {
					/*
					 * To pivot from NullPointer Exception.
					 */
				}
			} catch (NullPointerException nul) {
				return "redirect:" + mainads.getSubCategory().getSubCategoryName() + "/?cusErr";
			}

			if (result.hasErrors()) {
				System.err.println(">>>>>>>>>>>>>>>>> RESULT HAS ERROR >>>>>>>>>>>>>>>>>>");

				List<SubModel> subModelList = subModelRepo.findBySubCategorySubCategoryId(mainads.getSubCategory().getSubCategoryId());

				if (subModelList.size() == 0) {
					model.addAttribute("categorybysubcategory", mainads.getSubCategory().getCategory());
					model.addAttribute("subcategory", mainads.getSubCategory());

					if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Books & Learning") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Beauty & Health") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Music Instrument") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Pets & Pet Care") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Toys & Video Games") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Home, Furnishing & Appliances")) {
						return "site/books_learning/books-learning";
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Events & Happenings") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Services")) {
						return "site/events_happenings/events";
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Computer & Peripherals")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Desktop PC") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Laptops")) {
							return "site/books_learning/laptop";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Monitors")) {
							return "site/books_learning/monitor";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
							return "site/books_learning/networking";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
							return "site/books_learning/printer";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Software")) {
							return "site/books_learning/software";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
							return "site/books_learning/storage";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
							return "site/books_learning/tablet";
						}else {
							return "site/books_learning/books-learning";
						}
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Apparels & Accessories")) {
						if(mainads.getSubCategory().getSubCategoryId() == 35 || mainads.getSubCategory().getSubCategoryId() == 39 || mainads.getSubCategory().getSubCategoryId() == 45) {
							return "site/apparels_accessories/apparel_clothing";
						}else if (mainads.getSubCategory().getSubCategoryId() == 40 || mainads.getSubCategory().getSubCategoryId() == 46) {
							return "site/apparels_accessories/apparel_shoes";
						}else if (mainads.getSubCategory().getSubCategoryId() == 42 || mainads.getSubCategory().getSubCategoryId() == 43) {
							return "site/apparels_accessories/apparel_accessory";
						}else {
							return "site/books_learning/books-learning";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Flatmates & Paying Guests ")) {
							return "site/events_happenings/events";
						}else {
							return "site/realestate/realestate";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Business & Industrial")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Business For Sale")) {
							return "site/books_learning/business_for_sale";
						}else {
							return "site/books_learning/books-learning";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Sports & Fitness")) {
						if(mainads.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Bicycles")) {
							return "site/books_learning/sport_bicycle";
						}else {
							return "site/books_learning/books-learning";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Travel, Tour & Packages")) {
						if(mainads.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Tour Package - Domestic") || mainads.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Tour Package - International")) {
							return "site/books_learning/travel";
						}else {
							return "site/events_happenings/events";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Computer & Peripherals")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Desktop PC") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Laptops")) {
							return "site/books_learning/laptop";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Monitors")) {
							return "site/books_learning/monitor";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
							return "site/books_learning/networking";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
							return "site/books_learning/printer";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Software")) {
							return "site/books_learning/software";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
							return "site/books_learning/storage";
						}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
							return "site/books_learning/tablet";
						}else {
							return "site/books_learning/books-learning";
						}
					}
					
					return "site/test?has_not_been_redirected_yet";
				}
			}
			

			Date adddate = mainads.getAddedDate();
			Date expirydate = mainads.getExpiryDate();
			adddate = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(adddate);
			c.add(Calendar.DATE, mainads.getAdRunDays());
			expirydate = c.getTime();

			mainads.setAddedDate(adddate);
			mainads.setExpiryDate(expirydate);

			mainAdsRepo.save(mainads);
			
			if(!mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate")) {
				
				/*
				 * Delivery Function Initialize and Saved
				 */
				delivery.setMainAds(mainads);
				deliveryRepo.save(delivery);
				/*
				 * Warranty Function Initialize and Saved
				 */
				warranty.setMainAds(mainads);
				warrantyRepo.save(warranty);
				
			}

			/*
			 * TASK: Specify the Specification of different categories. Specification table
			 * for different categories. Maintain relation with the other tables.
			 * 
			 * STATUS: Complete
			 */
			commonSpec.setMainAds(mainads);
			commonSpecRepo.save(commonSpec);
			
			if (mainads.getSubCategory().getSubCategoryId() == 35 || mainads.getSubCategory().getSubCategoryId() == 39 || mainads.getSubCategory().getSubCategoryId() == 45) {
				apparelClothingSpec.setMainAds(mainads);
				System.err.println("Checking apprel " + apparelClothingSpec.getId()+" size -> "+ apparelClothingSpec.getSize());
				apparelClothingSpecRepo.save(apparelClothingSpec);
			} else if (mainads.getSubCategory().getSubCategoryId() == 40 || mainads.getSubCategory().getSubCategoryId() == 46) {
				apparelShoesSpec.setMainAds(mainads);
				apparelShoesSpecRepo.save(apparelShoesSpec);
			} else if (mainads.getSubCategory().getSubCategoryId() == 42 || mainads.getSubCategory().getSubCategoryId() == 43) {
				apparelAccessorySpec.setMainAds(mainads);
				apparelAccessorySpecRepo.save(apparelAccessorySpec);
			} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Real Estate") && !mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Flatmates & Paying Guests")) {
				realEstateSpec.setMainAds(mainads);
				realEstateSpecRepo.save(realEstateSpec);
			} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Business & Industrial") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Business For Sale")) {
				businessSaleSpec.setMainAds(mainads);
				businessSaleSpecRepo.save(businessSaleSpec);
			} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Sports & Fitness") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Bicycles")) {
				sportBicycleSpec.setMainAds(mainads);
				sportBicycleSpecRepo.save(sportBicycleSpec);
			} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Travel, Tour & Packages") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tour Package - Domestic") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tour Package - International")) {
				travelSpec.setMainAds(mainads);
				travelSpecRepo.save(travelSpec);
			}else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Computer & Peripherals")) {
				if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Desktop PC") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Laptops")) {
					laptopSpec.setMainAds(mainads);
					laptopSpecRepo.save(laptopSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Monitors")) {
					monitorSpec.setMainAds(mainads);
					monitorSpecRepo.save(monitorSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
					networkingSpec.setMainAds(mainads);
					networkingSpecRepo.save(networkingSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
					printerSpec.setMainAds(mainads);
					printerSpecRepo.save(printerSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Software")) {
					softwareSpec.setMainAds(mainads);
					softwareSpecRepo.save(softwareSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
					storageSpec.setMainAds(mainads);
					storageSpecRepo.save(storageSpec);
				}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
					tabletSpec.setMainAds(mainads);
					tabletSpecRepo.save(tabletSpec);
				}
			}

			return "redirect:/savePicture/" + mainads.getId();
		}
	}

	@PostMapping("addEventsAds")
	public String sendFormForEvents(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			Model model) {
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			try {
				if (mainads.getCustomer().getCustomerId() != 0) {
					/*
					 * To pivot from NullPointer Exception.
					 */
				}
			} catch (NullPointerException nul) {
				return "redirect:" + mainads.getSubCategory().getSubCategoryName() + "/" + "?cusErr";
			}

			if (result.hasErrors()) {
				System.err.println(">>>>>>>>>>>>>>>>> RESULT HAS ERROR >>>>>>>>>>>>>>>>>>");

				List<SubModel> subModelList = subModelRepo
						.findBySubCategorySubCategoryId(mainads.getSubCategory().getSubCategoryId());

				if (subModelList.size() == 0) {
					model.addAttribute("categorybysubcategory", mainads.getSubCategory().getCategory());
					model.addAttribute("subcategory", mainads.getSubCategory());

					if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Books & Learning") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Beauty & Health") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Music Instrument") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Pets & Pet Care")) {
						return "site/books_learning/books-learning";
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Events & Happenings") || mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Services")) {
						return "site/events_happenings/events";
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Computer & Peripherals")) {
						return "redirect:/?from-Computer-Peripherals";
					} else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Apparels & Accessories")) {
						if(mainads.getSubCategory().getSubCategoryId() == 35 || mainads.getSubCategory().getSubCategoryId() == 39 || mainads.getSubCategory().getSubCategoryId() == 45) {
							return "site/apparels_accessories/apparel_clothing";
						}else if (mainads.getSubCategory().getSubCategoryId() == 40 || mainads.getSubCategory().getSubCategoryId() == 46) {
							return "site/apparels_accessories/apparel_shoes";
						}else if (mainads.getSubCategory().getSubCategoryId() == 42 || mainads.getSubCategory().getSubCategoryId() == 43) {
							return "site/apparels_accessories/apparel_accessory";
						}else {
							return "site/books_learning/books-learning";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Flatmates & Paying Guests ")) {
							return "site/events_happenings/events";
						}else {
							return "site/realestate/realestate";
						}
					}else if (mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Business & Industrial")) {
						if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Business For Sale")) {
							return "site/business/business_for_sale";
						}else {
							return "site/books_learning/books-learning";
						}
					}
					
					
					return "site/test?has_not_been_redirected_yet";
				}
			}

			Date adddate = mainads.getAddedDate();
			Date expirydate = mainads.getExpiryDate();
			adddate = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(adddate);
			c.add(Calendar.DATE, mainads.getAdRunDays());
			expirydate = c.getTime();

			mainads.setAddedDate(adddate);
			mainads.setExpiryDate(expirydate);

			mainAdsRepo.save(mainads);
			return "redirect:/savePicture/" + mainads.getId();
		}
	}

	@GetMapping("{subcategoryname}/{modelname}")
	public String addFormForAutomobile(Model model, @PathVariable("modelname") String name,
			@PathVariable("subcategoryname") String subcategoryname) {
		
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			/*
			 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			 * String email = auth.getName(); String role =
			 * auth.getAuthorities().toString();
			 * 
			 * model.addAttribute("email", email); model.addAttribute("role", role);
			 */

			/*
			 * Model Class initialized for forms.
			 */

			model.addAttribute("mainAds", new MainAds());
			model.addAttribute("delivery", new Delivery());
			model.addAttribute("warranty", new Warranty());
			model.addAttribute("commonSpec", new CommonSpec());
			model.addAttribute("autoCarSpec", new AutoCarSpec());
			model.addAttribute("autoMotocycleSpec", new AutoMotocycleSpec());
			model.addAttribute("handsetSpec", new HandsetSpec());

			/*
			 * TASK: 1. Identification through Model-Name, which category and sub-category
			 * it represents and send them as model to the required JSP page. 2. ForEach
			 * Used for Redundant data, can be of same modelName in different categories
			 * such as Honda can be in Car as well as Motorbike.
			 * 
			 * STATUS: Completed.
			 */

			// Customer customer = customerRepo.findByUserEmail(email);
			// model.addAttribute("customer", customer);

			for (SubModel submodel : subModelRepo.findBySubModelName(name)) {

				model.addAttribute("subcategorybymodel", submodel.getSubCategory());
				model.addAttribute("model", submodel);

				if (submodel.getSubCategory().getSubCategoryName().equals("Cars") && subcategoryname.equals("Cars")) {

					if (submodel.getSubModelName().equalsIgnoreCase("Other Electric Bike")) {
						return "site/automobiles/automobile_parts";
					}

					return "site/automobiles/automobile_car";
				} else if (submodel.getSubCategory().getSubCategoryName().equals("Motorcycles") && subcategoryname.equals("Motorcycles")) {
					return "site/automobiles/automobile_motorcycle";
				} else if (submodel.getSubCategory().getSubCategoryName().equals("Parts & Accessories") && subcategoryname.equals("Parts & Accessories")) {
					return "site/automobiles/automobile_parts";
				} else if (submodel.getSubCategory().getSubCategoryName().equals("Handsets") && subcategoryname.equals("Handsets")) {
					return "site/mobile/handset";
				}
			}
			return "site/automobiles/automobile_parts";
		}
	}

	@PostMapping("addAds")
	public String sendFormForAutomobiles(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			@ModelAttribute("delivery") Delivery delivery, @ModelAttribute("warranty") Warranty warranty,
			@ModelAttribute("commonSpec") CommonSpec commonSpec, @ModelAttribute("autoCarSpec") AutoCarSpec autoCarSpec,
			@ModelAttribute("autoMotocycleSpec") AutoMotocycleSpec autoMotocycleSpec,
			@ModelAttribute("handsetSpec") HandsetSpec handsetSpec, Model model) {
		/*
		 * Send Validation Message. Status: Done.
		 */
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			try {
				if (mainads.getCustomer().getCustomerId() != 0) {
					/*
					 * To pivot from NullPointer Exception.
					 */
				}
			} catch (NullPointerException nul) {
				return "redirect:" + mainads.getSubCategory().getSubCategoryName() + "/"
						+ mainads.getSubModel().getSubModelName() + "?cusErr";
			}

			if (result.hasErrors()) {
				System.err.println(">>>>>>>>>>>>>>>>> RESULT HAS ERROR >>>>>>>>>>>>>>>>>>");

				model.addAttribute("subcategorybymodel", mainads.getSubCategory());
				model.addAttribute("model", mainads.getSubModel());

				if (mainads.getSubCategory().getSubCategoryName().equals("Cars")) {
					return "site/automobiles/automobile_car";
				} else if (mainads.getSubCategory().getSubCategoryName().equals("Motorcycles")) {
					if (mainads.getSubModel().getSubModelName().equalsIgnoreCase("Other Electric Bike")) {
						return "site/automobiles/automobile_parts";
					}
					return "site/automobiles/automobile_motorcycle";
				} else if (mainads.getSubCategory().getSubCategoryName().equals("Parts & Accessories")) {
					return "site/automobiles/automobile_parts";
				} else if (mainads.getSubCategory().getSubCategoryName().equals("Handsets")) {
					return "site/mobile/handset";
				}
			}

			Date adddate = mainads.getAddedDate();
			Date expirydate = mainads.getExpiryDate();
			adddate = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(adddate);
			c.add(Calendar.DATE, mainads.getAdRunDays());
			expirydate = c.getTime();

			mainads.setAddedDate(adddate);
			mainads.setExpiryDate(expirydate);

			mainAdsRepo.save(mainads);

			/*
			 * Delivery Function Initialize and Saved
			 */
			try {
				if (!delivery.getDeliveryArea().equals(null)) {
					delivery.setMainAds(mainads);
					deliveryRepo.save(delivery);
				}
			} catch (NullPointerException nul) {
				delivery.setDeliveryArea("NA");
				delivery.setMainAds(mainads);
				deliveryRepo.save(delivery);
			}

			/*
			 * Warranty Function Initialize and Saved
			 */
			warranty.setMainAds(mainads);
			warrantyRepo.save(warranty);
			/*
			 * TASK: Specify the Specification of different categories. Specification table
			 * for different categories. Maintain relation with the other tables.
			 * 
			 * STATUS: Complete
			 */
			commonSpec.setMainAds(mainads);
			commonSpecRepo.save(commonSpec);

			if (mainads.getSubCategory().getSubCategoryName().equals("Cars")) {
				autoCarSpec.setMainAds(mainads);
				carSpecRepo.save(autoCarSpec);
			} else if (mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Motorcycles")) {
				autoMotocycleSpec.setMainAds(mainads);
				autoMotoCycleSpecRepo.save(autoMotocycleSpec);
			} else if (mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Handsets")) {
				handsetSpec.setMainAds(mainads);
				handsetSpecRepo.save(handsetSpec);
			}

			return "redirect:/savePicture/" + mainads.getId();
		}
	}

}
