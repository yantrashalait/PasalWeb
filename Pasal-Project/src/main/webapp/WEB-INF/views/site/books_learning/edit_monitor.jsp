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
	                        
	                         <!-- Start of Monitor Bicycle Specification Table -->
	                        	<form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="monitorSpec">
	                        <form:input type="hidden" path="id" id="id" value="${monitorSpec.id}"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Type <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="type" path="type" placeholder="Select Type" required="required">
	                              <option>${monitorSpec.type}</option>
	                              <option>CRT</option>
	                              <option>LCD</option>
	                              <option>LED</option>
	                              <option>OLED</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Size (inch)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="size" path="size" placeholder="Example: 52 "/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                       
	                        <!-- End of Monitors Specification Table -->
	                        
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
                        	
                        	</form:form> <!-- Monitor Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      
                       	</form:form> <!-- Main-Ads Form Close -->
                        
                    </div>
    <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>