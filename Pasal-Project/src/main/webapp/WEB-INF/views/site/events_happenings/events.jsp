<%@include file="../includes/header.jsp"%>
  <%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Selected Category: ${categorybysubcategory.categoryName}/${subcategory.subCategoryName}</h3>
                      
                      <!-- ERROR Handelling -->
                     
                      <c:if test="${param.cusErr!=null}">
						<div class="alert alert-danger alert-dismissible fade in" role="alert">
							<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<span class="glyphicon glyphicon-remove"></span> <b>Please Sir/Madam you should first Login !</b>
						</div>
					</c:if>
					
					<!-- End ERROR Handelling -->
					
                      <form:form class="secondaryform" action="/new-ads/addEventsAds" method="POST" modelAttribute="mainAds">
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
                        
	                        <div class="form-group">
	                          <label class="label">How many days do you want your ad to run? <font class="red">*</font></label>
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
	                            <form:input class="halfwidth" type="number" id="price" path="price" placeholder="Price"/>
	                          </div>
	                          <form:errors class="halfwidth" path="price" cssStyle="color:red;"/>
	                        </div>
                        
	                        <div class="form-group">
	                          <label class="label">Price Negotiable</label>
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
	                        
	                          
                        <input type="submit" value="Submit Ads">
                        
                       	</form:form> <!-- Main-Ads Form Close -->
                        
                    </div>
      <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>