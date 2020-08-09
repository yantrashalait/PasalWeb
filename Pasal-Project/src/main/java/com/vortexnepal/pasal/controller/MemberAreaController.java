package com.vortexnepal.pasal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vortexnepal.pasal.ads.model.Delivery;
import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.ads.model.Question;
import com.vortexnepal.pasal.ads.model.Reply;
import com.vortexnepal.pasal.ads.model.Warranty;
import com.vortexnepal.pasal.ads.repository.DeliveryRepository;
import com.vortexnepal.pasal.ads.repository.MainAdsRepository;
import com.vortexnepal.pasal.ads.repository.PictureRepository;
import com.vortexnepal.pasal.ads.repository.QuestionRepository;
import com.vortexnepal.pasal.ads.repository.ReplyRepository;
import com.vortexnepal.pasal.ads.repository.WarrantyRepository;
import com.vortexnepal.pasal.model.Customer;
import com.vortexnepal.pasal.model.User;
import com.vortexnepal.pasal.model.Wishlist;
import com.vortexnepal.pasal.repository.CustomerRepository;
import com.vortexnepal.pasal.repository.UserRepository;
import com.vortexnepal.pasal.repository.WishlistRepository;
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
@RequestMapping("/member")
public class MemberAreaController {
	// Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID =
            "ACc724b1e721dd0a0e6c8fb1f7805d9ef2";
    public static final String AUTH_TOKEN =
            "1b3887747e284edefdda1ae26812c593";
    
    @Autowired
    OTPSystemRestController otpSystemRestController;
    
	@Autowired
	private MainAdsRepository mainRepo;
	@Autowired
	private PictureRepository pictureRepo;
	@Autowired
	private CustomerRepository customerRepo;
	@Autowired
	private DeliveryRepository deliveryRepo;
	@Autowired
	private WarrantyRepository warrantyRepo;
	@Autowired
	private CommonSpecRepository commonSpecRepo;
	@Autowired
	private AutoCarSpecRepository autoCarSpecRepo;
	@Autowired
	private AutoMotocycleSpecRepository autoMotoCycleSpecRepo;
	@Autowired
	private QuestionRepository questionRepo;
	@Autowired
	private ReplyRepository replyRepo;
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
	private SportBicycleSpecRepository sportBicycleSpecRepo;
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
	@Autowired
	private WishlistRepository wishlistRepo;
	@Autowired
	private UserRepository userRepo;
	
//	private AuthyApiClient authyApiClient = new AuthyApiClient("6GsT3QeBXxwTGoLQW70l1XXABwL3lAHW");

	
	@GetMapping
	public String member(Model model) {
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (!userEmail.equals("anonymousUser")) {
			/*
			 * Current User in Session !! if direct access send to error page !!
			 */
			try {

				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String email = auth.getName();
				Customer cus = customerRepo.findByUserEmail(email);

				int totalViewCount = 0;
				for (MainAds main : mainRepo.findByCustomerCustomerId(cus.getCustomerId())) {
					totalViewCount += main.getViewCount();
				}
				model.addAttribute("totalViewCount", totalViewCount);
				model.addAttribute("countByCustomerAds", mainRepo.countByCustomerCustomerId(cus.getCustomerId()));
				
				int countCustomerBasedQuestions = getCustomerBasedQuestions().size();
				model.addAttribute("countCustomerBasedQuestions", countCustomerBasedQuestions);
				
				int countAskedByUser = questionRepo.countAskedByUser(cus.getCustomerId());
				model.addAttribute("countAskedByUser", countAskedByUser);
				
				return "site/member_area/memberHome";
			} catch (Exception ex) {
				return "site/member_area/memberHome";
			}
		} else {
			return "redirect:/error";
		}
	}

	@GetMapping("/myads")
	public String myAds(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		if (!email.equals("anonymousUser")) {
			Customer cus = customerRepo.findByUserEmail(email);
			model.addAttribute("mainAds", mainRepo.findByCustomerCustomerId(cus.getCustomerId()));
			model.addAttribute("pictures", pictureRepo.findAll());
			return "site/member_area/myAds";

		} else {
			return "redirect:/error";
		}
	}

