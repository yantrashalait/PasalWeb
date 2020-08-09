<%@include file="includes/header.jsp"%>
<header id="masthead" class="site-header">
<div class="featured-slider">
            <div class="container">
              <div class="owl-carousel owl-theme">
                <div class="item">
                  <div class="slider-img">
                    <figure class="img-holder"><img src="images/slider-img.png" alt="img"></figure>
                  </div>
                  <div class="slider-desc">
                    <figure class="img-holder"><img src="images/slider-text.png" alt="img"></figure>
                  </div>
                  <div class="slider-btn">
                    <a href="#">Explore More</a>
                  </div>
                </div>
                <div class="item">
                  <div class="slider-img">
                    <figure class="img-holder"><img src="images/slider-img.png" alt="img"></figure>
                  </div>
                  <div class="slider-desc">
                    <figure class="img-holder"><img src="images/slider-text.png" alt="img"></figure>
                  </div>
                  <div class="slider-btn">
                    <a href="#">Explore More</a>
                  </div>
                </div>
                <div class="item">
                  <div class="slider-img">
                    <figure class="img-holder"><img src="images/slider-img.png" alt="img"></figure>
                  </div>
                  <div class="slider-desc">
                    <figure class="img-holder"><img src="images/slider-text.png" alt="img"></figure>
                  </div>
                  <div class="slider-btn">
                    <a href="#">Explore More</a>
                  </div>
                </div>
              </div>
            </div>
        </div>
        </header>
        
        
        <!-- Main MIddle Ads Start Here -->
		<main id="main" class="site-main">
		
		<section class="product-area product-slide">
          <div class="container">
            <h3 class="section-title">Featured classifieds</h3>
            <div class="owl-carousel owl-theme product-carousel5">
            
            <c:forEach var="recent" items="${mainadsdetails}">
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
                        <a href="/housing"><img src="images/brand1.png" alt="img"> Ongoing Projects</a>
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
              <a href="#"><img src="images/ads1.png" alt="img"></a>
            </div>
          </div>
        </section>
        
        <!--  ENDED - Civil Home Phases -->
        
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
		                 <!--  <aside class="widget sideads-lists">
		                    <ul>
		                      <li><a href="#"><img src="images/ads4.png" alt="img"></a></li>
		                    </ul>
		                  </aside> -->
		               </div>
		              </div> 
		              <div id="primary" class="col-md-8 col-lg-9">
		                <div class="theiaStickySidebar">
		                  <div class="main-content">
		                    <div class="title-bar">
		                      <h3>Browse by Category</h3>
		                     <!--  <a class="viewall" href="#">View All Brands</a> -->
		                    </div>
		                    <div class="owl-carousel owl-theme brands-area">
		                      <div class="item">
		                        <figure class="img-holder"><a href="/search/Automobiles/Cars/Honda/id=2"><img src="images/brand3.png" alt="img"></a></figure>
		                      </div>
		                      <div class="item">
		                        <figure class="img-holder"><a href="/search/Automobiles/Cars/Hyundai/id=16"><img src="images/brand4.png" alt="img"></a></figure>
		                      </div>
		                      <div class="item">
		                        <figure class="img-holder"><a href="#"><img src="images/brand5.png" alt="img"></a></figure>
		                      </div>
		                      <div class="item">
		                        <figure class="img-holder"><a href="#"><img src="images/brand4.png" alt="img"></a></figure>
		                      </div>
		                      <div class="item">
		                        <figure class="img-holder"><a href="#"><img src="images/brand3.png" alt="img"></a></figure>
		                      </div>
		                    </div>
		              <div class="product-area secondarypro-area">
		                      <ul class="nav nav-tabs" role="tablist">
		                        <li><a class="nav-item active" role="tab" data-toggle="tab" href="#tab-1">Featured Ads</a></li>
		                        <li><a class="nav-item " role="tab" data-toggle="tab" href="#tab-2">Popular Trending </a></li>
		                        <li><a class="nav-item" role="tab" data-toggle="tab" href="#tab-3">Recently Listed Ads</a></li>
		                      </ul>
		                      
		                      <div class="tab-content">
			                      <!-- TAB 1 -->
			                        <div id="tab-1" class="tab-pane fade in show active"  role="tabpanel">
			                          <div class="row">
			                          
			                          <c:forEach var="mainad" items="${mainadsdetails}">
			                          
				                          <!-- Testing Date -->
											  	<p>
												    <jsp:useBean id="today" class="java.util.Date" />
												</p>
												
				                          <!--  END Testing Date -->
				                          
				                          	<c:if test="${mainad.expiryDate.time gt today.time}">
						                    		<div class="col-lg-3 col-4 product">
					                              <div class="product-image">
					                                <figure class="img-holder">
					                                <c:choose>
									           			<c:when test="${not empty mainad.picture[0].pictureName}">
									           				<a href="detail/${mainad.id}"><img src="/pasal/images/mainads/${mainad.picture[0].pictureName}" style="height:150px;"></a>                        			
									           			</c:when>
									           			<c:otherwise>
									           				<a href="/detail/${mainad.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
									           			</c:otherwise>
									           		</c:choose>
						                               
					                                </figure>
					                              </div>
					                              <div class="product-content">
					                                <h3 class="name"><a href="detail/${mainad.id}">${mainad.adTitle}</a></h3>
					                                <div class="metas clearfix">
					                                  <div class="price">Rs. ${mainad.price}</div>
					                                  <div class="pro-status" style="color:#365b96;font-size:9px;">${mainad.commonSpec.specCondition}</div>
					                                </div>
					                              </div>
					                            </div>
					                       	</c:if>
						                    
					                       
			                          </c:forEach>
			                            
			                          </div>
			                          <!-- <a class=" viewall gradientbg2" href="#">View All</a> -->
			                        </div>
			                        <!-- End TAB 1 -->
			                        
			                        <!-- TAB 2 -->
			                        
			                        <div id="tab-2" class="tab-pane fade"  role="tabpanel">
			                          <div class="row">
			                            <c:forEach var="popularTrend" items="${popularTrendings}">
				                            <div class="col-lg-3 col-4 product">
					                            	<div class="product-image">
					                                <figure class="img-holder">
					                                <c:choose>
									           			<c:when test="${not empty popularTrend.picture[0].pictureName}">
									           				<a href="detail/${popularTrend.id}"><img src="/pasal/images/mainads/${popularTrend.picture[0].pictureName}" style="height:150px;"></a>                       			
									           			</c:when>
									           			<c:otherwise>
									           				<a href="/detail/${popularTrend.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
									           			</c:otherwise>
									           		</c:choose>
								                      
						                           </figure>
					                              </div>
					                              <div class="product-content">
					                                <h3 class="name"><a href="detail/${popularTrend.id}">${popularTrend.adTitle}</a></h3>
					                                <div class="metas clearfix">
					                                  <div class="price">Rs. ${popularTrend.price}</div>
					                                  <div class="pro-status" style="color:#365b96;font-size:9px;">${popularTrend.commonSpec.specCondition}</div>
					                                </div>
					                              </div>
				                          	</div>
				                          	
			                          </c:forEach>
			                        </div>
			                        </div>
			                        <!-- End TAB 2 -->
			                        
			                        <!-- TAB 3 -->
			                        <div id="tab-3" class="tab-pane fade"  role="tabpanel">
			                          <div class="row">
			                          <c:forEach var="recent" items="${recentAds}">
				                            <div class="col-lg-3 col-4 product">
				                              <div class="product-image">
				                                <figure class="img-holder">
				                                <c:choose>
									           			<c:when test="${not empty recent.picture[0].pictureName}">
									           				<a href="detail/${recent.id}"><img src="/pasal/images/mainads/${recent.picture[0].pictureName}" style="height:150px;"></a>                      			
									           			</c:when>
									           			<c:otherwise>
									           				<a href="/detail/${recent.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
									           			</c:otherwise>
									           		</c:choose>
				                                  
				                                </figure>
				                              </div>
				                              <div class="product-content">
				                                <h3 class="name"><a href="detail/${recent.id}">${recent.adTitle} </a></h3>
				                                <div class="metas clearfix">
				                                  <div class="price">Rs. ${recent.price}</div>
				                                  <div class="pro-status" style="color:#365b96;font-size:9px;">${recent.commonSpec.specCondition}</div>
				                                </div>
				                              </div>
				                            </div>
			                           </c:forEach>
			                          </div>
			                        </div>
		                        		<!-- End TAB 3 -->
		                      </div>
		                    </div>
		                  </div>
		                      </div>
		                </div>
		              </div>
		            </div>
                </section>
                
                <section class="combo-adsarea">
		          <div class="container">
		            <div class="combo-ads">
		              <div class="left">
		                <div class="comboads1">
		                  <a href="#"><img src="/images/ads2.png" alt="img"></a>
		                </div>
		                <div class="comboads2">
		                  <a href="#"><img src="/images/ads3.png" alt="img"></a>
		                </div>
		              </div>
		              <div class="right">
		                <div class="comboads3">
		                  <a href="#"><img src="images/ads4.png" alt="img"></a>
		                </div>
		              </div>
		            </div>
		          </div>
		        </section>
		        
		        <!-- Hyndai Car start -->
		        
		        <section class="imp-area gradientbgposition1">
		          <div class="container">
		            <div class="top-imp">
		              <div class="row">
		              
		                <div class="col-md-4 left-box">
		                  <figure class="img-holder">
		                    <a href="/detail/car/${selectedCar[0].carId}">
		                      <img src="/pasal/images/car/${selectedCar[0].brand.brandName}/${selectedCar[0].picture[0].pictureName}" alt="img" style="height:300px;">
		                      <span class="img-caption">${selectedCar[0].carName}</span>
		                    </a>
		                  </figure>
		                </div>
		                
		                <div class="col-md-8 right-box">
		                
		                
		                  <div class="bs-box">
		                    <div class="box-brands">
		                      <figure class="img-holder">
		                        <a href="/car"><img src="../images/hyundai.png" alt="img"> ${selectedCar[0].brand.brandName} Cars</a>
		                      </figure>
		                    </div>
		                    <div class="social-inline">
		                       <ul>
		                         <li class="ico-facebook"><a href="${selectedCar[0].brand.facebookLink}" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
		                         <li class="ico-instagram"><a href="${selectedCar[0].brand.instagramLink}" title="instagram"><i class="fab fa-instagram"></i></a></li>
		                         <li class="ico-youtube"><a href="${selectedCar[0].brand.twitterLink}" title="youtube"><i class="fab fa-twitter"></i></a></li>
		                         <li class="ico-google-plus"><a href="${selectedCar[0].brand.googlePlusLink}" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
		                       </ul>
		                     </div>
		                  </div>
		                  
		                  <div class="nicepro-box row">
		                  <c:forEach var="product" items="${selectedCar}">
			                  <c:if test="${product ne selectedCar[0]}">
			                  	<div class="col-4">
			                      <figure class="img-holder"><a href="/detail/car/${product.carId}"><img src="/pasal/images/car/${product.brand.brandName}/${product.picture[0].pictureName}" alt="img"></a></figure>
			                      <h3 class="featured-title">
			                        <a href="/detail/car/${product.carId}"><span class="pro-area">${product.carName}</span></a>
			                      </h3>
			                    </div>
			                  </c:if>
		                    
		                  </c:forEach>  
		                  </div>
		                </div>
		              </div>
		            </div>
		            <div class="single-adsbox">
		              <a href="#"><img src="images/ads1.png" alt="img"></a>
		            </div>
		          </div>
		        </section>
		      </main>
      
<%@include file="includes/footer.jsp"%>  