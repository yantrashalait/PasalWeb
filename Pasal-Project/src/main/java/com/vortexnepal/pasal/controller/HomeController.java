package com.vortexnepal.pasal.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.ads.model.Question;
import com.vortexnepal.pasal.ads.repository.DeliveryRepository;
import com.vortexnepal.pasal.ads.repository.MainAdsRepository;
import com.vortexnepal.pasal.ads.repository.PictureRepository;
import com.vortexnepal.pasal.ads.repository.QuestionRepository;
import com.vortexnepal.pasal.ads.repository.ReplyRepository;
import com.vortexnepal.pasal.ads.repository.WarrantyRepository;
import com.vortexnepal.pasal.model.Category;
import com.vortexnepal.pasal.model.Customer;
import com.vortexnepal.pasal.model.SubCategory;
import com.vortexnepal.pasal.model.SubModel;
import com.vortexnepal.pasal.model.User;
import com.vortexnepal.pasal.model.UserRole;
import com.vortexnepal.pasal.model.Wishlist;
import com.vortexnepal.pasal.repository.CarRepository;
import com.vortexnepal.pasal.repository.CategoryRepository;
import com.vortexnepal.pasal.repository.CustomerRepository;
import com.vortexnepal.pasal.repository.HousingRepository;
import com.vortexnepal.pasal.repository.SubCategoryRepository;
import com.vortexnepal.pasal.repository.SubModelRepository;
import com.vortexnepal.pasal.repository.UserRepository;
import com.vortexnepal.pasal.repository.WishlistRepository;
import com.vortexnepal.pasal.service.MainAdsService;
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
@RequestMapping(value = "/")
public class HomeController implements ErrorController{
	
	private static final String PATH = "/error";
	
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private SubCategoryRepository subCategoryRepo;
	@Autowired
	private MainAdsRepository mainRepo;
	@Autowired
	private DeliveryRepository deliveryRepo;
	@Autowired
	private WarrantyRepository warrantyRepo;
	@Autowired
	private CommonSpecRepository commonSpecRepo;
	@Autowired
	private PictureRepository pictureRepo;
	@Autowired
	private SubModelRepository subModelRepo;
	@Autowired
	private AutoCarSpecRepository autoCarSpecRepo;
	@Autowired
	private AutoMotocycleSpecRepository autoMotoSpecRepo;
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
	private TravelSpecRepository travelSpecRepo;
	@Autowired
	private SportBicycleSpecRepository sportBicycleSpecRepo;
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
	private UserRepository userRepo;
	@Autowired
	private CustomerRepository customerRepo;
	@Autowired
	private MainAdsService mainAdsService;
	@Autowired
	private HousingRepository housingRepo;
	@Autowired
	private CarRepository carRepo;
	@Autowired
	private QuestionRepository questionRepo;
	@Autowired
	private ReplyRepository replyRepo;
	@Autowired
	private WishlistRepository wishlistRepo;

	@GetMapping
	public String home(Model model, @RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String fullSearch) {

		/*
		 * For Counting the No. of subcategories in each category.
		 */

		List<Integer> adCountByCategory = new ArrayList<>();
		List<Integer> adCountBySubcategory = new ArrayList<>();

		for (Category cat : categoryRepo.findAll()) {
			int countCategoryAds = mainRepo.selectByCategory(cat.getCategoryId()).size();
			adCountByCategory.add(countCategoryAds);
		}
		model.addAttribute("adCountBycategory", adCountByCategory);

		for (SubCategory subCat : subCategoryRepo.findAll()) {
			int countSubCategoryAds = mainRepo.selectBySubCategory(subCat.getSubCategoryId()).size();
			adCountBySubcategory.add(countSubCategoryAds);
		}
		model.addAttribute("adCountBySubcategory", adCountBySubcategory);

		/*
		 * End Counting Query !
		 */

		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, 0);

		for (MainAds main : mainRepo.findAll()) {
			int comp = main.getExpiryDate().compareTo(today.getTime());
			if (comp < 0) {
				main.setExpired(true);
				mainRepo.save(main);
			} else if (comp > 0) {
				main.setExpired(false);
				mainRepo.save(main);
			}
		}

		// for(Brand brand : brandRepo.findAll()) {
		// if(brand.isActivate() == true) {
		// model.addAttribute("activatedBrand", brand);
		// System.err.println("Yeha samma");
		// if(brand.getHousing().size() != 0) {
		// System.err.println(">>>>>>>>>>>> Brand Get Name >>>>>"+
		// brand.getHousing().get(0).getHousingName());
		// }
		//
		// }
		// }
		
