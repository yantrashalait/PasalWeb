package com.vortexnepal.pasal.admin.controller;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vortexnepal.pasal.ads.model.MainAds;
import com.vortexnepal.pasal.ads.repository.MainAdsRepository;
import com.vortexnepal.pasal.repository.BrandRepository;
import com.vortexnepal.pasal.repository.CustomerRepository;

@Controller
@RequestMapping("/admin")
public class AdsAdminController {
	
	@Autowired
	private MainAdsRepository mainRepo;
	@Autowired
	private CustomerRepository customerRepo;
	@Autowired
	private BrandRepository brandRepo;
	@PersistenceContext
	EntityManager entityManager;
	
	@GetMapping()
	public String home(Model model, @RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		/*
		 * Start Of Ads
		 */
		
		Query queryAds = entityManager.createQuery("FROM MainAds ORDER BY id DESC");
		int sizeAds = 25;
		/*
		 * From MainAdsService Page for pagination logic
		 */
		int adsIndexAds = page-1;
		int offsetAds = adsIndexAds * sizeAds;
		
		queryAds.setFirstResult(offsetAds);
		queryAds.setMaxResults(sizeAds);
		
		
		Object[] objectAds =  new Object[2];
		objectAds[0] = queryAds.getResultList();
		
		String countQueryAds = "SELECT COUNT(*) " + "FROM MainAds ORDER BY id DESC";
		
		Query query2Ads = entityManager.createQuery(countQueryAds);
		
			long countAds = (long) query2Ads.getSingleResult();
		
		objectAds[1] = countAds;
		
		/*
		 * From HomeController Page for pagination logic
		 */
		
		long totalAdsAds = (long) objectAds[1];
		double exactPageAds = totalAdsAds / (double) sizeAds;
		long totalPagesAds = (long) Math.ceil(exactPageAds);
		
		model.addAttribute("ads", objectAds[0]);
		model.addAttribute("totalPagesAds", totalPagesAds);
		
		/*
		 * End of Ads
		 */
		
		/*
		 * Start Of Customer/Users
		 */
		Query query = entityManager.createQuery("FROM Customer ORDER BY addedDate DESC");
		int size = 25;
			int adsIndex = page-1;
			int offset = adsIndex * size;
			
			query.setFirstResult(offset);
			query.setMaxResults(size);
			
			
			Object[] object =  new Object[2];
			object[0] = query.getResultList();
			
			String countQuery = "SELECT COUNT(*) " + "FROM Customer ORDER BY addedDate DESC";
			
			Query query2 = entityManager.createQuery(countQuery);
			
			long count = (long) query2.getSingleResult();
			
			object[1] = count;

			long totalAds = (long) object[1];
			double exactPage = totalAds / (double) size;
			long totalPages = (long) Math.ceil(exactPage);
		
		model.addAttribute("customers", object[0]);
		model.addAttribute("totalPages", totalPages);
		/*
		 * End Of Customer/Users
		 */
		
		/*
		 * Start Of ActiveUsers
		 */
		Query queryActiveUsers = entityManager.createQuery("FROM MainAds WHERE expired = 0 ORDER BY addedDate DESC");
		int sizeActiveUsers = 25;
			int adsIndexActiveUsers = page-1;
			int offsetActiveUsers = adsIndexActiveUsers * sizeActiveUsers;
			
			queryActiveUsers.setFirstResult(offsetActiveUsers);
			queryActiveUsers.setMaxResults(sizeActiveUsers);
			
			
			Object[] objectActiveUsers =  new Object[2];
			objectActiveUsers[0] = queryActiveUsers.getResultList();
			
			String countQueryActiveUsers = "SELECT COUNT(*) " + "FROM MainAds WHERE expired = 0 ORDER BY addedDate DESC";
			
			Query query2ActiveUsers = entityManager.createQuery(countQueryActiveUsers);
			
			long countActiveUsers = (long) query2ActiveUsers.getSingleResult();
			
			objectActiveUsers[1] = countActiveUsers;

			long totalAdsActiveUsers = (long) objectActiveUsers[1];
			double exactPageActiveUsers = totalAdsActiveUsers / (double) sizeActiveUsers;
			long totalPagesActiveUsers = (long) Math.ceil(exactPageActiveUsers);
		
		model.addAttribute("activeads", objectActiveUsers[0]);
		model.addAttribute("totalPagesActiveUsers", totalPagesActiveUsers);
		/*
		 * End Of ActiveUsers
		 */
		/*
		 * Start Of ExpiredUsers
		 */
		Query queryExpiredUsers = entityManager.createQuery("FROM MainAds WHERE expired = 1 ORDER BY addedDate DESC");
		int sizeExpiredUsers = 25;
			int adsIndexExpiredUsers = page-1;
			int offsetExpiredUsers = adsIndexExpiredUsers * sizeExpiredUsers;
			
			queryExpiredUsers.setFirstResult(offsetExpiredUsers);
			queryExpiredUsers.setMaxResults(sizeExpiredUsers);
			
			
			Object[] objectExpiredUsers =  new Object[2];
			objectExpiredUsers[0] = queryExpiredUsers.getResultList();
			
			String countQueryExpiredUsers = "SELECT COUNT(*)" + "FROM MainAds WHERE expired = 1 ORDER BY addedDate DESC";
			
			Query query2ExpiredUsers = entityManager.createQuery(countQueryExpiredUsers);
			
			long countExpiredUsers = (long) query2ExpiredUsers.getSingleResult();
			
			objectExpiredUsers[1] = countExpiredUsers;

			long totalAdsExpiredUsers = (long) objectExpiredUsers[1];
			double exactPageExpiredUsers = totalAdsExpiredUsers / (double) sizeExpiredUsers;
			long totalPagesExpiredUsers = (long) Math.ceil(exactPageExpiredUsers);
		
		model.addAttribute("expiredads", objectExpiredUsers[0]);
		model.addAttribute("totalPagesExpiredUsers", totalPagesExpiredUsers);
		/*
		 * End Of ExpiredUsers
		 */
		
		model.addAttribute("totalUsers", customerRepo.countAllCustomers());
		model.addAttribute("totalAds", mainRepo.countAllAds());
		model.addAttribute("totalActiveAds", mainRepo.countActiveAds());
		model.addAttribute("totalExpiredAds", mainRepo.countExpiredAds());
		
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		
		return "/admin/home";
	}
	
