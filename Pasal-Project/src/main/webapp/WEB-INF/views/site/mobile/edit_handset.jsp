<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                    
                      <h3 class="featured-title">Ad Title: <span style="color:#3d75ce"> <b>${mainAds.adTitle}</b> </span></h3>
                     
					<!-- FORM START -->
                      <form:form id="carForm" class="secondaryform" action="/member/editAds/cars/save" method="POST" modelAttribute="mainAds">
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
                        
	                        <form:input type="hidden" path="adRunDays" id="adRunDays"/>
            
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
	                        
	                        <form:input type="hidden" path="addedDate" id="addedDate" value="${mainAds.addedDate}"/>
	                        <form:input type="hidden" path="expiryDate" id="expiryDate" value="${mainAds.expiryDate}"/>
	                        
	                        <!-- End of mainAds Table -->
	                        
	                        <!-- Start Of Specification Table -->
	                        <form:form class="secondaryform" action="/member/editAds/cars/save" method="POST" modelAttribute="commonSpec">
	                        <form:input type="hidden" path="id" id="id"/>
	                        
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
	                                <form:input class="halfwidth" type="text" id="usedFor" path="usedFor" placeholder="Example: 3 Months"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                        
	                        <!-- End Of Specification Table -->
	                        
	                        <!-- Start of Handset Specification Table -->
	                        	<form:form class="secondaryform" action="/member/editAds/cars/save" method="POST" modelAttribute="handsetSpec">
	                        <form:input type="hidden" path="id" id="id" value="${ handsetSpec.id}"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Owner Document Provided</label>
	                          <div class="right">
	                            <div class="checkboxlist" required="required">
	                              
	                                <form:checkbox id="ownership" path="ownership" value="Sales bill of my shop"/> Sales bill of my shop
	                              	</br>
	                                <form:checkbox id="ownership" path="ownership" value="Stamped warranty card"/> Stamped warranty card
	                             	</br>
	                                <form:checkbox id="ownership" path="ownership" value="IMEI matching box"/> IMEI matching box
	                              	</br>
	                                <form:checkbox id="ownership" path="ownership" value="Original purchase bill (for used phone)"/> Original purchase bill (for used phone)
	                              </br>
	                                <form:checkbox id="ownership" path="ownership" value="I do not have any document."/> I do not have any document.
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Sim Slot <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="simSlot" path="simSlot" placeholder="Select Sim Slot" required="required">
	                              <option>${ handsetSpec.simSlot}</option>
	                              <option>Single Sim - 2G</option>
	                              <option>Single Sim - 3G</option>
	                              <option>Single Sim - 4G (LTE)</option>
	                              <option>Single Sim - CDMA</option>
	                              <option>Dual Sim - 2G + 2G</option>
	                              <option>Dual Sim - 3G + 2G</option>
	                              <option>Dual Sim - 4G + 3G/2G</option>
	                              <option>Dual Sim - GSM + CDMA</option>
	                              <option>Triple Sim</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Screen Size <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="screenSize" path="screenSize" placeholder="Select Screen Size" required="required">
	                              <option>${ handsetSpec.screenSize}</option>
	                              <option>Less than 3.5 inch</option>
	                              <option>3.5 to 3.9 inch</option>
	                              <option>4.0 to 4.4 inch</option>
	                              <option>4.5 to 4.9 inch</option>
	                              <option>5.0 to 5.4 inch</option>
	                              <option>5.5 to 5.9 inch</option>
	                              <option>6.0 inch or more</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Smartphone OS</label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="smartphoneOS" path="smartphoneOS" placeholder="Select Smartphone OS" required="required">
	                              <option>${ handsetSpec.smartphoneOS}</option>
	                              <option>Not a Smartphone</option>
	                              <option>Symbian</option>
	                              <option>RIM Blackberry</option>
	                              <option>Firefox OS</option>
	                              <option>Tizen</option>
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
	                              <option>Windows 8.x</option>
	                              <option>Windows 10</option>
	                              <option>Other OS</option>
	                              
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        
	                        <div class="form-group">
	                          <label class="label">Back Camera <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="backCamera" path="backCamera" required="required">
	                              <option>${ handsetSpec.backCamera}</option>
	                              <option>No</option>
	                              <option>1 MP or less</option>
	                              <option>2 MP - 2.9 MP</option>
	                              <option>3 MP - 4.9 MP</option>
	                              <option>5 MP - 7.9 MP</option>
	                              <option>8 MP - 12.9 MP</option>
	                              <option>13 MP - 19.9 MP</option>
	                              <option>20 MP or more</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Front Camera <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="frontCamera" path="frontCamera" required="required">
	                              <option>${ handsetSpec.frontCamera}</option>
	                              <option>No</option>
	                              <option>VGA</option>
	                              <option>1 MP</option>
	                              <option>2 MP</option>
	                              <option>3 MP</option>
	                              <option>5 MP</option>
	                              <option>8 MP</option>
	                              <option>13 MP or more</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">CPU Core <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="cpuCore" path="cpuCore" required="required">
	                              <option>${ handsetSpec.cpuCore}</option>
	                              <option>Single</option>
	                              <option>Dual - 2</option>
	                              <option>Quad - 4</option>
	                              <option>Hexa - 6</option>
	                              <option>Octa - 8</option>
	                              <option>Deca - 10</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">RAM <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="ram" path="ram" required="required">
	                              <option>${ handsetSpec.ram}</option>
	                              <option>512 MB or less</option>
	                              <option>1 GB</option>
	                              <option>1.5 GB</option>
	                              <option>2 GB</option>
	                              <option>3 GB</option>
	                              <option>4 GB</option>
	                              <option>6 GB</option>
	                              <option>8 GB or more</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Internal Storage <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="internalStorage" path="internalStorage" required="required">
	                              <option>${ handsetSpec.internalStorage}</option>
	                              <option>Less than 512 MB</option>
	                              <option>512 MB</option>
	                              <option>1 GB</option>
	                              <option>4 GB</option>
	                              <option>8 GB</option>
	                              <option>16 GB</option>
	                              <option>32 GB</option>
	                              <option>64 GB</option>
	                              <option>128 GB</option>
	                              <option>256 GB or moe</option>
	                              
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Features</label>
	                          <div class="right">
	                            <div class="checkboxlist" required="required">
	                              
	                                <form:checkbox id="features" path="features" value="Memory Card Slot"/> Memory Card Slot
	                              	</br>
	                                <form:checkbox id="features" path="features" value="Water & Dust Proof (IP)"/> Water & Dust Proof (IP)
	                             	</br>
	                                <form:checkbox id="features" path="features" value="Gorilla Glass Screen"/> Gorilla Glass Screen
	                              	</br>
	                                <form:checkbox id="features" path="features" value="WiFi"/> WiFi
	                              </br>
	                                <form:checkbox id="features" path="features" value="NFC"/> NFC
	                              </br>
	                                <form:checkbox id="features" path="features" value="Front LED Flash"/> Front LED Flash
	                              </br>
	                                <form:checkbox id="features" path="features" value="GPS"/> GPS
	                              </br>
	                                <form:checkbox id="features" path="features" value="Dual Camera - Back"/> Dual Camera - Back
	                              </br>
	                                <form:checkbox id="features" path="features" value="Dual Camera - Front"/> Dual Camera - Front
	                              </br>
	                                <form:checkbox id="features" path="features" value="Fingerprint Sensor"/> Fingerprint Sensor
	                              </br>
	                                <form:checkbox id="features" path="features" value="Heart Rate Sensor"/> Heart Rate Sensor 
	                              </br>
	                                <form:checkbox id="features" path="features" value="Proximity Sensor"/> Proximity Sensor
	                              </br>
	                                <form:checkbox id="features" path="features" value="Compass Sensor"/> Compass Sensor
	                              </br>
	                                
	                              
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                        
	                        <!-- End of Handset Specification Table -->
	                        
	                        
	                        <script>
	                        function show1(){
	                      	  document.getElementById('delivery').style.display ='none';
	                      	}
	                      	function show2(){
	                      	  document.getElementById('delivery').style.display = 'block';
	                      	}
	                        </script>
	                        
	                    <!-- Start Of Delivery Table -->    
                        
                        <form:form class="secondaryform" action="/member/editAds/cars/save" method="POST" modelAttribute="delivery">
                        		<form:input type="hidden" path="id" id="id"/>
                        		
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
                        <form:form class="secondaryform" action="/member/editAds/cars/save" method="POST" modelAttribute="warranty">
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
	                                <label><form:radiobutton id="warrantyType" path="warrantyType" onclick="show3();" value="No Warranty" /> No Warranty</label>
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
                        	
                        	</form:form> <!-- Handset Specification Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      	
                       	</form:form> <!-- Main-Ads Form Close -->
                       	
                    <!--  END FORM --> 
                    </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>