		model.addAttribute("selectedHousing", housingRepo.findTop4ByBrandActivateTrue());
		model.addAttribute("selectedCar", carRepo.findTop4ByBrandActivateTrue());

		model.addAttribute("popularTrendings", mainRepo.popularTrendings());
		model.addAttribute("recentAds", mainRepo.recentAds());

		model.addAttribute("categories", categoryRepo.findAll());
		model.addAttribute("subcategories", subCategoryRepo.findAll());

		model.addAttribute("mainadsdetails", mainRepo.findAllDESC());
		model.addAttribute("pictures", pictureRepo.findAll());

		try {
			if (!fullSearch.isEmpty() && fullSearch != null) {

				/*
				 * Pagination
				 */

				int size = 5;
				Object[] obj = mainAdsService.filterSearch(fullSearch, page, size);

				long totalAds = (long) obj[1];
				double exactPage = totalAds / (double) size;
				long totalPages = (long) Math.ceil(exactPage);
				
				model.addAttribute("listing", obj[0]);
			
				model.addAttribute("totalPages", totalPages);
				return "site/searchPage";
			}
		} catch (NullPointerException nova) {

		}

		/*
		 * Temporarily Not Used Right Now !! Used to get session object Email and Roles
		 * of current user. customer object is founded by passing email in repository
		 * and passed to JSP
		 */

		// Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		// String email = auth.getName();
		// String role = auth.getAuthorities().toString();
		//
		// Customer customer = customerRepo.findByUserEmail(email);
		// model.addAttribute("customer", customer);
		//
		// model.addAttribute("email", email);
		// model.addAttribute("role", role);

