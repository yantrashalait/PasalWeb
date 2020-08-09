<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                    
                      <h3 class="featured-title">Selected Category: ${subcategorybymodel.category.categoryName}/${subcategorybymodel.subCategoryName}/${model.subModelName} </h3>
                     
                     <!-- ERROR Handelling -->
                     
                      <c:if test="${param.cusErr!=null}">
						<div class="alert alert-danger alert-dismissible fade in" role="alert">
							<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
								<span aria-hidden="true">�</span>
							</button>
							<span class="glyphicon glyphicon-remove"></span> <b>Please Sir/Madam you should first Login !</b>
						</div>
					</c:if>
					
					<!-- End ERROR Handelling -->
					
					<!-- FORM START -->
                      <form:form id="carForm" class="secondaryform" action="/new-ads/addAds" method="POST" modelAttribute="mainAds">
                      		<form:input type="hidden" path="id" id="id"/>
                      		
	                        <div class="form-group">
	                          <label class="label">Ad Title <font class="red">*</font></label><form:errors path="adTitle" cssStyle="color:red"/>
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
	                          <label class="label">Description <font class="red">*</font></label><form:errors path="description" cssStyle="color:red"/>
	                          <div class="right">
	                            <form:textarea id="description" path="description" required="required"></form:textarea>
	                          </div>
	                        </div>
                        
	                        <div class="form-group">
	                          <label class="label">How many days do you want your ad to run? <font class="red">*</font></label><form:errors path="adRunDays" cssStyle="color:red"/>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="adRunDays" path="adRunDays" required="required">
	                              <option></option>
	                              <option value=14>Two Weeks</option>
	                              <option value=30>One Month</option>
	                              <option value=60>Two Months</option>
	                              <option value=90>Three Months </option>
	                              <option value=120>Four Months </option>
	                            </form:select>
	                          </div>
	                        </div>
                        
	                        <div class="form-group">
	                          <label class="label">Price <font class="red">*</font></label>
	                          <div class="right">
	                            <form:input class="halfwidth" type="number" id="priceMjl" path="price" placeholder="Price" required="required"/>
	                            <span id="priceErrMsg" class="mjl-err text-danger"></span>
	                            <p class="mjl-err"><form:errors class="halfwidth" path="price" cssStyle="color:red;"/></p>
	                          </div>
	                        </div>
                        
	                        <div class="form-group">
                          <label class="label">Price Negotiable <font class="red">*</font></label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <label><form:radiobutton id="priceNegotiable" path="priceNegotiable" value="Yes" checked="checked"/> Yes</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="priceNegotiable" path="priceNegotiable" value="Fixed Price"/> Fixed Price</label>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        <form:input type="hidden" path="subModel" id="subModel" value="${model.subModelId}"></form:input>
	                        <form:input type="hidden" path="subCategory" id="subCategory" value="${subcategorybymodel.subCategoryId}"></form:input>
	                        <form:input type="hidden" path="customer" id="customer" value="${customer.customerId}"></form:input>
	                        <!-- End of mainAds Table -->
	                        
	                        <!-- Start Of Specification Table -->
	                        <form:form class="secondaryform" action="/new-ads/addAds" method="POST" modelAttribute="commonSpec">
	                        <form:input type="hidden" path="id" id="id"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Condition <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="specCondition" path="specCondition" required="required">
                          		 <option></option>
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
	                                <form:input class="halfwidth" type="text" id="usedFor" path="usedFor" placeholder="Example: 3 Months"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <!-- End Of Specification Table -->
	                        
	                        <!-- Start of Car Specification Table -->
	                        	<form:form class="secondaryform" action="/new-ads/addAds" method="POST" modelAttribute="autoCarSpec">
	                        <form:input type="hidden" path="id" id="id"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Type <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="type" path="type" placeholder="Select Car Type" required="required">
	                              <option></option>
	                              <option>Jeep / SUV</option>
	                              <option>Sedan</option>
	                              <option>MUV / CUV</option>
	                              <option>Van</option>
	                              <option>Bus</option>
	                              <option>Truck</option>
	                              <option>Pickup</option>
	                              <option>Small Hatchback</option>
	                              <option>Mid Size Hatchback</option>
	                              <option>Others</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Make Year <font class="red">*</font></label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="makeYearMjl" path="makeYear" placeholder="Example: 2013" required="required"/>
	                              </span>
	                              <span id="makeYearErrMsg" class="mjl-err text-danger"></span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Kilometers</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="kilometersMjl" path="kilometers"/>
	                              </span>
	                              <span id="kilometerErrMsg" class="mjl-err text-danger"></span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Color</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="text" id="color" path="color"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Engine(cc)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="engineMjl" path="engine" value="0"/>
	                              </span>
	                              <span id="engineErrMsg" class="mjl-err text-danger"></span>
	                            </div>
	                          </div>
	                        </div>
	                      
	                        <div class="form-group">
	                          <label class="label">Fuel</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <label><form:radiobutton id="fuel" path="fuel" value="Petrol" checked="checked"/> Petrol</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="fuel" path="fuel" value="Diesel"/> Diesel</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="fuel" path="fuel" value="Electric"/> Electric</label>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Transmission <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="transmission" path="transmission" required="required">
	                              <option></option>
	                              <option>Manual Gear - 2 WD</option>
	                              <option>Manual Gear - 4 WD</option>
	                              <option>Automatic Gear - 2 WD</option>
	                              <option>Automatic Gear - 4 WD</option>
	                              <option>Other</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Features</label>
	                          <div class="right">
	                            <div class="checkboxlist" required="required">
	                              
	                                <form:checkbox id="features" path="features" value="Power Window"/> Power Window
	                              	</br>
	                                <form:checkbox id="features" path="features" value="Power Steering"/> Power Steering
	                             	</br>
	                                <form:checkbox id="features" path="features" value="Leather Seat"/> Leather Seat
	                              	</br>
	                                <form:checkbox id="features" path="features" value="Sunroof"/> Sunroof
	                              </br>
	                                <form:checkbox id="features" path="features" value="Central Lock"/> Central Lock
	                              </br>
	                                <form:checkbox id="features" path="features" value="Alloy Wheels"/> Alloy Wheels
	                              </br>
	                                <form:checkbox id="features" path="features" value="Anti-theft Alarm"/> Anti-theft Alarm
	                              </br>
	                                <form:checkbox id="features" path="features" value="Keyless Remote Entry"/> Keyless Remote Entry
	                              </br>
	                                <form:checkbox id="features" path="features" value="Tubeless Tyres"/> Tubeless Tyres
	                              </br>
	                                <form:checkbox id="features" path="features" value="Air Bags"/> Air Bags
	                              </br>
	                                <form:checkbox id="features" path="features" value="Anti-lock Braking (ABS)"/> Anti-lock Braking (ABS) 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Air Conditioning"/> Air Conditioning 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Climate Control"/> Climate Control 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Steering Mounted Controls"/> Steering Mounted Controls 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Projected Headlight"/> Projected Headlight 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Fog Lights"/> Fog Lights 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Electric ORVM"/> Electric ORVM 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Audio System"/> Audio System 
	                              </br>
	                                <form:checkbox id="features" path="features" value="LCD Touchscreen"/> LCD Touchscreen 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Bluetooth Connectivity"/> Bluetooth Connectivity 
	                              </br>
	                              
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <!-- End of Car Specification Table -->
	                        <script>
	                        function show1(){
	                      	  document.getElementById('delivery').style.display ='none';
	                      	}
	                      	function show2(){
	                      	  document.getElementById('delivery').style.display = 'block';
	                      	}
	                        </script>
	                    <!-- Start Of Delivery Table -->    
                        
                        <form:form class="secondaryform" action="/new-ads/addAds" method="POST" modelAttribute="delivery">
                        		<form:input type="hidden" path="id" id="id"/>
                        		
	                        <div class="form-group">
	                          <label class="label">Home Delivery</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <label><form:radiobutton id="homeDelivery1" path="homeDelivery" value="Yes" onclick="show2();"/> Yes</label>
	                              </span>
	                              <span>
	                                <label><form:radiobutton id="homeDelivery" path="homeDelivery" value="No" onclick="show1();" checked="checked"/> No</label>
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
		                                <label><form:radiobutton id="deliveryArea" path="deliveryArea" value="Almost anywhere in Nepal"/> Almost anywhere in Nepal</label>
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
                        <form:form class="secondaryform" action="/new-ads/addAds" method="POST" modelAttribute="warranty">
                        		<form:input type="hidden" path="id" id="id"/>
                       
                        		
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
	                                <label><form:radiobutton id="warrantyType" path="warrantyType" onclick="show3();" value="No Warranty" checked="checked"/> No Warranty</label>
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
                        <input type="submit" value="Submit Ads">
                        
                        	</form:form> <!-- Warranty Form Close -->
                        
                        	</form:form> <!-- Delivery Form Close -->
                        	
                        	</form:form> <!-- Car Specification Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      	
                       	</form:form> <!-- Main-Ads Form Close -->
                     <script>
                     
                     	
                     </script>
                    <!--  END FORM --> 
                    </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>