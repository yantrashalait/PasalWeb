<%@include file="includes/header.jsp"%> 
  <div id="main" class="site-main">
   	 <section class="product-area product-slide">

          <div class="container">
          	<c:if test="${param.addedToWishlist!=null}">
				<div class="alert alert-success alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true" style="color:#fff">×</span>
					</button>
					<b><i class="fa fa-check" aria-hidden="true" style="color:#fff"></i> <span style="color:#fff">Added to your Wish-List.</span></b>
				</div>
			</c:if>
            <h3 class="section-title">Featured classifieds</h3>
            <div class="owl-carousel owl-theme product-carousel5">
            
            <!-- Feature Ads But Right Now its Recent Ads -->
            		<c:forEach var="recent" items="${featuredAds}">
	            		<div class="item product">
	                <div class="product-image">
	                  <figure class="img-holder">
	                  <c:choose>
	           			<c:when test="${not empty recent.picture[0].pictureName}">
	           				<a href="/detail/${recent.id}"><img src="/pasal/images/mainads/${recent.picture[0].pictureName}" style="height:120px;"></a>                       			
	           			</c:when>
	           			<c:otherwise>
	           				<a href="/detail/${recent.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
	           			</c:otherwise>
	           		</c:choose>
	                    
	                  </figure>
	                </div>
	                <div class="product-content">
	                  <h3 class="name"><a href="/detail/${recent.id}">${recent.adTitle }</a></h3>
	                  <div class="metas clearfix">
	                    <div class="price"> Rs. ${recent.price}</div>
	                    <div class="pro-status" style="color:#365b96;font-size:9px;">${recent.commonSpec.specCondition}</div>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
	            
            </div>
          </div>
     </section>
     
     <section class="content-wrap">
          <div class="container">
            <div class="row">
              <div id="secondary" class="col-md-4 col-lg-3">
                <div class="theiaStickySidebar">
                  <aside class="widget">
                    <div class="title-bar">
                      <h3>Browse by Category</h3>
                    </div>
                    <div class="cat-lists">
                      <ul>
                        <li>
                        <c:forEach var="category" items="${categories}" varStatus="stat">
                        		
                        			<h3 style="color:#737982;font-size:15px;padding:5px;"><a href="/search/name=${category.categoryName}/id=${category.categoryId}"> <b>${category.categoryName}</b>  </a> (${adCountBycategory[stat.index]})</h3>
	                        		
	                        		<c:set var="cnt" value="0" scope="page" />
	                        		
	                        		<c:forEach var="subcategory" items="${subcategories}" varStatus="status">
	                        			<c:choose>
	                        				<c:when test="${subcategory.category.categoryId == category.categoryId}">
	                        					
	                        					<c:if test="${cnt != 3 }">
			                                			<a href="/search/${category.categoryName}/${subcategory.subCategoryName}/id=${subcategory.subCategoryId}" style="color:#9b9898; padding:4px; font-size:13px;"> ${subcategory.subCategoryName} <span class="number">(${adCountBySubcategory[status.index]}),</span></a>
			                                			<c:set var="cnt" value="${cnt + 1}" scope="page"/>
		                                		</c:if>
		                                		
	                        				</c:when>
	                        			</c:choose>
	                        		</c:forEach>
	                        		<a class="viewall" style="color:#aa4444;" href="/search/name=${category.categoryName}/id=${category.categoryId}">see all</a>
           	
                        </c:forEach>
                        </li>
                      </ul>
                      <!-- <a class="gradientbg1 viewall" href="#">View All</a> -->
                    </div>
                  </aside>
                  <aside class="widget sideads-lists">
                    <ul>
                      <li><a href="#"><img src="/images/ads4.png" alt="img"></a></li>
                    </ul>
                  </aside>
               </div>
              </div> 
              
              <!-- Main Ads Detail Content -->
              
              <div id="primary" class="col-md-8 col-lg-9">
                <div class="main-content product-detail">
                  <div class="theiaStickySidebar">
                    <h3 class="name">${mainAd.adTitle}<span style="align:right; font-size:13px;"> <a href="/wishlist/${mainAd.id}">(Add to Wishlist)</a></span></h3>   <!-- Main Ads Title -->
                    
                    <div class="row flex-row-reverse">
                      <div class="col-md-5">
                        <div class="product-gallery">
                         <div class="xzoom-container">
		                          
                            <div class="zoomimg-holder">
                            		<c:choose>
                            			<c:when test="${not empty mainAd.picture[0].pictureName}">
                            				<img class="xzoom5" id="xzoom-magnific" src="/pasal/images/mainads/${mainAd.picture[0].pictureName}" xoriginal="/pasal/images/mainads/${mainAd.picture[0].pictureName}" style="width:200px;" />                            			
                            			</c:when>
                            			<c:otherwise>
                            				<img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" />                            			
                            			</c:otherwise>
                            		</c:choose>
                            </div>
                          
                            <div class="xzoom-thumbs">
	                            <c:forEach var="picture" items="${pictures}">
	                            		<a href="/pasal/images/mainads/${picture.pictureName}">
	                            			<img class="xzoom-gallery5" width="80" src="/pasal/images/mainads/${picture.pictureName}" title="The description goes here">
	                            		</a>
	                            </c:forEach>
                            </div>
                            
                          </div>
                          
                        </div>
                      </div>
                      <div class="col-md-7">
                        <div class="detailbox">
                          <h3 class="featured-title">General Details</h3>
                          <div class="tabledetailbox">
                            <ul>
                              <li>
                                <label class="pro-lable">Ad Id:</label>
                                <div class="pro-value">
                                  ${mainAd.id}
                                </div>
                              </li>
                              <li>
                                <label class="pro-lable">Ad Views:</label>
                                <div class="pro-value">
                                    ${mainAd.viewCount}
                                </div>
                              </li>
                              <li>
                                <label class="pro-lable">Ad Post Date:</label>
                                <div class="pro-value">
                                  ${mainAd.addedDate}
                                </div>
                              </li>
                              <li>
                                <label class="pro-lable">Ad Expiry Date:</label>
                                <div class="pro-value">
                                  <b>${mainAd.expiryDate}</b> <font color="grey">(in ${differenceInDays} days)</font>
                                </div>
                              </li>
                              
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="detailbox">
                      <h3 class="featured-title">Seller Details</h3>
                      <div class="tabledetailbox">
                        <ul>
                          <li>
                            <label class="pro-lable">Sold by:</label>
                            <div class="pro-value">
                                ${mainAd.customer.name}
                            </div>
                          </li>
                          <li>
                            <label class="pro-lable">Member Since:</label>
                            <div class="pro-value">
                                ${mainAd.customer.addedDate}
                            </div>
                          </li>
                          <li>
                            <label class="pro-lable">Email:</label>
                            <div class="pro-value">
                               ${mainAd.customer.user.email}
                            </div>
                          </li>
                          <li>
                            <label class="pro-lable">Mobile Phone:</label>
                            <div class="pro-value">
                                ${mainAd.customer.phone}    <c:if test="${mainAd.customer.verified == true }">
                                		<a class="btn" style="background-color: #108c27;color: #FFF;border-radius: 7px;border-width: 1px;font-size: 10px;font-style: normal;font-weight: 600;padding: 5px 5px;"><i class="fas fa-mobile-alt"></i>  Phone Verified</a>
                                </c:if>
                                
                            </div>
                            
                          </li>
                          <li>
                            <label class="pro-lable">Location:</label>
                            <div class="pro-value">
                              ${mainAd.customer.cityName}, ${mainAd.customer.areaLocation}, ${mainAd.customer.streetName}
                            </div>
                          </li>
                          
                        </ul>
                        <div class="prowarningbox">
                          <center><img src="/images/warning_ico.jpg" style="height: 13px; width: 13px;vertical-align: sub;"> Be safe. Beware of fraud scams.</center>
                          <p>
                            You agree and understand that Hamrobazar.com is NOT involved in transaction of any goods/services listed in the website. It is only platform to share information.<br>
                            You are directly contacting the person who has posted the advertisement, and agree not to hold Hamrobazar.com responsible for their act in any circumstances. We strongly encourage you to take necessary precaution.
                            <b><a href="#" target="_blank"><u>For more read Safety Tips</u></a></b>
                          </p>
                        </div>
                      </div>
                    </div>
                    <div class="detailbox">
                      <h3 class="featured-title">Description</h3>
                      <div class="tabledetailbox">
                        <ul>
                        
                          <li>
                            <div class="pro-value">
                                  ${mainAd.description}
                            </div>
                          </li>
                         
                        </ul>
                      </div>
                    </div>
                    
                    <div class="detailbox">
                      <h3 class="featured-title">Pricing Details</h3>
                      <div class="tabledetailbox">
                        <ul>
                          <li>
                            <label class="pro-lable">Price:</label>
                            <div class="pro-value">
                                  Rs. ${mainAd.price}
                            </div>
                          </li>
                          <li>
                            <label class="pro-lable">Price Negotiable:</label>
                            <div class="pro-value">
                                ${mainAd.priceNegotiable}
                            </div>
                          </li>
                          <c:if test="${not empty commonSpec.specCondition}">
                          	<li>
	                            <label class="pro-lable">Condition:</label>
	                            <div class="pro-value">
	                              ${commonSpec.specCondition}
	                            </div>
	                          </li>
                          </c:if>
                          <c:if test="${not empty commonSpec.usedFor}">
	                          <li>
	                            <label class="pro-lable">Used For:</label>
	                            <div class="pro-value">
	                              ${commonSpec.usedFor}
	                            </div>
	                          </li>
                          </c:if>
                        </ul>
                      </div>
                    </div>
                    
                    <c:if test="${mainAd.subCategory.category.categoryName ne 'Events & Happenings' &&
                    					mainAd.subCategory.category.categoryName ne 'Books & Learning' &&
                   				  mainAd.subCategory.category.categoryName ne 'Services' &&
               					  mainAd.subCategory.subCategoryName ne 'Parts & Accessories' &&
               					  mainAd.subCategory.category.categoryName ne 'Toys & Video Games' &&
               					  mainAd.subCategory.category.categoryName ne 'Home, Furnishing & Appliances' &&
               					  mainAd.subCategory.subCategoryId != 34 && mainAd.subCategory.subCategoryId != 36 && mainAd.subCategory.subCategoryId != 37 && mainAd.subCategory.subCategoryId != 38 && mainAd.subCategory.subCategoryId != 41 && mainAd.subCategory.subCategoryId != 44 &&
               					  mainAd.subCategory.subCategoryId != 23 && mainAd.subCategory.subCategoryId != 150 && mainAd.subCategory.subCategoryId != 151 && mainAd.subCategory.subCategoryId != 152 && mainAd.subCategory.subCategoryId != 153 && mainAd.subCategory.subCategoryId != 156 && mainAd.subCategory.subCategoryId != 160 && mainAd.subCategory.subCategoryId != 162 }">
                    		<div class="detailbox">
	                      <h3 class="featured-title">Specifications</h3>
	                      <div class="tabledetailbox">
	                        <ul>
	                        		<!-- Cars Specification -->
	                        <c:if test="${mainAd.subCategory.subCategoryId  eq 1}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.type}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Make Year:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.makeYear}
		                            </div>
	                          	</li>	
	                          	<li>
		                            <label class="pro-lable">Kilometers:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.kilometers}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Colour:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.color}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Engine:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.engine}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Fuel:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.fuel}
		                            </div>
	                          	</li>
	                          <li>
		                            <label class="pro-lable">Transmission:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.transmission}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Features:</label>
		                            <div class="pro-value">
		                                  ${autoCarSpec.features}
		                            </div>
	                          	</li>
	                        </c:if>
	                        <!-- Cars Specification End-->
	                        <!-- Motorcycle Specification -->
	                        <c:if test="${mainAd.subCategory.subCategoryId  eq 2}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.type}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Anchal:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.anchal}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Lot No:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.lotNo}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Engine (cc):</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.engine}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Make Year:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.makeYear}
		                            </div>
	                          	</li>	
	                          	<li>
		                            <label class="pro-lable">Kilometers:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.kilometers}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Features:</label>
		                            <div class="pro-value">
		                                  ${autoMotoSpec.features}
		                            </div>
	                          	</li>
	                        </c:if>
	                        
	                       <!-- Apparel Clothing Specification -->
	                        <c:if test="${mainAd.subCategory.subCategoryId == 35 || mainAd.subCategory.subCategoryId == 39 || mainAd.subCategory.subCategoryId == 45}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${apparelClothingSpec.type}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Sizes:</label>
		                            <div class="pro-value">
		                                  ${apparelClothingSpec.size}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Color:</label>
		                            <div class="pro-value">
		                                  ${apparelClothingSpec.color}
		                            </div>
	                          	</li>
	                          	
	                        </c:if> 
	                        
	                        <!-- Apparel Shoes Specification -->
	                        <c:if test="${mainAd.subCategory.subCategoryId == 40 || mainAd.subCategory.subCategoryId == 46}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${apparelShoesSpec.type}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Sizes (US):</label>
		                            <div class="pro-value">
		                                  ${apparelShoesSpec.size}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Color:</label>
		                            <div class="pro-value">
		                                  ${apparelShoesSpec.color}
		                            </div>
	                          	</li>
	                          	
	                        </c:if> 
	                        
	                        <!-- Apparel Accessory Specification -->
	                        <c:if test="${mainAd.subCategory.subCategoryId == 42 || mainAd.subCategory.subCategoryId == 43}">
	                    			<li>
		                            <label class="pro-lable">Gender:</label>
		                            <div class="pro-value">
		                                  ${apparelAccessorySpec.gender}
		                            </div>
	                          	</li>
	                          	
	                          	
	                        </c:if>
	                        
	                        <!-- Business For Sale Specification -->
	                        <c:if test="${mainAd.subCategory.category.categoryName eq 'Business & Industrial' && mainAd.subCategory.subCategoryName eq 'Business For Sale'}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${businessSaleSpec.type}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Included In Price:</label>
		                            <div class="pro-value">
		                                  ${businessSaleSpec.includedInPrice}
		                            </div>
	                          	</li>
	                        </c:if>
	                        
	                        <!-- Travel Specification -->
	                        <c:if test="${mainAd.subCategory.category.categoryName eq 'Travel, Tour & Packages' && mainAd.subCategory.subCategoryName eq 'Tour Package - Domestic' || mainAd.subCategory.subCategoryName eq 'Tour Package - International'}">
	                    			<li>
		                            <label class="pro-lable">Duration:</label>
		                            <div class="pro-value">
		                                  ${travelSpec.duration}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Rating:</label>
		                            <div class="pro-value">
		                                  ${travelSpec.rating}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Inclusion:</label>
		                            <div class="pro-value">
		                                  ${travelSpec.inclusion}
		                            </div>
	                          	</li>
	                        </c:if>
	                        
	                        <!-- Sports Bicycle Specification -->
	                        <c:if test="${mainAd.subCategory.category.categoryName eq 'Sports & Fitness' && mainAd.subCategory.subCategoryName eq 'Bicycles'}">
	                    			<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                  ${sportBicycleSpec.type}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Body:</label>
		                            <div class="pro-value">
		                                  ${sportBicycleSpec.body}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Wheel Size:</label>
		                            <div class="pro-value">
		                                  ${sportBicycleSpec.wheelSize}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Gears:</label>
		                            <div class="pro-value">
		                                  ${sportBicycleSpec.gear}
		                            </div>
	                          	</li>
	                        </c:if>
	                        
	                        <!-- HandSet Specification -->
	                        <c:if test="${mainAd.subCategory.category.categoryName eq 'Mobile & Accessories' && mainAd.subCategory.subCategoryName eq 'Handsets'}">
	                    			<li>
		                            <label class="pro-lable">Ownership Document Provided:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.ownership}
		                            </div>
	                          	</li>
	                          	
	                          	<li>
		                            <label class="pro-lable">Sim Slot:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.simSlot}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Screen Size:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.screenSize}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Smartphone OS:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.smartphoneOS}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Back Camera:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.backCamera}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Front Camera:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.frontCamera}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">CPU Core:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.cpuCore}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">RAM:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.ram}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">Internal Storage:</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.internalStorage}
		                            </div>
	                          	</li>
	                          	<li>
		                            <label class="pro-lable">features :</label>
		                            <div class="pro-value">
		                                  ${handsetSpec.features}
		                            </div>
	                          	</li>
	                        </c:if>
	                        
	                        <!-- Real Estate Specification -->
	                        
		                        <c:if test="${mainAd.subCategory.category.categoryName eq 'Real Estate' && mainAd.subCategory.subCategoryName ne 'Flatmates & Paying Guests'}">
			                        	<li>
			                            <label class="pro-lable">Property Type:</label>
			                            <div class="pro-value">
			                                  ${realEstateSpec.propertyType}
			                            </div>
		                          	</li>
		                          	<li>
			                            <label class="pro-lable">Area:</label>
			                            <div class="pro-value">
			                                  ${realEstateSpec.area}
			                            </div>
		                          	</li>
		                          	
		                          	<c:if test="${realEstateSpec.propertyLocation ne '' }">
			                          	<li>
				                            <label class="pro-lable">Property Location:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.propertyLocation}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<li>
			                            <label class="pro-lable">Access Road:</label>
			                            <div class="pro-value">
			                                  ${realEstateSpec.accessRoad}
			                            </div>
		                          	</li>
		                          	
		                          	<c:if test="${realEstateSpec.landSize ne 0}">
		                          		<li>
				                            <label class="pro-lable">Land Size:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.landSize}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<c:if test="${realEstateSpec.floors ne 0}">
		                          		<li>
				                            <label class="pro-lable">Floors:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.floors}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<c:if test="${realEstateSpec.builtUp ne 0}">
			                          	<li>
				                            <label class="pro-lable">Built Up:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.builtUp}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<c:if test="${realEstateSpec.bedroom ne 0}">
			                          	<li>
				                            <label class="pro-lable">Bedrooms:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.bedroom}
				                            </div>
			                          	</li>
		                          	
		                          	</c:if>
		                          	
		                          	<c:if test="${realEstateSpec.bathroom ne 0}">
			                          	<li>
				                            <label class="pro-lable">Bathrooms:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.bathroom}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<c:if test="${realEstateSpec.livingroom ne 0}">
			                          	<li>
				                            <label class="pro-lable">Living Rooms:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.livingroom}
				                            </div>
			                          	</li>
		                          	</c:if>
		                          	
		                          	<li>
			                            <label class="pro-lable">Water Supply:</label>
			                            <div class="pro-value">
			                                  ${realEstateSpec.waterSupply}
			                            </div>
		                          	</li>
		                          	<li>
			                            <label class="pro-lable">Furnishings:</label>
			                            <div class="pro-value">
			                                  ${realEstateSpec.furnishing}
			                            </div>
		                          	</li>
		                          	
		                          	<c:if test="${realEstateSpec.features ne null}">
			                          	<li>
				                            <label class="pro-lable">Features:</label>
				                            <div class="pro-value">
				                                  ${realEstateSpec.features}
				                            </div>
			                          	</li>
		                          	</c:if>
		                        </c:if>
	                        
								<!-- Laptops and Computer Specification -->
									<c:if test="${mainAd.subCategory.subCategoryName == 'Desktop PC' || mainAd.subCategory.subCategoryName == 'Laptops'}">
										<li>
			                            <label class="pro-lable">Processor:</label>
			                            <div class="pro-value">
			                                  ${laptopSpec.processor}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Processor Generation:</label>
			                            <div class="pro-value">
			                                  ${laptopSpec.processorGeneration}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Ram (GB):</label>
			                            <div class="pro-value">
			                                  ${laptopSpec.ram}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Video Card:</label>
			                            <div class="pro-value">
			                                ${laptopSpec.videoCard}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">HDD (GB/TB):</label>
			                            <div class="pro-value">
			                                  ${laptopSpec.hdd}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Screen Type:</label>
			                            <div class="pro-value">
			                                  ${laptopSpec.screenType}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Screen Size (inch):</label>
			                            <div class="pro-value">
			                                ${laptopSpec.screenSize}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Battery:</label>
			                            <div class="pro-value">
			                                ${laptopSpec.battery}
			                            </div>
			                          </li>
			                          <li>
			                            <label class="pro-lable">Features:</label>
			                            <div class="pro-value">
			                                ${laptopSpec.features} 
			                            </div>
			                          </li>
							</c:if>
							
							<!-- Monitor -->
							<c:if test="${mainAd.subCategory.subCategoryId == 154}">
								<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                ${monitorSpec.type} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Size (inch):</label>
		                            <div class="pro-value">
		                                ${monitorSpec.size} 
		                            </div>
		                          </li>
							</c:if>
							<!-- Networking -->
							<c:if test="${mainAd.subCategory.subCategoryId == 155}">
								<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                ${networkingSpec.type} 
		                            </div>
		                          </li>
							</c:if>
							
							<!-- Printer -->
							<c:if test="${mainAd.subCategory.subCategoryId == 157}">
								<li>
		                            <label class="pro-lable">Type:</label>
		                            <div class="pro-value">
		                                ${printerSpec.type} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Features:</label>
		                            <div class="pro-value">
		                                ${printerSpec.features} 
		                            </div>
		                          </li>
							</c:if>
							
							<!-- Software -->
							<c:if test="${mainAd.subCategory.subCategoryId == 158}">
								<li>
		                            <label class="pro-lable">Genre:</label>
		                            <div class="pro-value">
		                                ${softwareSpec.genre} 
		                            </div>
		                          </li>
							</c:if>
							<!-- Storage -->
							<c:if test="${mainAd.subCategory.subCategoryId == 159}">
								<li>
		                            <label class="pro-lable">Storage Type:</label>
		                            <div class="pro-value">
		                                ${storageSpec.storageType} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Size (GB/TB):</label>
		                            <div class="pro-value">
		                                ${storageSpec.size} 
		                            </div>
		                          </li>
							</c:if>
							<!-- Tablet -->
							<c:if test="${mainAd.subCategory.subCategoryId == 161}">
								<li>
		                            <label class="pro-lable">OS:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.os} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Screen:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.screen} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Connectivity:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.connectivity} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Camera:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.camera} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">RAM (MB/GB):</label>
		                            <div class="pro-value">
		                                ${tabletSpec.ram} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">Internal Storage:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.internalStorage} 
		                            </div>
		                          </li>
		                          <li>
		                            <label class="pro-lable">features:</label>
		                            <div class="pro-value">
		                                ${tabletSpec.features} 
		                            </div>
		                          </li>
							</c:if>
	                         
	                        </ul>
	                      </div>
	                    </div>
                    </c:if>
                    <c:if test="${ not empty delivery.homeDelivery || not empty delivery.deliveryArea}">
                    		<div class="detailbox">
	                      <h3 class="featured-title"> Delivery Details</h3>
	                      <div class="tabledetailbox">
	                        <ul>
	                        <li>
	                            <label class="pro-lable">Home Delivery:</label>
	                            <div class="pro-value">
	                                ${delivery.homeDelivery}
	                            </div>
	                          </li>
	                          <li>
	                            <label class="pro-lable">Delivery Area:</label>
	                            <div class="pro-value">
	                                ${delivery.deliveryArea}
	                            </div>
	                          </li>
	                          <li>
	                            <label class="pro-lable">Delivery Charges:</label>
	                            <div class="pro-value">
	                               ${delivery.deliveryCharges}
	                            </div>
	                          </li>
	                        </ul>
	                      </div>
	                    </div>
                    </c:if>
                    <c:if test="${ not empty warranty.warrantyPeriod || not empty warranty.warrantyIncludes}">
                    		<div class="detailbox">
	                      <h3 class="featured-title"> Warranty Details</h3>
	                      <div class="tabledetailbox">
	                        <ul>
	                        <li>
	                            <label class="pro-lable">Warranty Type:</label>
	                            <div class="pro-value">
	                                ${warranty.warrantyType}
	                            </div>
	                          </li>
	                          <li>
	                            <label class="pro-lable">Warranty Period:</label>
	                            <div class="pro-value">
	                                ${warranty.warrantyPeriod}
	                            </div>
	                          </li>
	                          <li>
	                            <label class="pro-lable">Warranty Includes:</label>
	                            <div class="pro-value">
	                               ${warranty.warrantyIncludes}
	                            </div>
	                          </li>
	                        </ul>
	                      </div>
	                    </div>
                    </c:if>
                    
                    <!-- Comment And Reply Section -->

	                    <div class="detailbox procommentbox">
	                      <h3 class="featured-title">Buyer's Speak</h3>
	                      <span class="postcommenttitle">
	                      	<button type="button" style="color:white;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#commentModal" data-whatever="@mdo">Post your speak</button>
	                      </span>
	                      <div class="procommentbox-lists">
	                        <ul>
	                        
	                          <c:forEach var="question" items="${questions}">
	                          	<li>
		                            <div class="procommentbox-single">
		                              <span class="number">Q.</span>
		                              <span class="procommenttext"> ${question.questionComment} -- Posted By ${question.askedBy.name} on <em>${question.askedOn}</em></span>
		                            </div>
		                            
		                            <c:forEach var="reply" items="${replies}">
		                            		<c:if test="${question.reply.replied eq true &&  reply.question.questionId == question.questionId}">
			                            		<div class="procommentbox-single">
				                              <span class="number">A.</span>
				                              <span class="procommenttext">${reply.replyComment}</span>
				                            </div>
			                            </c:if>
		                            </c:forEach>
		                            
		                            
		                          </li>
	                          </c:forEach>
		                          

	                          <!-- <li>
	                            <div class="procommentbox-single clearfix">
	                              <a href="#" class="viewall float-right"><i class="fas fa-chevron-circle-right"></i> Read more posts</a>
	                            </div>
	                          </li> -->
	                          <li>
	                            <div class="procommentbox-single">
	                              <span class="procommenttext text-center"><b>Note:</b> Share your opinion related to this ad publicly with other users. Or ask a question to ad poster.</span>
	                            </div>
	                          </li>
	                        </ul>
	                      </div>
             
					
	                    </div>
                     <!-- Comment And Reply Section -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        	<!--  Question Form !! --> 
							<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							  <c:choose>
							    <c:when test="${customer.name ne null && mainAd.customer.user.email ne customer.user.email}">
							    		<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Post Your Speak</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      
								      <div class="modal-body">
								      	<p>
									      	Share your thoughts, opinion, review about ad 
									      	<span style="color:blue";>"${mainAd.adTitle}"</span> 
									      	with the rest of the hamrobazar users. You can even ask a question for the ad poster to reply. 
								      	</p>
								      	<p> Your Name: <span><b>${customer.name}</b></span></p>
								      	<p> Your Email: <span><b>${customer.user.email}</b></span></p>
								      	
								        <form:form class="secondaryform" action="/saveQuestion" method="POST" modelAttribute="question">
								        		
								        		<form:input type="hidden" id="mainAds" path="mainAds" value="${mainAd.id}"/>
								        		<form:input type="hidden" id="askedBy" path="askedBy" value="${customer.customerId}"/>
								        		<form:input type="hidden" id="askedTo" path="askedTo" value="${mainAd.customer.customerId}"/>
								        		
									          <div class="form-group">
									            <label for="questionComment" class="col-form-label">Question/Opinion:</label>
									            <p>(Max 1000 characters)</p>
									            <form:textarea class="form-control" id="questionComment" path="questionComment" style="height:120px;"/>
									          </div>
									          
									          <div class="modal-body">
									          	<p style="color:red;">WARNING:
									          	<ul style="color:red;list-style-type:square;">
									          		<li>Do not use any obscene/abusive words which may hurt the feelings of other users. Such posts will be deleted immediately, and your account will be banned.</li>
									          		<li>Only post comment regarding this ad. Do not advertise about other ads, product or website.</li>
									          	</ul>
												</p>
									          </div>
									          
									          <div class="modal-footer">
										        <button type="button" class="btn mjl-btn-default" data-dismiss="modal">Close</button>
										        <button type="submit" class="btn btn-primary">Send message</button>
										      </div>
									          
								        </form:form>
								      </div>  
							    </c:when>
							    <c:when test="${mainAd.customer.user.email eq customer.user.email }">
							    		<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">This is your own Ad, compadre ${customer.name} !</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<p>Not logical to ask question on your own Ad !! </p>
								      	
								      </div>
							    </c:when>
							    <c:otherwise>
							    		<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">First, You need to login</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<h3>Login Here: <button class="btn btn-success btn-sm"><a href="/login" style="color:#fff;">Login</a></button></h3>
								      	<h5>if not logged in yet, <button class="btn btn-primary btn-sm"><a href="/register" style="color:#fff;">Register</a></button></h5>
								      </div>
							    </c:otherwise>
							  </c:choose>      
						      
					     <!-- End Of Question Form !! --> 
						    </div>
						  </div>
						</div>
        
         <!-- Civil Home Phases Comes here -->
        
        <section class="imp-area gradientbgposition1">
          <div class="container">
            <div class="top-imp">
              <div class="row">
              
                <div class="col-md-4 left-box">
                  <figure class="img-holder">
                    <a href="/detail/housing/${selectedHousing[0].housingId}">
                      <img src="/pasal/images/housing/${selectedHousing[0].brand.brandName}/${selectedHousing[0].picture[0].pictureName}" alt="img" style="height:300px;">
                      <span class="img-caption">${selectedHousing[0].housingName}</span>
                    </a>
                  </figure>
                </div>
                
                <div class="col-md-8 right-box">
                
                
                  <div class="bs-box">
                    <div class="box-brands">
                      <figure class="img-holder">
                        <a href="/housing"><img src="/images/brand1.png" alt="img"> Ongoing Projects</a>
                      </figure>
                    </div>
                    <div class="social-inline">
                       <ul>
                         <li class="ico-facebook"><a href="${selectedHousing[0].brand.facebookLink}" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
                         <li class="ico-instagram"><a href="${selectedHousing[0].brand.instagramLink}" title="instagram"><i class="fab fa-instagram"></i></a></li>
                         <li class="ico-youtube"><a href="${selectedHousing[0].brand.twitterLink}" title="youtube"><i class="fab fa-twitter"></i></a></li>
                         <li class="ico-google-plus"><a href="${selectedHousing[0].brand.googlePlusLink}" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
                       </ul>
                     </div>
                  </div>
                  
                  <div class="nicepro-box row">
                  <c:forEach var="product" items="${selectedHousing}">
	                  <c:if test="${product ne selectedHousing[0]}">
	                  	<div class="col-4">
	                      <figure class="img-holder"><a href="/detail/housing/${product.housingId}"><img src="/pasal/images/housing/${product.brand.brandName}/${product.picture[0].pictureName}" alt="img"></a></figure>
	                      <h3 class="featured-title">
	                        <a href="/detail/housing/${product.housingId}"><span class="pro-area">${product.housingName}</span></a>
	                      </h3>
	                    </div>
	                  </c:if>
                    
                  </c:forEach>  
                  </div>
                </div>
              </div>
            </div>
            <div class="single-adsbox">
              <a href="#"><img src="/images/ads1.png" alt="img"></a>
            </div>
          </div>
        </section>
       
  </div> 

<%@include file="includes/footer.jsp"%>  