		return "site/index";
	}

	@GetMapping("/test")
	public String test(Model model) {
		return "site/test";
	}

	@GetMapping("/login")
	public String loginPage(Model model) {
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		if (!userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			model.addAttribute("featuredAds", mainRepo.findAllDESC());
			return "site/login/loginPage";
		}
	}

	@GetMapping("/register")
	public String register(Model model) {
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		// userEmail equals to anonymousUser if user is not logged in
		
		if (!userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			model.addAttribute("user", new User());
			model.addAttribute("customerForm", new Customer());
			model.addAttribute("featuredAds", mainRepo.findAllDESC());

			return "site/login/register";
		}
	}

	@PostMapping("/register")
	public String postRegister(@Valid @ModelAttribute("user") User user,
			@ModelAttribute("customerForm") Customer customer, HttpServletRequest request, Model model) {
		
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
		
		// userEmail equals to anonymousUser if user is not logged in
		if (!userEmail.equals("anonymousUser")) {
			return "redirect:/error";
		} else {
			User userExist = userRepo.findByEmail(user.getEmail());
			if (userExist == null) {
				if(user.getPassword().length() < 6 || user.getPassword().length() > 20 ) {
					
					model.addAttribute("user", user);
					model.addAttribute("passErr", "passErr");
					model.addAttribute("customerForm", customer);
					return "site/login/register";
				}
				
				if(customer.getPhone().length() != 10) {
					
					model.addAttribute("user", user);
					model.addAttribute("phoneErr", "phoneErr");
					model.addAttribute("customerForm", customer);
					return "site/login/register";
				}
				
				try {
					Integer.parseInt(customer.getPhone());
				}catch(NumberFormatException nex) {
					model.addAttribute("user", user);
					model.addAttribute("phoneErr", "phoneErr");
					model.addAttribute("customerForm", customer);
					return "site/login/register";
				}
				

				/*
				 * Enabled is triggered when passed through '/register URL'.
				 */
				user.setEnabled(true);

				/*
				 * Assigning UserRole when adding User object
				 */
				UserRole userRole = new UserRole();
				userRole.setUser(user);
				userRole.setRole("ROLE_USER");

				/*
				 * Passing userRole object in user object. call save function.
				 */
				user.setUserRole(userRole);
				userRepo.save(user);

				customer.setUser(user);
				customerRepo.save(customer);

				// Auto login after registration
				try {
					request.login(user.getEmail(), user.getPassword());
				} catch (ServletException e) {

				}
				return "redirect:/";
			} else {
				
				model.addAttribute("user", user);
				model.addAttribute("emailErr", "emailErr");
				model.addAttribute("customerForm", customer);
				return "site/login/register";
			}
		}
	}

	@GetMapping("detail/{id}")
	public String detail(Model model, @PathVariable("id") int id) {

		/*
		 * For Counting the No. of subcategories in each category.
		 */

			List<Integer> adCountByCategory = new ArrayList<>();
			List<Integer> adCountBySubcategory = new ArrayList<>();
	
			for (Category cat : categoryRepo.findAll()) {
				int countCategoryAds = mainRepo.selectByCategory(cat.getCategoryId()).size();
				adCountByCategory.add(countCategoryAds);
			}
			model.addAttribute("adCountBycategory", adCountByCategory);
	
			for (SubCategory subCat : subCategoryRepo.findAll()) {
				int countSubCategoryAds = mainRepo.selectBySubCategory(subCat.getSubCategoryId()).size();
				adCountBySubcategory.add(countSubCategoryAds);
			}
			model.addAttribute("adCountBySubcategory", adCountBySubcategory);

		/*
		 * End Counting Query !
		 */

		model.addAttribute("categories", categoryRepo.findAll());
		model.addAttribute("subcategories", subCategoryRepo.findAll());

		model.addAttribute("mainAd", mainRepo.findOne(id));
		model.addAttribute("featuredAds", mainRepo.findAllDESC());
		model.addAttribute("selectedHousing", housingRepo.findTop4ByBrandActivateTrue());

		/*
		 * For View Count Refresh the view count and increment by 1
		 */
			MainAds main = mainRepo.findOne(id);
			main.setViewCount(main.getViewCount() + 1);
			mainRepo.save(main);

		/*
		 * Initializing the Today's Date. Comparing and Calculating todays date and
		 * Expiry Date, given the Difference in days.
		 */
			if (main.getExpiryDate() != null) {
				Date todayDate = new Date();
				Calendar c = Calendar.getInstance();
				c.setTime(todayDate);
				c.add(Calendar.DATE, 0);
				todayDate = c.getTime();
				int differenceInDays = (int) ((main.getExpiryDate().getTime() - todayDate.getTime())
						/ (1000 * 60 * 60 * 24));
				model.addAttribute("differenceInDays", differenceInDays);
			}
		
		/*
		 * Comment and Reply Section:
		 */
			Question question = new Question();
			model.addAttribute("question", question);
		/*
		 * End Of Comment and Reply Section !
		 */

		model.addAttribute("delivery", deliveryRepo.findByMainAdsId(id));
		model.addAttribute("warranty", warrantyRepo.findByMainAdsId(id));
		model.addAttribute("commonSpec", commonSpecRepo.findByMainAdsId(id));
		model.addAttribute("autoCarSpec", autoCarSpecRepo.findByMainAdsId(id));
		model.addAttribute("autoMotoSpec", autoMotoSpecRepo.findByMainAdsId(id));
		model.addAttribute("apparelClothingSpec", apparelClothingSpecRepo.findByMainAdsId(id));
		model.addAttribute("apparelAccessorySpec", apparelAccessorySpecRepo.findByMainAdsId(id));
		model.addAttribute("apparelShoesSpec", apparelShoesSpecRepo.findByMainAdsId(id));
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
		
		model.addAttribute("pictures", pictureRepo.findByMainAdsId(id));
		model.addAttribute("recentAds", mainRepo.recentAds());
		model.addAttribute("questions", questionRepo.findByMainAdsId(id));
		model.addAttribute("replies", replyRepo.findAll());

		return "site/detail";
	}
	
	@PostMapping("/saveQuestion")
	public String saveQuestion(@ModelAttribute("question") Question question) {
		question.setAskedOn(Calendar.getInstance().getTime());
		questionRepo.save(question);
		return "redirect:/detail/" + question.getMainAds().getId();
	}

	@GetMapping("search/name={categoryName}/id={categoryId}")
	public String searchByCategory(@PathVariable("categoryId") int catid, Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String location, @RequestParam(required = false) String condition,
			@RequestParam(required = false) Long startRange, @RequestParam(required = false) Long endRange,
			@RequestParam(required = false) String search, @RequestParam(required = false) Integer subId) {

		/*
		 * For Counting the No. of subcategories in each category.
		 */
		List<Integer> adCountBySubcategory = new ArrayList<>();
		for (SubCategory subCat : subCategoryRepo.findByCategoryCategoryId(catid)) {

			int countSubCategoryAds = mainRepo.selectBySubCategorySpec(subCat.getSubCategoryId(),
					subCat.getCategory().getCategoryId());
			adCountBySubcategory.add(countSubCategoryAds);

		}
		model.addAttribute("adCountBySubcategory", adCountBySubcategory);
		model.addAttribute("featuredAds", mainRepo.findAllDESC());

		model.addAttribute("category", categoryRepo.findOne(catid));
		model.addAttribute("chosensubcategory", subCategoryRepo.findByCategoryCategoryId(catid));
		
		/*
		 * Pagination
		 */
		int size = 5;
		Object[] obj = mainAdsService.filterCategoryLevel(location, condition, startRange, endRange, search, subId,
				page, size, catid);

		long totalAds = (long) obj[1];
		double exactPage = totalAds / (double) size;
		long totalPages = (long) Math.ceil(exactPage);
		System.out.println(totalAds);
		model.addAttribute("listing", obj[0]);
		model.addAttribute("totalPages", totalPages);

		return "site/browse_by_category/listing";
	}

	@GetMapping("search/{categoryName}/{subCategoryName}/id={subCategoryId}")
	public String searchBySubCategory(@PathVariable("subCategoryId") int subid, Model model,
			@PathVariable("categoryName") String cat,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String location, @RequestParam(required = false) String condition,
			@RequestParam(required = false) Long startRange, @RequestParam(required = false) Long endRange,
			@RequestParam(required = false) String type, @RequestParam(required = false) Integer startYear,
			@RequestParam(required = false) Integer endYear, @RequestParam(required = false) Integer startKilo,
			@RequestParam(required = false) Integer endKilo, @RequestParam(required = false) String fuel,
			@RequestParam(required = false) String transmission, @RequestParam(required = false) String features,
			@RequestParam(required = false) String anchal, @RequestParam(required = false) Integer startLot,
			@RequestParam(required = false) Integer endLot, @RequestParam(required = false) Integer startEngine,
			@RequestParam(required = false) Integer endEngine) {

		model.addAttribute("sublisting", mainRepo.selectBySubCategory(subid));

		// List<MainAds> main = mainRepo.selectBySubCategory(subid);

		model.addAttribute("subcategory", subCategoryRepo.findOne(subid));
		model.addAttribute("categoryName", cat);
		model.addAttribute("submodel", subModelRepo.findBySubCategorySubCategoryId(subid));
		model.addAttribute("featuredAds", mainRepo.findAllDESC());

		model.addAttribute("pictures", pictureRepo.findAll());

		/*
		 * For Counting the No. of subcategories in each category.
		 */
		List<Integer> adCountByModels = new ArrayList<>();
		for (SubModel subMod : subModelRepo.findBySubCategorySubCategoryId(subid)) {

			int countSubModelAds = mainRepo.countBySubModelSubModelIdAndExpiredFalse(subMod.getSubModelId());
			adCountByModels.add(countSubModelAds);

		}
		model.addAttribute("adCountByModels", adCountByModels);

		/*
		 * Pagination
		 */
		int size = 5;
		if (subid == 1) {
			Object[] obj = mainAdsService.filterSubCarCategoryLevel(location, condition, startRange, endRange, type,
					startYear, endYear, startKilo, endKilo, fuel, transmission, features, page, size, subid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("sublisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
		} else if (subid == 2) {

			Object[] obj = mainAdsService.filterSubMotoCategoryLevel(location, condition, startRange, endRange, type,
					anchal, startLot, endLot, startEngine, endEngine, startYear, endYear, startKilo, endKilo, features,
					page, size, subid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("sublisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
		} else {
			Object[] obj = mainAdsService.filterSubCategoryLevel(location, condition, startRange, endRange, page, size,
					subid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("sublisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
		}

		return "site/browse_by_category/sublisting";
	}

	@GetMapping("search/{categoryName}/{subCategoryName}/{subModelName}/id={subModelId}")
	public String searchBySubModel(@PathVariable("subModelId") int modelid, Model model,
			@PathVariable("categoryName") String categoryName, @PathVariable("subCategoryName") String subCategoryName,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(required = false) String location, @RequestParam(required = false) String condition,
			@RequestParam(required = false) Long startRange, @RequestParam(required = false) Long endRange,
			@RequestParam(required = false) String type, @RequestParam(required = false) Integer startYear,
			@RequestParam(required = false) Integer endYear, @RequestParam(required = false) Integer startKilo,
			@RequestParam(required = false) Integer endKilo, @RequestParam(required = false) String fuel,
			@RequestParam(required = false) String transmission, @RequestParam(required = false) String features,
			@RequestParam(required = false) String anchal, @RequestParam(required = false) Integer startLot,
			@RequestParam(required = false) Integer endLot, @RequestParam(required = false) Integer startEngine,
			@RequestParam(required = false) Integer endEngine) {

		model.addAttribute("modellisting", mainRepo.selectBySubModel(modelid));
		model.addAttribute("model", subModelRepo.findOne(modelid));
		model.addAttribute("pictures", pictureRepo.findAll());
		model.addAttribute("featuredAds", mainRepo.findAllDESC());
		
		model.addAttribute("countByModel", mainRepo.countBySubModelSubModelIdAndExpiredFalse(modelid));
		
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("subCategoryName", subCategoryName);
		
		/*
		 * Pagination
		 */
		int size =5;
		if (subCategoryName.equalsIgnoreCase("cars")) {
			Object[] obj = mainAdsService.filterSubCarCategoryLevelModel(location, condition, startRange, endRange, type,
					startYear, endYear, startKilo, endKilo, fuel, transmission, features, page, size, modelid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("modellisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
			
		} else if (subCategoryName.equalsIgnoreCase("Motorcycles")) {

			Object[] obj = mainAdsService.filterSubMotoCategoryLevel(location, condition, startRange, endRange, type,
					anchal, startLot, endLot, startEngine, endEngine, startYear, endYear, startKilo, endKilo, features,
					page, size, modelid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("modellisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
			
		} else {
			Object[] obj = mainAdsService.filterSubCategoryLevelModel(location, condition, startRange, endRange, page, size, modelid);

			long totalAds = (long) obj[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
			System.out.println(totalAds);
			model.addAttribute("modellisting", obj[0]);
			model.addAttribute("totalPages", totalPages);
		}
			
		
		return "site/browse_by_category/modellisting";
	}

	@GetMapping("housing/{brandId}")
	public String housing(@PathVariable("brandId") int brandId, Model model) {
		model.addAttribute("housingByBrand", housingRepo.findByBrandBrandId(brandId));
		return "site/housing/housingDetail";
	}

	@GetMapping("car/{brandId}")
	public String car(@PathVariable("brandId") int brandId, Model model) {
		model.addAttribute("carByBrand", carRepo.findByBrandBrandId(brandId));
		return "site/car/carDetail";
	}

	@GetMapping("housing")
	public String allHousing(Model model) {
		model.addAttribute("housings", housingRepo.findByBrandType("housing"));
		model.addAttribute("selectedHousing", housingRepo.findTop4ByBrandActivateTrue());
		return "site/housing/allHousing";
	}
	
	@GetMapping("car")
	public String allCar(Model model) {
		model.addAttribute("cars", carRepo.findAll());
		model.addAttribute("selectedCar", carRepo.findTop4ByBrandActivateTrue());
		return "site/car/allCar";
	}
	
	@GetMapping("/wishlist/{id}")
	public String  wishlist(@PathVariable("id") int id) {

		
		Wishlist wishlist = new Wishlist();
		MainAds main = mainRepo.findOne(id);
		String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();

		// userEmail equals to anonymousUser if user is not logged in
		if (userEmail.equals("anonymousUser")) {
			return "redirect:/error?loginorregister";
		} else {
		/*
		 * Initiating the value.
		 */
			boolean wishlistAlreadyExist = false;
			boolean adBelongToMe = false;
			/*
			 * Looping through every wishlist Object to check if the specific ads has been already wishlisted 
			 * by the specific user or not.
			 */
				for(Wishlist wish : wishlistRepo.findAll()) {
				/*
				 * Checking if the specific ads has been already wish-listed by the specific user or not.
				 */
					if(wish.getMainads().getId() == id && wish.getCustomer().getCustomerId() == customerRepo.findByUserEmail(userEmail).getCustomerId()) {
						wishlistAlreadyExist = true;
					}
				/*
				 * Check if the ads belongs to the current user.
				 * if it belongs then cannot ad to wish-list, its stupid.
				 */
					for (MainAds chkMainAd : mainRepo.findByCustomerCustomerId(customerRepo.findByUserEmail(userEmail).getCustomerId())) {
						if(chkMainAd.getId() == main.getId()) {
							adBelongToMe = true;
						}
					}
					
					if(adBelongToMe == true) {
						return "redirect:/member/myads?errorThisAdBelongsToYou";
					}
					
				/*
				 * If the Ad hasnt been wish-listed already.
				 */
					if(wishlistAlreadyExist == false && adBelongToMe == false) {
						wishlist.setMainads(main);
						wishlist.setCustomer(customerRepo.findByUserEmail(userEmail));
					}else {
						return "redirect:/member/wishlist?errorWishlistAlreadyExist";
					}
				}
			}
		
		wishlist.setMainads(main);
		wishlist.setCustomer(customerRepo.findByUserEmail(userEmail));

		wishlistRepo.save(wishlist);
		return "redirect:/detail/"+ id+ "?addedToWishlist";
	}
	
	@RequestMapping(value = "/error")
	public String error() {
		return "404";
	}
	
	@Override
	public String getErrorPath() {
		return PATH;
	}
}