	@GetMapping("/ads")
	public String ads(Model model, @RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		Query query = entityManager.createQuery("FROM MainAds ORDER BY id DESC");
		int size = 25;
		/*
		 * From MainAdsService Page for pagination logic
		 */
		int adsIndex = page-1;
		int offset = adsIndex * size;
		
		query.setFirstResult(offset);
		query.setMaxResults(size);
		
		
		Object[] object =  new Object[2];
		object[0] = query.getResultList();
		
		String countQuery = "SELECT COUNT(*) " + "FROM MainAds ORDER BY id DESC";
		
		Query query2 = entityManager.createQuery(countQuery);
		
			long count = (long) query2.getSingleResult();
		
		object[1] = count;
		
		/*
		 * From HomeController Page for pagination logic
		 */
		
		long totalAds = (long) object[1];
		double exactPage = totalAds / (double) size;
		long totalPages = (long) Math.ceil(exactPage);
		
		model.addAttribute("ads", object[0]);
		model.addAttribute("totalPages", totalPages);
		
		model.addAttribute("brandhousing", brandRepo.findByType("housing"));
		model.addAttribute("brandcars", brandRepo.findByType("cars"));
		
		return "admin/ads/ads";
	}
	
	@GetMapping("/featured/{mainAdsId}")
	public String makeFeatured(@PathVariable("mainAdsId") int id,Model model) {
		MainAds main = mainRepo.findOne(id);
		if(main.isFeatured() == false) {
			main.setFeatured(true);
			mainRepo.save(main);
		}else {
			main.setFeatured(false);
			mainRepo.save(main);
		}
		return "redirect:/admin/ads?success";
	}
}