	@GetMapping("/editcustomer")
	public String editCustomer(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		if (email.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			Customer cus = customerRepo.findByUserEmail(email);
			model.addAttribute("selectedCustomer", customerRepo.findOne(cus.getCustomerId()));

			return "site/member_area/editCustomer";
		}
	}

	@PostMapping("/editcustomer/save")
	public String editCustomer(@Valid @ModelAttribute("selectedCustomer") Customer customer) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		if (email.equals(customer.getUser().getEmail())) {
			try {
				customerRepo.save(customer);
				return "redirect:/member?success";
			} catch (Exception ex) {
				ex.printStackTrace();
				return "redirect:/error";
			}
		} else {
			return "redirect:/error";
		}

	}
	
	@GetMapping("/changepassword")
	public String changePassword(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		if (email.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
		
			model.addAttribute("user", userRepo.findByEmail(email));

			return "site/member_area/changePassword";
		}
	}
	
	@PostMapping("/changepassword/save")
	public String changePass(@RequestParam String prevPass, @RequestParam String password) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		
		User user = userRepo.findByEmail(email);
		// If input previous pass and actual previous pass matches
		if (user.getPassword().equals(prevPass)) {
			user.setPassword(password);
			userRepo.save(user);
			return "redirect:/member/changepassword?success";
		} else {
			return "redirect:/member/changepassword?error";
		}
	}

	@GetMapping("/deleteAds/{id}")
	public String deleteAds(@PathVariable("id") int id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Customer cust = customerRepo.findByUserEmail(email);
		MainAds mainAds = mainRepo.findByIdAndCustomerCustomerId(id, cust.getCustomerId());

		if (mainAds != null) {
			mainRepo.delete(id);
			return "redirect:/member/myads/";
		} else {
			return "redirect:/error";
		}
	}

	@GetMapping("/editAds/{mainAdsId}")
	public String editMainAds(@PathVariable("mainAdsId") int id, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Customer cust = customerRepo.findByUserEmail(email);
		MainAds main = mainRepo.findByIdAndCustomerCustomerId(id, cust.getCustomerId());

		if (main != null) {
			
			model.addAttribute("mainAds", main);
			model.addAttribute("delivery", deliveryRepo.findByMainAdsId(id));
			model.addAttribute("warranty", warrantyRepo.findByMainAdsId(id));
			model.addAttribute("commonSpec", commonSpecRepo.findByMainAdsId(id));
			model.addAttribute("autoCarSpec", autoCarSpecRepo.findByMainAdsId(id));
			model.addAttribute("autoMotoCycleSpec", autoMotoCycleSpecRepo.findByMainAdsId(id));
			
			model.addAttribute("apparelClothingSpec", apparelClothingSpecRepo.findByMainAdsId(id));
			model.addAttribute("apparelShoesSpec", apparelShoesSpecRepo.findByMainAdsId(id));
			model.addAttribute("apparelAccessorySpec", apparelAccessorySpecRepo.findByMainAdsId(id));
			model.addAttribute("realEstateSpec", realEstateSpecRepo.findByMainAdsId(id));
			
			model.addAttribute("travelSpec", travelSpecRepo.findByMainAdsId(id));
			
			model.addAttribute("businessSaleSpec", businessSaleSpecRepo.findByMainAdsId(id));
			model.addAttribute("sportBicycleSpec", sportBicycleSpecRepo.findByMainAdsId(id));
			model.addAttribute("handsetSpec", handsetSpecRepo.findByMainAdsId(id));
			model.addAttribute("laptopSpec", laptopSpecRepo.findByMainAdsId(id));
			model.addAttribute("monitorSpec", monitorSpecRepo.findByMainAdsId(id));
			model.addAttribute("networkingSpec", networkingSpecRepo.findByMainAdsId(id));
			model.addAttribute("printerSpec", printerSpecRepo.findByMainAdsId(id));
			model.addAttribute("softwareSpec", softwareSpecRepo.findByMainAdsId(id));
			model.addAttribute("storageSpec", storageSpecRepo.findByMainAdsId(id));
			model.addAttribute("tabletSpec", tabletSpecRepo.findByMainAdsId(id));

			try {

				if (!main.getSubModel().equals(null)) {
					if (main.getSubCategory().getSubCategoryName().equals("Cars")) {

						if (main.getSubModel().getSubModelName().equalsIgnoreCase("Other Electric Bike")) {
							return "site/automobiles/edit_automobile_parts";
						}
						return "site/automobiles/edit_automobile_car";
					} else if (main.getSubCategory().getSubCategoryName().equals("Motorcycles")) {
						return "site/automobiles/edit_automobile_motorcycle";
					} else if (main.getSubCategory().getSubCategoryName().equals("Parts & Accessories")) {
						return "site/automobiles/edit_automobile_parts";
					} else if (main.getSubCategory().getSubCategoryName().equals("Handsets")) {
						return "site/mobile/edit_handset";
					} else if (main.getSubCategory().getSubCategoryName().equals("Accessories")) {
						return "site/books_learning/edit_books-learning";
					}
				}

			} catch (NullPointerException nul) {

				if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Books & Learning") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Beauty & Health") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Music Instrument") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Pets & Pet Care") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Toys & Video Games") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Home, Furnishing & Appliances")) {
					return "site/books_learning/edit_books-learning";
				} else if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Events & Happenings") || main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Services")) {
					return "site/events_happenings/edit_events";
				} else if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Apparels & Accessories")) {
					if(main.getSubCategory().getSubCategoryId() == 35 || main.getSubCategory().getSubCategoryId() == 39 || main.getSubCategory().getSubCategoryId() == 45) {
						return "site/apparels_accessories/edit_apparel_clothing";
					}else if (main.getSubCategory().getSubCategoryId() == 40 || main.getSubCategory().getSubCategoryId() == 46) {
						return "site/apparels_accessories/edit_apparel_shoes";
					}else if (main.getSubCategory().getSubCategoryId() == 42 || main.getSubCategory().getSubCategoryId() == 43) {
						return "site/apparels_accessories/edit_apparel_accessory";
					}else {
						return "site/books_learning/edit_books-learning";
					}
				}else if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate")) {
					if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Flatmates & Paying Guests")) {
						return "site/events_happenings/edit_events";
					}else {
						return "site/realestate/edit_realestate";
					}
				}else if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Business & Industrial")) {
					if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Business For Sale")) {
						return "site/books_learning/edit_business_for_sale";
					}else {
						return "site/books_learning/edit_books-learning";
					}
				}else if (main.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Sports & Fitness")) {
					if(main.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Bicycles")) {
						return "site/books_learning/edit_sport_bicycle";
					}else {
						return "site/books_learning/edit_books-learning";
					}
				}else if (main.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Travel, Tour & Packages")) {
					if(main.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Tour Package - Domestic") || main.getSubCategory().getSubCategoryName().trim().equalsIgnoreCase("Tour Package - International")) {
						return "site/books_learning/edit_travel";
					}else {
						return "site/events_happenings/edit_events";
					}
				}else if (main.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Computer & Peripherals")) {
					if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Desktop PC") || main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Laptops")) {
						return "site/books_learning/edit_laptop";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Monitors")) {
						return "site/books_learning/edit_monitor";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
						return "site/books_learning/edit_networking";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
						return "site/books_learning/edit_printer";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Software")) {
						return "site/books_learning/edit_software";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
						return "site/books_learning/edit_storage";
					}else if(main.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
						return "site/books_learning/edit_tablet";
					}else {
						return "site/books_learning/edit_books-learning";
					}
				}
				
			}

			return "site/test?has_not_been_redirected_yet";
		} else {
			return "redirect:/error";
		}

	}

	@PostMapping("/editAds/books/save")
	public String editSave(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			@ModelAttribute("delivery") Delivery delivery, @ModelAttribute("warranty") Warranty warranty,
			@ModelAttribute("commonSpec") CommonSpec commonSpec, @ModelAttribute("apparelClothingSpec") ApparelClothingSpec apparelClothingSpec, 
			@ModelAttribute("apparelShoesSpec") ApparelShoesSpec apparelShoesSpec, @ModelAttribute("apparelAccessorySpec") ApparelAccessorySpec apparelAccessorySpec,
			@ModelAttribute("realEstateSpec") RealEstateSpec realEstateSpec, @ModelAttribute("businessSaleSpec") BusinessSaleSpec businessSaleSpec, 
			@ModelAttribute("sportBicycleSpec") SportBicycleSpec sportBicycleSpec, @ModelAttribute("travelSpec") TravelSpec travelSpec,
			@ModelAttribute("laptopSpec") LaptopSpec laptopSpec, @ModelAttribute("monitorSpec") MonitorSpec monitorSpec, @ModelAttribute("networkingSpec") NetworkingEquipmentSpec networkingSpec,
			@ModelAttribute("printerSpec") PrinterSpec printerSpec, @ModelAttribute("softwareSpec") SoftwareSpec softwareSpec, @ModelAttribute("storageSpec") StorageSpec storageSpec,
			@ModelAttribute("tabletSpec") TabletSpec tabletSpec, HttpServletRequest request) {

		// try {
		// if(mainads.getCustomer().getCustomerId() != 0) {
		// /*
		// * To pivot from NullPointer Exception.
		// */
		// }
		//
		// }catch(NullPointerException nul) {
		// return
		// "redirect:/member/editAds/"+mainads.getCustomer().getCustomerId()+"/"+mainads.getId()+"?cusErr";
		// }
		//
		// if(result.hasErrors()) {
		// System.err.println(">>>>>>>>>>>>>>>>> RESULT HAS ERROR >>>>>>>>>>>>>>>>>>");
		// List<SubModel> subModelList =
		// subModelRepo.findBySubCategorySubCategoryId(mainads.getSubCategory().getSubCategoryId());
		//
		// if(subModelList.size()==0) {
		//
		// if(mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Books
		// & Learning")) {
		// return "site/books_learning/edit_books-learning";
		// }else
		// if(mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Beauty
		// & Health")) {
		// return "redirect:/?from-Beauty";
		// }else
		// if(mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Events
		// & Happenings")) {
		// return "site/events_happenings/edit_events";
		// }else
		// if(mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Computer
		// & Peripherals")) {
		// return "redirect:/?from-Computer-Peripherals";
		// }
		// }
		// return "site/test?has_not_been_redirected_yet";
		// }

		/*
		 * Coverting Param String Date in to Date Format.
		 */

		String val = request.getParameter("addedDate");
		String val2 = request.getParameter("expiryDate");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {

			Date addedDate = formatter.parse(val);
			Date expiryDate = formatter.parse(val2);

			mainads.setAddedDate(addedDate);
			mainads.setExpiryDate(expiryDate);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mainRepo.save(mainads);

		// Initialization

		Delivery dev = deliveryRepo.findByMainAdsId(mainads.getId());
		Warranty war = warrantyRepo.findByMainAdsId(mainads.getId());
		CommonSpec com = commonSpecRepo.findByMainAdsId(mainads.getId());
		
		ApparelShoesSpec shoes = apparelShoesSpecRepo.findByMainAdsId(mainads.getId());
		ApparelClothingSpec clothing = apparelClothingSpecRepo.findByMainAdsId(mainads.getId());
		ApparelAccessorySpec accessory = apparelAccessorySpecRepo.findByMainAdsId(mainads.getId());
		RealEstateSpec realestate = realEstateSpecRepo.findByMainAdsId(mainads.getId());
		
		BusinessSaleSpec businessSale = businessSaleSpecRepo.findByMainAdsId(mainads.getId());
		SportBicycleSpec sport = sportBicycleSpecRepo.findByMainAdsId(mainads.getId());
		TravelSpec travel = travelSpecRepo.findByMainAdsId(mainads.getId());
		
		LaptopSpec laptop = laptopSpecRepo.findByMainAdsId(mainads.getId());
		MonitorSpec monitor = monitorSpecRepo.findByMainAdsId(mainads.getId());
		NetworkingEquipmentSpec network = networkingSpecRepo.findByMainAdsId(mainads.getId());
		PrinterSpec printer = printerSpecRepo.findByMainAdsId(mainads.getId());
		SoftwareSpec software = softwareSpecRepo.findByMainAdsId(mainads.getId());
		StorageSpec storage = storageSpecRepo.findByMainAdsId(mainads.getId());
		TabletSpec tablet = tabletSpecRepo.findByMainAdsId(mainads.getId());

		if(!mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate")) {
			if (delivery.getHomeDelivery().equalsIgnoreCase("No")) {
				delivery.setDeliveryArea(null);
				delivery.setDeliveryCharges(null);
				delivery.setId(dev.getId());

				deliveryRepo.save(delivery);
			} else {
				delivery.setId(dev.getId());
				deliveryRepo.save(delivery);
			}
			if (warranty.getWarrantyType().equalsIgnoreCase("No Warranty")) {
				warranty.setWarrantyIncludes(null);
				warranty.setWarrantyPeriod(null);
				warranty.setId(war.getId());

				warrantyRepo.save(warranty);
			} else {
				warranty.setId(war.getId());
				warrantyRepo.save(warranty);
			}	
		}

		commonSpec.setId(com.getId());
		commonSpecRepo.save(commonSpec);
		
		if (mainads.getSubCategory().getSubCategoryId() == 35 || mainads.getSubCategory().getSubCategoryId() == 39 || mainads.getSubCategory().getSubCategoryId() == 45) {
			apparelClothingSpec.setId(clothing.getId());
			apparelClothingSpecRepo.save(apparelClothingSpec);
		} else if (mainads.getSubCategory().getSubCategoryId() == 40 || mainads.getSubCategory().getSubCategoryId() == 46) {
			apparelShoesSpec.setId(shoes.getId());
			apparelShoesSpecRepo.save(apparelShoesSpec);
		} else if (mainads.getSubCategory().getSubCategoryId() == 42 || mainads.getSubCategory().getSubCategoryId() == 43) {
			apparelAccessorySpec.setId(accessory.getId());
			apparelAccessorySpecRepo.save(apparelAccessorySpec);
		} else if(mainads.getSubCategory().getCategory().getCategoryName().equalsIgnoreCase("Real Estate") && !mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Flatmates & Paying Guests")) {
			realEstateSpec.setId(realestate.getId());
			realEstateSpecRepo.save(realEstateSpec);
		} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Business & Industrial") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Business For Sale")) {
			businessSaleSpec.setId(businessSale.getId());
			businessSaleSpecRepo.save(businessSaleSpec);
		} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Sports & Fitness") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Bicycles")) {
			sportBicycleSpec.setId(sport.getId());
			sportBicycleSpecRepo.save(sportBicycleSpec);
		} else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Travel, Tour & Packages") && mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tour Package - Domestic") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tour Package - International")) {
			travelSpec.setId(travel.getId());
			travelSpecRepo.save(travelSpec);
		}else if(mainads.getSubCategory().getCategory().getCategoryName().trim().equalsIgnoreCase("Computer & Peripherals")) {
			if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Desktop PC") || mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Laptops")) {
				laptopSpec.setId(laptop.getId());
				laptopSpecRepo.save(laptopSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Monitors")) {
				monitorSpec.setId(monitor.getId());
				monitorSpecRepo.save(monitorSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Networking Equipments")) {
				networkingSpec.setId(network.getId());
				networkingSpecRepo.save(networkingSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Printers & Scanner")) {
				printerSpec.setId(printer.getId());
				printerSpecRepo.save(printerSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Software")) {
				softwareSpec.setId(software.getId());
				softwareSpecRepo.save(softwareSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Storage & Optical Drives")) {
				storageSpec.setId(storage.getId());
				storageSpecRepo.save(storageSpec);
			}else if(mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Tablet PC & iPads")) {
				tabletSpec.setId(tablet.getId());
				tabletSpecRepo.save(tabletSpec);
			}
		}
		return "redirect:/savePicture/" + mainads.getId();
	}

	@PostMapping("/editAds/cars/save")
	public String editSaveCar(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			@ModelAttribute("delivery") Delivery delivery, @ModelAttribute("warranty") Warranty warranty,
			@ModelAttribute("commonSpec") CommonSpec commonSpec, @ModelAttribute("autoCarSpec") AutoCarSpec autoCarSpec,
			@ModelAttribute("autoMotoCycleSpec") AutoMotocycleSpec autoMotoCycleSpec, @ModelAttribute("handsetSpec") HandsetSpec handsetSpec,
			HttpServletRequest request) {

		String val = request.getParameter("addedDate");
		String val2 = request.getParameter("expiryDate");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {

			Date addedDate = formatter.parse(val);
			Date expiryDate = formatter.parse(val2);

			mainads.setAddedDate(addedDate);
			mainads.setExpiryDate(expiryDate);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mainRepo.save(mainads);

		// Initialization

		Delivery dev = deliveryRepo.findByMainAdsId(mainads.getId());
		Warranty war = warrantyRepo.findByMainAdsId(mainads.getId());
		CommonSpec com = commonSpecRepo.findByMainAdsId(mainads.getId());
		AutoCarSpec car = autoCarSpecRepo.findByMainAdsId(mainads.getId());
		AutoMotocycleSpec moto = autoMotoCycleSpecRepo.findByMainAdsId(mainads.getId());
		HandsetSpec handset = handsetSpecRepo.findByMainAdsId(mainads.getId());

		if (delivery.getHomeDelivery().equalsIgnoreCase("No")) {
			delivery.setDeliveryArea(null);
			delivery.setDeliveryCharges(null);
			delivery.setId(dev.getId());

			deliveryRepo.save(delivery);
		} else {
			delivery.setId(dev.getId());
			deliveryRepo.save(delivery);
		}

		if (warranty.getWarrantyType().equalsIgnoreCase("No Warranty")) {
			warranty.setWarrantyIncludes(null);
			warranty.setWarrantyPeriod(null);
			warranty.setId(war.getId());

			warrantyRepo.save(warranty);
		} else {
			warranty.setId(war.getId());
			warrantyRepo.save(warranty);
		}

		commonSpec.setId(com.getId());
		commonSpecRepo.save(commonSpec);

		if (mainads.getSubCategory().getSubCategoryName().equals("Cars")) {
			autoCarSpec.setId(car.getId());
			autoCarSpecRepo.save(autoCarSpec);
		} else if (mainads.getSubCategory().getSubCategoryName().equals("Motorcycles")) {
			autoMotoCycleSpec.setId(moto.getId());
			autoMotoCycleSpecRepo.save(autoMotoCycleSpec);
		} else if (mainads.getSubCategory().getSubCategoryName().equalsIgnoreCase("Handsets")) {
			handsetSpec.setId(handset.getId());
			handsetSpecRepo.save(handsetSpec);
		}

		return "redirect:/savePicture/" + mainads.getId();
	}

	@PostMapping("/editAds/events/save")
	public String editAdsEvent(@Valid @ModelAttribute("mainAds") MainAds mainads, BindingResult result,
			HttpServletRequest request) {

		// System.err.println(">>>>>>>> added >>>>>>>>" + mainads.getAddedDate());

		String val = request.getParameter("addedDate");
		String val2 = request.getParameter("expiryDate");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {

			Date addedDate = formatter.parse(val);
			Date expiryDate = formatter.parse(val2);

			mainads.setAddedDate(addedDate);
			mainads.setExpiryDate(expiryDate);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mainRepo.save(mainads);

		return "redirect:/savePicture/" + mainads.getId();
	}

	@GetMapping("/renew/{mainAdsId}")
	public String renewAd(@PathVariable("mainAdsId") int id, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Customer cust = customerRepo.findByUserEmail(email);
		MainAds main = mainRepo.findByIdAndCustomerCustomerId(id, cust.getCustomerId());

		if (main != null) {
			model.addAttribute("main", mainRepo.findOne(id));
			return "site/member_area/renew";
		} else {
			return "redirect:/error";
		}
	}

	@PostMapping("/renew/save")
	public String renewSave(@Valid @ModelAttribute("main") MainAds main, BindingResult result) {

		Date adddate = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(adddate);
		c.add(Calendar.DATE, main.getAdRunDays());
		Date expirydate = c.getTime();

		main.setAddedDate(adddate);
		main.setExpiryDate(expirydate);
		main.setExpired(false);

		mainRepo.save(main);

		return "redirect:/member?success";
	}
	
	@GetMapping("speakMessage")
	public String speakMessage(Model model) {
		List<Question> customerBasedQuestions = getCustomerBasedQuestions();
		model.addAttribute("customerBasedQuestions", customerBasedQuestions);
		
		Reply reply = new Reply();
		model.addAttribute("reply", reply);
		
		return  "site/member_area/speakMessage";
	}
	
	@PostMapping("saveReply")
	public String saveReply(@ModelAttribute("reply") Reply reply) {
		
		reply.setReplied(true);
		replyRepo.save(reply);
		return "redirect:/member/speakMessage";
	}
	
	public List<Question> getCustomerBasedQuestions(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		if (!email.equals("anonymousUser")) {
			
			Customer cus = customerRepo.findByUserEmail(email);
			List<Question> customerBasedQuestions = new ArrayList<>();
			for(Question q : questionRepo.findByAskedToCustomerId(cus.getCustomerId())) {
				customerBasedQuestions.add(q);
			}
			return customerBasedQuestions;
		}
		return null;
	}
	
	@GetMapping("/wishlist")
	public String getWishlist(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		if (!email.equals("anonymousUser")) {
			Customer cus = customerRepo.findByUserEmail(email);
			model.addAttribute("wishlist", wishlistRepo.findByCustomerCustomerId(cus.getCustomerId()));
			return "site/member_area/wishlist";
		}else {
			return "redirect:/error";
		}
	}
	
	@GetMapping("/deleteWishlist/{id}")
	public String deleteWishlist(@PathVariable("id") int id) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();

		Customer cust = customerRepo.findByUserEmail(email);
		Wishlist wishlist = wishlistRepo.findByIdAndCustomerCustomerId(id, cust.getCustomerId());

		if (wishlist != null) {
			wishlistRepo.delete(id);
			return "redirect:/member/wishlist/";
		} else {
			return "redirect:/error";
		}
	}
	
//	TESTING THE SMS VERIFICATION MODULE
	
//	@GetMapping("/sendSms")
//	public void SmsSender() {
//		
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//
//        Message message = Message
//                .creator(new PhoneNumber("+9779813344166"), // to
//                        new PhoneNumber("+12065352138"), // from
//                        "https://www.vortexnepal.com")
//                .create();
//
//        System.out.println(message.getSid());
//	}
	
//	@GetMapping("/start")
//	public void start(String countryCode, String phoneNumber, String via) {
//		
//		countryCode = "+977";
//		phoneNumber = "9813344166";
//		via="SMS";
//		
//		Params params = new Params();
//		params.setAttribute("code_length", "4");
//		Verification verification = authyApiClient.getPhoneVerification().start(countryCode, phoneNumber, via, params);
//		
//		if(!verification.isOk()) {
//			System.err.println(verification.getMessage());
//		}
//
//	}
//	
//	@GetMapping("/verify/{token}")
//	public void verify(String countryCode, String phoneNumber, @PathVariable("token") String token) {
//		Verification verification = authyApiClient.getPhoneVerification().check(phoneNumber, countryCode, token);
//		if(!verification.isOk()) {
//			System.err.println(verification.getMessage());
//		}
//
//	}
	
	/*
	 * SMS VERIFICATION MODULE EXECUTED: SUCCESS 
	 * Indicating verification page - verifyPage
	 * Redirecting Page to SendSMS Module
	 * 
	 */
	
	@GetMapping("/verifypage")
	public String verifyPage(Model model) {
		return "site/member_area/verifyPage";
	}
	
	@PostMapping("/verifypage/{mobilenumber}")
	public String verifyPage(Model model, @PathVariable("mobilenumber") String mobilenumber) {

		if(otpSystemRestController.sendOTP(mobilenumber).getStatusCode().equals(HttpStatus.OK)) {

			return "site/member_area/verifyToken";
		}
		return "redirect;/verifypage?error";
	}	
}