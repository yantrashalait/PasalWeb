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
	                        
	                        <!-- Start of Real-Estate Specification Table -->
	                        	<form:form class="secondaryform" action="/new-ads/addBooksAds" method="POST" modelAttribute="realEstateSpec">
	                        <form:input type="hidden" path="id" id="id"/>
	                        
	                        <div class="form-group">
	                          <label class="label">Property Type <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="propertyType" path="propertyType" placeholder="Select Property Type" required="required">
	                              <option></option>
	                              <option>House - Individual</option>
	                              <option>House - In a Colony</option>
	                              <option>House - Semi-commercial</option>
	                              <option>Bungalow</option>
	                              <option>Apartment Building</option>
	                              <option>Commercial Building</option>
	                              <option>Land - Individual</option>
	                              <option>Land - Plotted</option>
	                              <option>Land - Commercial Use</option>
	                              <option>Land - Agriculture</option>
	                              <option>Godown/Tahara</option>
	                              <option>Others</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Area <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="area" path="area" placeholder="Select Area" required="required">
	                              <option></option>
	                              <option>Kathmandu - Inside Ringroad</option>
	                              <option>Kathmandu - Outside Ringroad</option>
	                              <option>Lalitpur - Inside Ringroad</option>
	                              <option>Lalitpur - Outside Ringroad</option>
	                              <option>Bhaktapur</option>
	                              <option>Nearby Kathmandu Valley</option>
	                              <option>Bharatpur (Chitwan)</option>
	                              <option>Birgunj</option>
	                              <option>Biratnagar</option>
	                              <option>Butwal</option>
	                              <option>Hetauda</option>
	                              <option>Pokhara</option>
	                              <option>Other Area</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Property Location </label><form:errors path="propertyLocation" cssStyle="color:red"/>
	                          <div class="right">
	                            <form:textarea id="propertyLocation" path="propertyLocation"></form:textarea>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Access Road <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="accessRoad" path="accessRoad" placeholder="Select Access Road" required="required">
	                              <option></option>
	                              <option>Less than 5 feet</option>
	                              <option>5 to 8 feet</option>
	                              <option>9 to 12 feet</option>
	                              <option>13 to 20 feet</option>
	                              <option>Above 20 feet</option>
	                              <option>Non Motorable</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Land Size (in aana/dhur)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="landSize" path="landSize"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Floors</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="floors" path="floors"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Built Up (sq.ft)</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="builtUp" path="builtUp"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Bedrooms</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="bedroom" path="bedroom"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Bathrooms</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="bathroom" path="bathroom"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Living Rooms</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              <span>
	                                <form:input class="halfwidth" type="number" id="livingroom" path="livingroom"/>
	                              </span>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Water Supply <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="waterSupply" path="waterSupply" placeholder="Water Supply Available" required="required">
	                              <option></option>
	                              <option>Yes</option>
	                              <option>No</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
	                          <label class="label">Furnishings <font class="red">*</font></label>
	                          <div class="right">
	                            <form:select class="halfwidth" type="text" id="furnishing" path="furnishing" placeholder="Select Furnishing" required="required">
	                              <option></option>
	                              <option>Non</option>
	                              <option>Semi</option>
	                              <option>Full</option>
	                            </form:select>
	                          </div>
	                        </div>
	                        
	                        <div class="form-group">
                          	<label class="label">Features</label>
	                          <div class="right">
	                            <div class="checkboxlist">
	                              
	                                <form:checkbox id="features" path="features" value="Garden"/> Garden
	                              	</br>
	                                <form:checkbox id="features" path="features" value="Parking Space"/> Parking Space
	                             	 </br>
	                                <form:checkbox id="features" path="features" value="Garage"/> Garage
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Servant Quarter"/> Servant Quarter
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Security Guards"/> Security Guards
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Backup Generator"/> Backup Generator
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Elevator"/> Elevator
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Swimming Pool"/> Swimming Pool
	                              	</br>
	                              	<form:checkbox id="features" path="features" value="Gymnasium"/> Gymnasium
	                              	</br>
	                              	
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <!-- End of Real-Estate Specification Table -->
	                       
                        <input type="submit" value="Submit Ads">
                        
                        	
                        	</form:form> <!-- Car Specification Form Close -->
                        
                      	</form:form> <!-- Specification Form Close -->
                      	
                       	</form:form> <!-- Main-Ads Form Close -->
                     <script>
                     
                     	
                     </script>
                    <!--  END FORM --> 
                    </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>