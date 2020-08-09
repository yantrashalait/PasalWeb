<%@include file="includes/header.jsp"%>

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
                  <h3 class="name"><a href="/detail/${recent.id}">${recent.adTitle}</a></h3>
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
		                 <!--  <aside class="widget sideads-lists">
		                    <ul>
		                      <li><a href="#"><img src="images/ads4.png" alt="img"></a></li>
		                    </ul>
		                  </aside> -->
		               </div>
		              </div>
              <div id="primary" class="col-md-8 col-lg-9">
                <div class="theiaStickySidebar">
                  <section class="sorting-area prolist-view">
	                  <div class="main-content">
		                    	
                     </div>
                      <div class="sorting-cat-lists">
		                        <ul>
		                        <c:forEach var="list" items="${listing}">
		                        	<!-- Testing Date -->
									  	<p>
										    <jsp:useBean id="today" class="java.util.Date" />
										</p>
		                          	<!--  END Testing Date -->
		                          
		                          		<li class="product">
				                            <div class="product-image">
				                              <figure class="img-holder">
				                                <c:choose>
					                        			<c:when test="${not empty list.picture[0].pictureName}">
					                                		<a href="/detail/${list.id}"><img src="/pasal/images/mainads/${list.picture[0].pictureName}" ></a>
					                        			</c:when>
					                        			<c:otherwise>
					                        				<a href="/detail/${list.id}"><img src="/pasal/images/site-logo.png" style="height:70px;width:120px;padding:8px"></a>
					                        			</c:otherwise>
					                        		</c:choose>
				                              </figure>
				                            </div>
				                            <div class="product-content">
				                              <div class="toppro-content">
				                                <div class="left">
				                                  <h3 class="name"><a href="detail/${list.id}">${list.adTitle} </a></h3>
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
<%@include file="includes/footer.jsp"%>  