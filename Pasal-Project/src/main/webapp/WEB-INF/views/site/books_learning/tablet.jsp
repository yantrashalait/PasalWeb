<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Selected Category: ${categorybysubcategory.categoryName}/${subcategory.subCategoryName}</h3>
                     
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
                      <form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="mainAds">
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
	                        
	                        <form:input type="hidden" path="subCategory" id="subCategory" value="${subcategory.subCategoryId}"></form:input>
	                        <form:input type="hidden" path="customer" id="customer" value="${customer.customerId}"></form:input>
	                        <!-- End of mainAds Table -->
	                        
	                        <!-- Start Of Specification Table -->
	                        <form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="commonSpec">
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
	                        
	                        <!-- Start of Tablet Specification Table -->
	                        	<form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="printerSpec">
	                        <form:input type="hidden" path="id" id="id"/>
	                        
	                        <div class="form-group">
	                          <label class="label">OS <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="os" path="os" placeholder="Select OS" required="required">
	                              <option></option>
	                              <option>WebOS</option>
	                              <option>Linux</option>
	                              <option>Android 4.3 (Jellybean) or below</option>
	                              <option>Android 4.4 (KitKat)</option>
	                              <option>Android 5.0 (Lollipop)</option>
	                              <option>Android 6.0 (Marshmallow)</option>
	                              <option>Android 7.0 (Nougat)</option>
	                              <option>Android 8.0 (Oreo)</option>
	                              <option>Apple iOS 8 or below</option>
	                              <option>Apple iOS 9</option>
	                              <option>Apple iOS 10</option>
	                              <option>Apple iOS 11</option>
	                              <option>Windows 7 or below</option>
	                              <option>Windows 8</option>
	                              <option>Windows RT</option>
	                              <option>Windows 10</option>
	                              <option>Other OS</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Screen <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="screen" path="screen" placeholder="Select Screen" required="required">
	                              <option></option>
	                              <option>Less than 7 inch</option>
	                               <option>7 to 7.9 inch</option>
	                                <option>8 to 8.9 inch</option>
	                                 <option>9 to 9.9 inch</option>
	                                  <option>10 inch and above</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Connectivity <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="connectivity" path="connectivity" placeholder="Select Connectivity" required="required">
	                              <option></option>
	                              <option>Wifi Only</option>
	                               <option>Wifi + 2G Sim slot</option>
	                                <option>Wifi + 3G Sim slot</option>
	                                 <option>Wifi + 4G/LTE Sim slot</option>
	                                  <option>None</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Camera <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="connectivity" path="connectivity" placeholder="Select Connectivity" required="required">
	                              <option></option>
	                              <option>Less than 1 megapixel</option>
	                              <option>1 to 2.9 megapixel</option>
	                              <option>3 to 4.9 megapixel</option>
	                              <option>5 to 7.9 megapixel</option>
	                              <option>More than 8 megapixel</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">RAM (MB/GB)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="text" id="ram" path="ram" placeholder="Example: 4 GB"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Internal Storage (GB)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="internalStorage" path="internalStorage" placeholder="Example: 256"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
		                          	<label class="label">Features</label>
			                          <div class="right">
			                            <div class="checkboxlist" required="required">
			                              
			                              	<form:checkbox id="features" path="features" value="Bluetooth"/> Bluetooth
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Front Facing Camera"/> Front Facing Camera
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="FVideo Recordingax"/> Video Recording
			                              	</br>
			                              	
			                              	<form:checkbox id="features" path="features" value="Expandable Memory Slot"/> Expandable Memory Slot
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Built In Phone"/> Built In Phone
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="GPS"/> GPS
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="HDMI"/> HDMI
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Gorilla Glass Screen"/> Gorilla Glass Screen
			                              	</br>
			                              	
			                              	<form:checkbox id="features" path="features" value="Dual Core Processor"/> Dual Core Processor
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Quad Core Processor"/> Quad Core Processor
			                              	</br>
			                                
			                            </div>
			                          </div>
			                        </div>
	                       
	                        <!-- End of Tablet Specification Table -->
	                        
	                        <script>
	                        function show1(){
	                      	  document.getElementById('delivery').style.display ='none';
	                      	}
	                      	function show2(){
	                      	  document.getElementById('delivery').style.display = 'block';
	                      	}
	                        </script>
	                    <!-- Start Of Delivery Table -->    
                        
                        <form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="delivery">
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
                        <form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="warranty">
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
                        	
                        	</form:form> <!-- Tablet Specification Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      	
                       	</form:form> <!-- Main-Ads Form Close -->
                     <script>
                     
                     	
                     </script>
                    <!--  END FORM --> 
                    </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>