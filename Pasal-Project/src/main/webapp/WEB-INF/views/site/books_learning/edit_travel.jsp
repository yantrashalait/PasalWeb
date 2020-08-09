<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Ad Title: <span style="color:#3d75ce"> <b>${mainAds.adTitle}</b> </span></h3>
                     
                      <form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="mainAds">
                      
                      		<form:input type="hidden" path="id" id="id"/>
                      		
	                        <div class="form-group">
	                          <label class="label">Ad Title <font class="red">*</font></label>
	                          <div class="right">
	                            <form:input type="text" id="adTitle" path="adTitle" required="required"/>
	                            <font class="red">
	                              <b>WARNING :</b><br>
	                              1. DO NOT post multiple ad for same product/service, it will be deleted and account blocked.<br>
	                              2. Spam ads, refferal based ads and illegal ads will be deleted.<br>
	                              3. Wrongly categorized ad (ads posted in irrelevant category) will be deleted.<br>
	                              4. Marketing words (gimmick) such as 'sasto, cheap price, great deal' are not allowed.<br>
	                              5. Do not write price of product/service or your phone number in ad title.<br>
	                              <b><u><a href="#">Click here to Read Ad Posting Rules in detail..</a></u></b>
	                            </font>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Description <font class="red">*</font></label>
	                          <div class="right">
	                            <form:textarea id="description" path="description" required="required"></form:textarea>
	                          </div>
	                        </div>
                        
	                        <form:input type="hidden" path="adRunDays" id="adRunDays"/>
                        
	                        <div class="form-group">
	                          <label class="label">Price <font class="red">*</font></label>
	                          <div class="right">
	                            <form:input class="halfwidth" type="number" id="price" path="price" placeholder="Price"/>
	                          </div>
	                          <form:errors class="halfwidth" path="price" cssStyle="color:red;"/>
	                        </div>
                        
	                        <div class="form-group">
	                          <label class="label">Price Negotiable</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <label><form:radiobutton id="priceNegotiable" path="priceNegotiable" value="Yes" /> Yes</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="priceNegotiable" path="priceNegotiable" value="Fixed Price"/> Fixed Price</label>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="subCategory" id="subCategory" value="${subcategory.subCategoryId}"></form:input>
	                        <form:input type="hidden" path="customer" id="customer" value="${customer.customerId}"></form:input>
	                        
	                        <form:input type="hidden" path="addedDate" id="addedDate" value="${mainAds.addedDate}"/>
	                        <form:input type="hidden" path="expiryDate" id="expiryDate" value="${mainAds.expiryDate}"/>
	                        <!-- End of mainAds Table -->
	                        
	                        <!-- Start Of Specification Table -->
	                        <form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="commonSpec">
	                        <form:input type="hidden" path="id" id="id" value="${commonSpec.id}"/>
	                        
	                        
	                        <div class="form-group">
	                          <label class="label">Condition <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="specCondition" path="specCondition" required="required">
	                              <option>${commonSpec.specCondition}</option>
	                              <option>Brand New (not used)</option>
	                              <option>Like New (used few times)</option>
	                              <option>Excellent</option>
	                              <option>Good/Fair</option>
	                              <option>Not Working</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Used For (year or month)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="text" id="usedFor" path="usedFor"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                        
	                        <!-- End Of Specification Table -->
	                        
	                         
	                        <!-- Start of Travel Specification Table -->
	                        	<form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="travelSpec">
	                        <form:input type="hidden" path="id" id="id" value="${travelSpec.id}"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Duration <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="duration" path="duration" placeholder="Select Duration" required="required">
	                              <option>${travelSpec.duration}</option>
	                              <option>Day Trip</option>
	                              <option>1 Night</option>
	                              <option>2 Night</option>
	                              <option>3 Night</option>
	                              <option>4 Night</option>
	                              <option>5 Night</option>
	                              <option>6 Night</option>
	                              <option>7 Night</option>
	                              <option>8 Night</option>
	                              <option>9 Night</option>
	                              <option>10 Night</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Hotel Rating <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="number" id="rating" path="rating" placeholder="Select Hotel Rating" required="required">
	                              <option>${travelSpec.rating}</option>
	                              <option value="1">1 Star</option>
	                              <option value="2">2 Star</option>
	                              <option value="3">3 Star</option>
	                              <option value="4">4 Star</option>
	                              <option value="5">5 Star</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
                          	<label class="label">Inclusion</label>
	                          <div class="right">
	                            <div class="checkboxlist" required="required">
	                              
	                                <form:checkbox id="inclusion" path="inclusion" value="Air Ticket (International)"/> Air Ticket (International)
	                              	</br>
	                                <form:checkbox id="inclusion" path="inclusion" value="Air Ticket (Domestic)"/> Air Ticket (Domestic) 
	                             	 </br>
	                                <form:checkbox id="inclusion" path="inclusion" value="Bed & Breakfast"/> Bed & Breakfast
                              		 </br>
	                                <form:checkbox id="inclusion" path="inclusion" value="All Meals"/> All Meals
	                             	 </br>
	                             	 <form:checkbox id="inclusion" path="inclusion" value="VISA Fees"/> VISA Fees
	                             	 </br>
	                             	 <form:checkbox id="inclusion" path="inclusion" value="Airport Transfer"/> Airport Transfer
	                             	 </br>
	                             	 <form:checkbox id="inclusion" path="inclusion" value="Tour Guide"/> Tour Guide
	                             	 </br>
	                             	 <form:checkbox id="inclusion" path="inclusion" value="Sightseeing by Private Car"/> Sightseeing by Private Car
	                             	 </br>
	                             	 <form:checkbox id="inclusion" path="inclusion" value="Sightseeing by Bus Coach"/> Sightseeing by Bus Coach
	                             	 </br>
	                                
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                       
	                        <!-- End of Travel Specification Table -->
	                        
	                        
	                        <script>
	                        function show1(){
	                      	  document.getElementById('delivery').style.display ='none';
	                      	}
	                      	function show2(){
	                      	  document.getElementById('delivery').style.display = 'block';
	                      	}
	                        </script>
	                        
	                    <!-- Start Of Delivery Table -->    
                        
                        <form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="delivery">
                        		<form:input type="hidden" path="id" id="id" value="${delivery.id}"/>
                        		
                        		
	                        <div class="form-group">
	                          <label class="label">Home Delivery</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <label><form:radiobutton id="homeDelivery1" path="homeDelivery" value="Yes" onclick="show2();"/> Yes</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="homeDelivery" path="homeDelivery" value="No" onclick="show1();"/> No</label>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        <div id="delivery" class="hide">
		                        <div class="form-group">
		                          <label class="label">Delivery Area</label>
		                          <div class="right">
		                            <div class="checkboxlist">
		                              <span>
		                                <label><form:radiobutton id="deliveryArea" path="deliveryArea" value="Within my Area"/> Within my Area</label>
		                              </span>
		                              <span>
		                                <label><form:radiobutton id="deliveryArea" path="deliveryArea" value="Within my City"/> Within my City</label>
		                              </span>
		                              <span>
		                                <label><form:radiobutton id="deliveryArea" path="deliveryArea" value="Almost anywhere in Nepal" /> Almost anywhere in Nepal</label>
		                              </span>
		                            </div>
		                          </div>
		                        </div>
		                        
		                        <div class="form-group" style="margin-bottom:25px;">
		                          <label class="label">Delivery Charges</label>
		                          <div class="right">
		                            <form:input class="halfwidth" type="text" id="deliveryCharges" path="deliveryCharges"/>
		                          </div>
		                        </div>
                        		</div>
	                       
	                       <form:input type="hidden" path="mainAds" id="mainAds"/>
	                       
                        <!-- End Of Delivery form -->
                        
                        <script>
                        function show3(){
	                      	  document.getElementById('warranty').style.display ='none';
	                      	}
	                      	function show4(){
	                      	  document.getElementById('warranty').style.display = 'block';
	                      	}
                        </script>
                        
                        <!-- Start OF Warranty Form -->
                        <form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="warranty">
                        		<form:input type="hidden" path="id" id="id" value="${warranty.id}"/>
                       		
                       		
	                        <div class="form-group">
	                          <label class="label">Warranty Type</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              
	                              <span>
	                                <label><form:radiobutton id="warrantyType" path="warrantyType" onclick="show4();" value="Dealer/Shop"/> Dealer/Shop</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="warrantyType" path="warrantyType" onclick="show4();" value="Manufacturer/Importer "/> Manufacturer/Importer</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="warrantyType" path="warrantyType" onclick="show3();" value="No Warranty"/> No Warranty</label>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
                        
                        <div id="warranty" class="hide">
	                        <div class="form-group">
	                          <label class="label">Warranty Period</label>
	                          <div class="right">
	                            <form:input class="halfwidth" type="text" id="warrantyPeriod" path="warrantyPeriod"/>
	                          </div>
	                        </div>
                        
	                        <div class="form-group">
	                          <label class="label">Warranty Includes</label>
	                          <div class="right">
	                            <form:input type="text" id="warrantyIncludes" path="warrantyIncludes"/>
	                          </div>
	                        </div> 
                        </div>
                        
                        <form:input type="hidden" path="mainAds" id="mainAds"/>
                        
                        <input type="submit" value="Submit Ads">
                        <p style="color:blue;">(You can edit your picture in next step.)</p>
                        
                        	</form:form> <!-- Warranty Form Close -->
                        
                        	</form:form> <!-- Delivery Form Close -->
                        	
                        	</form:form> <!-- Travel Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      
                       	</form:form> <!-- Main-Ads Form Close -->
                        
                    </div>
    <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>