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
                      <h3>Category</h3>
                    </div>
                    <div class="cat-lists">
                    <h3 style="color:#737982;font-size:15px;"><b>${categoryName}</b></h3>
                    <h3 style="color:#9b9898; font-size:14px;"><b>${subCategoryName}</b></h3>
                      <ul>
                        <li>
	                        	<h3 style="color:#9b9898; padding:4px; font-size:13px;"><b>${model.subModelName}</b> (${countByModel})</h3> 
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
                    		<form method="GET" action="/search/${categoryName}/${subCategoryName}/${model.subModelName}/id=${model.subModelId}">
	                 		<c:choose>
	                    			<c:when test="${subCategoryName eq 'Cars'}">
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
		                    			To : <input type="number" name="endRange" placeholder="End Range" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Type:</b></label>
	                    				<div class="mjl-listing">
		                    				<input type="checkbox" name="type" value="Jeep / SUV"/> <label>Jeep / SUV</label>
				                             <input type="checkbox" name="type" value="Sedan"/><label> Sedan </label>
				                             <input type="checkbox" name="type" value="MUV / CUV"/><label> MUV / CUV </label>
				                             <input type="checkbox" name="type" value="Van"><label> Van </label>
				                             <input type="checkbox" name="type" value="Bus"><label> Bus </label>
				                             <input type="checkbox" name="type" value="Truck"><label> Truck </label>
				                             <input type="checkbox" name="type" value="Pickup"><label> Pickup </label>
				                             <input type="checkbox" name="type" value="Small Hatchback"><label> Small Hatchback </label>
				                             <input type="checkbox" name="type" value="Mid Size Hatchback"><label> Mid Size Hatchback </label>
				                            <input type="checkbox" name="type" value="Others"><label> Others </label>
		                    			</div>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Make Year:</b></label>
		                    			</br>
		                    			<input type="number" name="startYear" placeholder="Start Year" class="input-range"/>
		                    			To : <input type="number" name="endYear" placeholder="End Year" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Kilometers:</b></label>
		                    			</br>
		                    			<input type="number" name="startKilo" placeholder="Start Kilo" class="input-range"/>
		                    			To : <input type="number" name="endKilo" placeholder="End Kilo" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Fuel:</b></label>
		                    			<select name="fuel" class="form-control">
		                    			 <option value ="">Any</option>
			                              <option value="Petrol">Petrol</option>
			                              <option value="Diesel">Diesel</option>
			                              <option value="Electric">Electric</option>
										</select>
		                    		</div>	
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Transmission:</b></label>
	                    				<div class="mjl-listing">
	                    				
		                    				<input type="checkbox" name="transmission" value="Manual Gear - 2 WD"/> <label>Manual Gear - 2 WD</label>
			                             <input type="checkbox" name="transmission" value="Manual Gear - 4 WD"/> <label>Manual Gear - 4 WD</label>
			                             <input type="checkbox" name="transmission" value="Automatic Gear - 2 WD"/> <label>Automatic Gear - 2 WD</label>
			                             <input type="checkbox" name="transmission" value="Automatic Gear - 4 WD"> <label>Automatic Gear - 4 WD</label>
			                             <input type="checkbox" name="transmission" value="Other"> <label>Other</label>
			                            
		                    			</div>
		                    		</div>
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Features:</b></label>
	                    				<div class="mjl-listing">
	                    				
			                            <input type="checkbox" name="features" value="Power Window"/><label> Power Window </label>
			                                <input type="checkbox" name="features" value="Power Steering"/><label> Power Steering</label>
			                                <input type="checkbox" name="features" value="Leather Seat"/><label> Leather Seat</label>
			                                <input type="checkbox" name="features" value="Sunroof"/><label> Sunroof </label>
			                                <input type="checkbox" name="features" value="Central Lock"/><label> Central Lock </label>
			                                <input type="checkbox" name="features" value="Alloy Wheels"/><label> Alloy Wheels </label>
			                                <input type="checkbox" name="features" value="Anti-theft Alarm"/><label> Anti-theft Alarm </label>
			                                <input type="checkbox" name="features" value="Keyless Remote Entry"/><label> Keyless Remote Entry </label>
			                                <input type="checkbox" name="features" value="Tubeless Tyres"/><label> Tubeless Tyres </label>
			                                <input type="checkbox" name="features" value="Air Bags"/><label> Air Bags </label>
			                                <input type="checkbox" name="features" value="Anti-lock Braking (ABS)"/><label> Anti-lock Braking (ABS) </label>
			                                <input type="checkbox" name="features" value="Air Conditioning"/><label> Air Conditioning </label>
			                                <input type="checkbox" name="features" value="Climate Control"/><label> Climate Control </label>
			                                <input type="checkbox" name="features" value="Steering Mounted Controls"/><label> Steering Mounted Controls </label>
			                                <input type="checkbox" name="features" value="Projected Headlight"/><label> Projected Headlight </label>
			                                <input type="checkbox" name="features" value="Fog Lights"/><label> Fog Lights </label>
			                                <input type="checkbox" name="features" value="Electric ORVM"/><label> Electric ORVM </label>
			                                <input type="checkbox" name="features" value="Audio System"/><label> Audio System </label>
			                                <input type="checkbox" name="features" value="LCD Touchscreen"/><label> LCD Touchscreen </label>
			                                <input type="checkbox" name="features" value="Bluetooth Connectivity"/><label> Bluetooth Connectivity </label>
			                            
		                    			</div>
		                    		</div> 	
	                    		</c:when>
	                    		<c:when test="${subCategoryName eq 'Motorcycles'}">
               					<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Location:</b></label>
		                    			<select name="location" class="form-control">
		                    			  <option value ="">Entire Nepal</option>
									  <option value="kathmandu">Kathmandu</option>
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
		                    			To : <input type="number" name="endRange" placeholder="End Range" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Type:</b></label>
	                    				<div class="mjl-listing">
		                    				<input type="checkbox" name="type" value="Dirt"/><label> Dirt</label>
				                             <input type="checkbox" name="type" value="Cruisor"/><label> Cruisor</label>
				                             <input type="checkbox" name="type" value="Scooter"/><label> Scooter</label>
				                             <input type="checkbox" name="type" value="Standard"/><label> Standard</label>
				                             <input type="checkbox" name="type" value="Sports"/><label> Sports</label>
				                             <input type="checkbox" name="type" value="Others"/><label> Others</label>
		                    			</div>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Anchal:</b></label>
	                    				<div class="mjl-listing">
		                    				<input type="checkbox" name="anchal" value="Bagmati"/><label> Bagmati</label>
			                             <input type="checkbox" name="anchal" value="Bheri"/><label> Bheri</label>
			                             <input type="checkbox" name="anchal" value="Dhawalagiri"/><label> Dhawalagiri</label>
			                             <input type="checkbox" name="anchal" value="Gandaki"/><label> Gandaki</label>
			                             <input type="checkbox" name="anchal" value="Janakpur"/><label> Janakpur</label>
			                             <input type="checkbox" name="anchal" value="Karnali"/><label> Karnali</label>
			                             <input type="checkbox" name="anchal" value="Koshi"/><label> Koshi</label>
			                             <input type="checkbox" name="anchal" value="Lumbini"/><label> Lumbini</label>
			                             <input type="checkbox" name="anchal" value="Mahakali"/><label> Mahakali</label>
			                             <input type="checkbox" name="anchal" value="Mechi"/><label> Mechi</label>
			                             <input type="checkbox" name="anchal" value="Narayani"/><label> Narayani</label>
			                             <input type="checkbox" name="anchal" value="Rapti"/><label> Rapti</label>
			                             <input type="checkbox" name="anchal" value="Sagarmatha"/><label> Sagarmatha</label>
			                             <input type="checkbox" name="anchal" value="Seti"/><label> Seti</label>
			                            
		                    			</div>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Lot No:</b></label>
		                    			<br/>
		                    			<input type="number" name="startLot" placeholder="Start Lot" class="input-range"/>
		                    			To : <input type="number" name="endLot" placeholder="End Lot" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Engine (cc):</b></label>
		                    			<br/>
		                    			<input type="number" name="startEngine" placeholder="Start Engine" class="input-range"/>
		                    			To : <input type="number" name="endEngine" placeholder="End Engine" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Make Year:</b></label>
		                    			<br/>
		                    			<input type="number" name="startYear" placeholder="Start Year" class="input-range"/>
		                    			To : <input type="number" name="endYear" placeholder="End Year" class="input-range"/>
		                    		</div> 
		                    		
		                    		<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Kilometers:</b></label>
		                    			<br/>
		                    			<input type="number" name="startKilo" placeholder="Start Kilo" class="input-range"/>
		                    			To : <input type="number" name="endKilo" placeholder="End Kilo" class="input-range"/>
		                    		</div>
		                    		
	                    			<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Features:</b></label>
	                    				<div class="mjl-listing">
	                    				
				                            <input type="checkbox" name="features" value="Electric Start"/> <label>Electric Start</label>
			                                <input type="checkbox" name="features" value="Alloy Wheels"/>  <label>Alloy Wheels</label>
			                                <input type="checkbox" name="features" value="Tubeless Tyres"/> <label> Tubeless Tyres</label>
			                                <input type="checkbox" name="features" value="Digital Display Panel"/> <label> Digital Display Panel</label>
			                                <input type="checkbox" name="features" value="Projected Headlight"/> <label> Projected Headlight</label>
			                                <input type="checkbox" name="features" value="LED Tail Light"/> <label> LED Tail Light</label>
			                                <input type="checkbox" name="features" value="Front Disc Brake"/> <label> Front Disc Brake</label>
			                                <input type="checkbox" name="features" value="Rear Disc Brake"/> <label> Rear Disc Brake</label>
			                                <input type="checkbox" name="features" value="Anti-lock Braking (ABS)"/> <label> Anti-lock Braking (ABS)</label>
			                                <input type="checkbox" name="features" value="Mono Suspension"/> <label> Mono Suspension</label>
			                                <input type="checkbox" name="features" value="Split Seat"/> <label> Split Seat</label>
			                                <input type="checkbox" name="features" value="Low Fuel Indicator"/> <label> Low Fuel Indicator</label>
			                                <input type="checkbox" name="features" value="Tripmeter"/> <label> Tripmeter</label>
		                                
		                    			</div>
		                    		</div> 
	                    			
	                    		</c:when>
	                    		<c:otherwise>
	                    			<div class="form-group">
		                    			<label for="" class="control-label" style="font-size:14px;font-weight: bolder;"><b>Location:</b></label>
		                    			<select name="location" class="form-control">
		                    			  <option value ="">Entire Nepal</option>
										  <option value="kathmandu">Kathmandu</option>
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
		                    			</br>
		                    			<input type="number" name="startRange" placeholder="Start Range" class="input-range"/>
		                    			To : <input type="number" name="endRange" placeholder="End Range" class="input-range"/>
		                    		</div>
	                    		</c:otherwise>
	                    			
	                    		</c:choose>
	                    		
							<button type="submit" class="btn btn-warning" style="width:100%;color:#fff;font-weight:bold">Filter</button>         	           			
                    		</form>
                    </div>
                  </aside>
               </div>
              </div> 
              <div id="primary" class="col-md-8 col-lg-9">
                <div class="theiaStickySidebar">
                  <div class="main-content">
                    <div class="title-bar">
                      <h3>Browse by Category</h3>
                      <a class="viewall" href="#">View All Brands</a>
                    </div>
                    
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
                            <table class="table table-hover">
                            		<tr>
                            			<th>Image</th>
                            			<th>Ad-Title</th>
                            			<th>Ad-Post Date</th>
                            			<th>Price</th>
                            		</tr>
                            		<c:forEach var="list" items="${modellisting}">
                            		<!-- Testing Date -->
									  	<p>
										    <jsp:useBean id="today" class="java.util.Date" />
										</p>
										
		                          	<!--  END Testing Date -->
		                          
		                          	<c:if test="${list.expiryDate.time gt today.time}">
		                            		<tr>
		                            			<td>
		                            			
	                                				<c:choose>
					                        			<c:when test="${not empty list.picture[0].pictureName}">
					                        				<a href="/detail/${list.id}"><img src="/pasal/images/mainads/${list.picture[0].pictureName}" style="height:70px;width:120px;"></a>
					                        			</c:when>
					                        			<c:otherwise>
				                    	    					<a href="/detail/${list.id}"><img src="/pasal/images/site-logo.png" style="height:70px;width:120px;padding:8px"></a>
					                        			</c:otherwise>
					                        		</c:choose>		
			                                 </td>
		                            			<td>
		                            				<a href="/detail/${list.id}"><b>${list.adTitle }</b></a>
		                            				<p>Call: ${list.customer.phone}</p>
		                            				<p>Views: ${list.viewCount }</p>
	                            				</td>
		                            			<td>${list.addedDate}</td>
		                            			<td>${list.price}</td>
	                            			
		                            		</tr>
	                            		</c:if>
                            		</c:forEach>
                            </table>
                            <nav aria-label="Page navigation" class="text-center" id="middlePag">
						        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
						   </nav>
                  
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
      
<%@include file="../includes/footer.jsp"%>  