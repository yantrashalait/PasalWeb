<%@include file="../includes/header.jsp"%>

<main id="main" class="site-main">

<section class="product-area product-slide">
          <div class="container">
            <h3 class="section-title">Featured classifieds</h3>
            <div class="owl-carousel owl-theme product-carousel5">
            
            <c:forEach var="recent" items="${featuredAds}">
            		<div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="/detail/${recent.id}"><img src="/pasal/images/mainads/${recent.picture[0].pictureName}" style="height:120px;"></a>
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
                    <h3 style="color:#737982;font-size:15px;"><b>${category.categoryName}</b></h3>
                      <ul>
                        <li>
                        <c:forEach var="sub" items="${chosensubcategory}" varStatus="stat">
	                        	<h3 style="color:#9b9898; padding:4px; font-size:13px;"><a href="/search/${category.categoryName}/${sub.subCategoryName}/id=${sub.subCategoryId}"> <b>${sub.subCategoryName}</b></a> (${adCountBySubcategory[stat.index]})</h3> 
                        </c:forEach>
                          
                        </li>
                      </ul>
                      <!-- <a class="gradientbg1 viewall" href="#">View All</a> -->
                    </div>
                  </aside>
                  <!-- ADs Image -->
                  <!-- <aside class="widget sideads-lists">
                    <ul>
                      <li><a href="#"><img src="images/ads4.png" alt="img"></a></li>
                    </ul>
                  </aside> -->
                  <aside class="widget">
                    <div class="title-bar">
                      <h3>Ad Filter</h3>
                    </div>
                    <div class="cat-lists">
                    		<form method="GET" action="/search/name=${category.categoryName}/id=${category.categoryId}">
	                    		<div class="form-group">
	                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Location:</b></label>
	                    			<select name="location" class="form-control">
	                    			  <option value ="">Entire Nepal</option>
								  <option value="kathmandu">Kathmandu</option>
								  <option value="bhaktapur">Bhaktapur</option>
								  <option value="patan">Patan</option>
								  <option value="lalitpur">Lalitpur</option>
								  <option value="pokhara">Pokhara</option>
								  <option value="butwal">Butwal</option>
								  <option value="lalitpur">Lalitpur</option>
								</select>
	                    		</div>
							<div class="form-group">
	                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Condition:</b></label>
	                    			<select name="condition" class="form-control">
	                    			 <option value ="">Any</option>
	                              <option value="Brand New (not used)">Brand New (not used)</option>
	                              <option value="Like New (used few times)">Like New (used few times)</option>
	                              <option value="Excellent">Excellent</option>
	                              <option value="Good/Fair">Good/Fair</option>
	                              <option value="Not Working">Not Working</option>
								</select>
	                    		</div>
	                    		
	                    		<div class="form-group">
	                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Price Range:</b></label>
	                    			<br/>
	                    			<input type="number" name="startRange" placeholder="Start Range" class="input-range"/>
	                    			<b>To :</b> 
	                    			<input type="number" name="endRange" placeholder="End Range" class="input-range"/>
	                    		</div> 
							<button type="submit" class="btn btn-warning" style="width:100%;color:#fff;font-weight:bold;border: 1px solid #ced4da;">Filter</button>         	           			
                    		</form>
                    </div>
                  </aside>
               </div>
               

               
              </div> 
              <div id="primary" class="col-md-8 col-lg-9">
                <div class="theiaStickySidebar">
                  <section class="sorting-area prolist-view">
	                  <div class="main-content">
		                    	<div class="sortby gradientbg1">
			                    <form method="GET" action="/search/name=${category.categoryName}/id=${category.categoryId}">
			                        <div class="sorting-search">
			                            <label>Search for </label>
			                            <input type="text" name="search">
			                        </div>
			                        <div class="sorting-category">
			                            <label>In Category</label>
			                            <select name="subId">
				                            <c:forEach var="sub" items="${chosensubcategory}">
					                              <option value="${sub.subCategoryId}">${sub.subCategoryName}</option>
				                            </c:forEach>
			                           </select> 
			                        </div>
			                        
			                       	<button type="submit" >Search</button>
			                        
			                    </form>
		                    </div>
	                        <a class="sorting-more" href="#">Advance Search</a>
                     </div>
                      <div class="sorting-cat-lists">
		                        <ul>
		                        <c:forEach var="list" items="${listing}">
		                        	<!-- Testing Date -->
									  	<p>
										    <jsp:useBean id="today" class="java.util.Date" />
										</p>
		                          	<!--  END Testing Date -->
		                          
		                          	<c:if test="${list.expiryDate.time gt today.time}">
		                          		<li class="product">
				                            <div class="product-image">
				                              <figure class="img-holder">
				                                <a href="/detail/${list.id}">
				                                	<c:choose>
					                        			<c:when test="${not empty list.picture[0].pictureName}">
					                        				<img src="/pasal/images/mainads/${list.picture[0].pictureName}" style="height:70px;width:120px;">
					                        			</c:when>
					                        			<c:otherwise>
				                    	    				<img src="/pasal/images/site-logo.png" style="height:70px;width:120px;padding:8px">
					                        			</c:otherwise>
					                        		</c:choose>
				                                </a>
				                              </figure>
				                            </div>
				                            <div class="product-content">
				                              <div class="toppro-content">
				                                <div class="left">
				                                  <h3 class="name"><a href="/detail/${list.id}">${list.adTitle} </a></h3>
				                                  <article>
				                                    <p>
				                                      ${list.description}
				                                    </p>
				                                  </article>
				                                </div>
				                                <div class="right">
				                                  <div class="price">Rs. ${list.price}<span class="pro-status">${list.commonSpec.specCondition}</span></div>
				                                </div>
				                              </div>
				                              <div class="bmtpro-content">
				                                <div class="left">
				                                  <span class="proauthor">Seller: ${list.customer.name} </span>
				                                  <span class="proauthor-cnt"><i class="fas fa-mobile-alt"></i> - ${list.customer.cityName},${list.customer.areaLocation},${list.customer.streetName}</span>
				                                </div>
				                                <div class="right">
				                                  <div class="propost-date">Posted on:  <span>${list.addedDate}</span></div>
				                                </div>
				                              </div>
				                            </div>
				                          </li>
		                          	</c:if>
	                          </c:forEach>
		                       </ul>
                            </div>
                            <nav aria-label="Page navigation" class="text-center">
						        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
						    </nav>
					    
                  </section>
                    
              		<div class="product-area secondarypro-area">
                      
                      <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade in show active"  role="tabpanel">
                          <div class="row">
                          
                          	<%-- <div class="col-lg-3 col-4 product">
                              <div class="product-image">
                                <figure class="img-holder">
                                <c:set var="count" value="0" scope="page" />
                                <c:forEach var="pic" items="${pictures}">
	                                <c:if test="${mainad.id eq pic.mainAds.id}">
	                                		
	                                		<c:if test="${count == 0 }">
	                                			<a href="detail/${mainad.id}"><img src="/pasal/images/mainads/${pic.pictureName}"></a>
	                                			<c:set var="count" value="${count + 1}" scope="page"/>
	                                		</c:if>	
	                                		
	                                </c:if>
                                 </c:forEach>
                                </figure>
                              </div>
                              <div class="product-content">
                                <h3 class="name"><a href="#">${mainad.adTitle}</a></h3>
                                <div class="metas clearfix">
                                  <div class="price">Rs. ${mainad.price }</div>
                                  <div class="pro-status">(USED)</div>
                                </div>
                              </div>
                            </div> --%>
                            
                            <%-- <table class="table table-hover">
                            		<tr>
                            			<th>Image</th>
                            			<th>Ad-Title</th>
                            			<th>Ad-Post Date</th>
                            			<th>Price</th>
                            		</tr>
                            		<c:forEach var="list" items="${listing}">
	                            		<!-- Testing Date -->
									  	<p>
										    <jsp:useBean id="today" class="java.util.Date" />
										</p>-
		                          	<!--  END Testing Date -->
		                          
		                          	<c:if test="${list.expiryDate.time gt today.time}">
		                            		<tr>
		                            			<td>
		                            				<a href="/detail/${list.id}"><img src="/pasal/images/mainads/${list.picture[0].pictureName}" style="height:70px;width:120px;"></a>
			                                 </td>
		                            			<td>
		                            				<b>${list.adTitle }</b>
		                            				<p>Call: ${list.customer.phone}</p>
		                            				<p>Views: ${list.viewCount}</p>
	                            				</td>
		                            			<td>${list.addedDate}</td>
		                            			<td>${list.price}</td>
	                            			
		                            		</tr>
	                          		</c:if>
                            		</c:forEach>
                            </table> --%>
                            
			                  <%-- <nav aria-label="Page navigation" class="text-center">
						        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
						    </nav>
					     --%>
                          </div>
                          <!-- <a class=" viewall gradientbg2" href="#">View All</a> -->
                        </div>
                        
                       
                        
                      </div>
                    </div>
                  </div>
                      </div>
                </div>
              </div>
            </div>
          </div>
                    </section>
      </main>
<script src="/js/jquery.twbsPagination.js"></script>      
<%@include file="../includes/footer.jsp"%>  