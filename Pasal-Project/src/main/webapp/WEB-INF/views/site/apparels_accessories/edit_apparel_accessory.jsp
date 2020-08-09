<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Ad Title: ${mainads.adTitle}</h3>
                     
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
                      <form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="mainAds">
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
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                        
	                        <!-- End Of Specification Table -->
	                        
	                        <!-- Start of Clothing Specification Table -->
	                        	<form:form class="secondaryform" action="/member/editAds/books/save" method="POST" modelAttribute="apparelAccessorySpec">
	                        <form:input type="hidden" path="id" id="id" value="${apparelAccessorySpec.id}"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Gender <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="gender" path="gender" placeholder="Select Gender" required="required">
	                              <option></option>
	                              <option>Men</option>
	                              <option>Woman</option>
	                              <option>Both</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <form:input type="hidden" path="mainAds" id="mainAds"/>
	                        
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
                        		<form:input type="hidden" path="id" id="id" value="${warranty.id }"/>
                       
                        		
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
                        
                        <form:input type="hidden" path="mainAds" id="mainAds"/>
                        
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