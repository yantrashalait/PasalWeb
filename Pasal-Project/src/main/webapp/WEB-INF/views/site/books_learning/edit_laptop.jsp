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
	                        <!-- Start of Laptops and Desktop Pc Specification Table -->
			                        	<form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="laptopSpec">
			                        <form:input type="hidden" path="id" id="id" value="${laptopSpec.id}"/>
			                        
			                        <div class="form-group">
			                          <label class="label">Processor <font class="red">*</font></label>
			                          <div class="right">
			                            <form:select class="halfwidth" type="text" id="processor" path="processor" placeholder="Select Processor" required="required">
			                              <option>${laptopSpec.processor}</option>
			                              <option>Intel Pentium 4</option>
			                              <option>Intel Pentium M</option>
			                              <option>Intel Pentium Dual Core</option>
			                              <option>Intel Celeron</option>
			                              <option>Intel Celeron Dual Core</option>
			                              <option>Intel Core 2</option>
			                              <option>Intel Atom</option>
			                              <option>Intel Core i3</option>
			                              <option>Intel Core i5</option>
			                              <option>Intel Core i7</option>
			                              <option>Intel Core M</option>
			                              <option>AMD A-Series APU</option>
			                              <option>AMD E-Series APU</option>
			                              <option>AMD - Others</option>
			                              <option>Others</option>
			                            </form:select>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">Processor Generation <font class="red">*</font></label>
			                          <div class="right">
			                            <form:select class="halfwidth" type="text" id="processorGeneration" path="processorGeneration" placeholder="Select Hotel Rating" required="required">
			                              <option>${laptopSpec.processorGeneration}</option>
			                              <option>2009 before</option>
			                              <option>1st (2010)</option>
			                              <option>2nd (2011)</option>
			                              <option>3rd (2012)</option>
			                              <option>4th (2013 - 2014)</option>
			                              <option>5th (2015)</option>
			                              <option>6th (2016)</option>
			                              <option>7th (2017)</option>
			                              <option>8th (2018)</option>
			                              <option>Don't Know</option>
			                            </form:select>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">RAM (GB)</label>
			                          <div class="right">
			                            <div class="checkboxlist">
			                              <span>
			                                <form:input class="halfwidth" type="number" id="ram" path="ram" placeholder="Eg: 1"/>
			                              </span>
			                            </div>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">Video Card</label>
			                          <div class="right">
			                            <div class="checkboxlist">
			                              <span>
			                                <form:input class="halfwidth" type="text" id="videoCard" path="videoCard" placeholder="Eg: Amedion"/>
			                              </span>
			                            </div>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">HDD (GB/TB)</label>
			                          <div class="right">
			                            <div class="checkboxlist">
			                              <span>
			                                <form:input class="halfwidth" type="text" id="hdd" path="hdd" placeholder="Eg: 1 Gb or 1 Tb"/>
			                              </span>
			                            </div>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">Screen Type <font class="red">*</font></label>
			                          <div class="right">
			                            <form:select class="halfwidth" type="text" id="screenType" path="screenType" placeholder="Select Screen Type" required="required">
			                              <option>${laptopSpec.screenType}</option>
			                              <option>CRT</option>
			                              <option>LCD</option>
			                              <option>LED</option>
			                              <option>OLED</option>
			                              <option>None</option>
			                            </form:select>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">Screen Size (inch)</label>
			                          <div class="right">
			                            <div class="checkboxlist">
			                              <span>
			                                <form:input class="halfwidth" type="text" id="screenSize" path="screenSize" placeholder="Eg: 55 inch"/>
			                              </span>
			                            </div>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
			                          <label class="label">Battery <font class="red">*</font></label>
			                          <div class="right">
			                            <form:select class="halfwidth" type="text" id="battery" path="battery" placeholder="Select Battery" required="required">
			                              <option>${laptopSpec.battery}</option>
			                              <option>No Battery</option>
			                              <option>Less than 15 Min.</option>
			                              <option>15-30 Min.</option>
			                              <option>1 - 2 Hour</option>
			                              <option>2 - 3 Hour</option>
			                              <option>3 - 5 Hour</option>
			                              <option>Above 5 Hour</option>
			                            </form:select>
			                          </div>
			                        </div>
			                        
			                        <div class="form-group">
		                          	<label class="label">Features</label>
			                          <div class="right">
			                            <div class="checkboxlist" required="required">
			                              
			                                <form:checkbox id="features" path="features" value="DVD-CD Rewritable"/> DVD-CD Rewritable
			                              	</br>
			                                <form:checkbox id="features" path="features" value="DVD-CD Combo"/> DVD-CD Combo
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Blu-ray Drive"/> Blu-ray Drive
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Modem"/> Modem
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Webcam"/> Webcam
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Laser Printer"/> Laser Printer
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Inkjet Printer"/> Inkjet Printer
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="WiFi"/> WiFi
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Bluetooth"/> Bluetooth
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="SD Card Slot"/> SD Card Slot
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Touch Screen"/> Touch Screen
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Surround Speaker"/> Surround Speaker
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Ethernet LAN"/> Ethernet LAN
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Fingerprint Recognition"/> Fingerprint Recognition
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="Remote"/> Remote
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="HDMI"/> HDMI
			                              	</br>
			                              	<form:checkbox id="features" path="features" value="3G Sim Inbuilt"/> 3G Sim Inbuilt
			                              	</br>
			                                
			                            </div>
			                          </div>
			                        </div>
			                        
			                        <form:input type="hidden" path="mainAds" id="mainAds"/>
			                       
			                        <!-- End of Laptops Specification Table -->
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
                        
                      	</form:form> <!-- Specification Form Close -->
                      	
                      	</form:form> <!-- Laptop Specification -->
                      
                       	</form:form> <!-- Main-Ads Form Close -->
                        
                    </div>
    <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>