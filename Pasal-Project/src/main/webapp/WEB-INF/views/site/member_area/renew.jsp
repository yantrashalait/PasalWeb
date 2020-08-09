<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>

                    <div class="expandablebox">
                      <h3 class="featured-title">Renew Ad:</h3>
                      <p>Ad Title - ${main.adTitle}</p>
                         
                          <div class="row">
                          <form:form class="secondaryform" action="/member/renew/save" method="POST" modelAttribute="main">
                          
                          	<form:input type="hidden" id="id" path="id"/>
                          	<form:input type="hidden" id="adTitle" path="adTitle"/>
                          	<form:input type="hidden" id="description" path="description"/>
                          	<form:input type="hidden" id="price" path="price"/>
                          	<form:input type="hidden" id="priceNegotiable" path="priceNegotiable"/>
                          	<form:input type="hidden" id="addedDate" path="addedDate"/>
                          	<form:input type="hidden" id="viewCount" path="viewCount"/>
                          	<form:input type="hidden" id="expired" path="expired"/>
                          	<form:input type="hidden" id="featured" path="featured"/>
                          	<form:input type="hidden" id="subCategory" path="subCategory"/>
                          	<form:input type="hidden" id="subModel" path="subModel"/>
                          	<form:input type="hidden" id="customer" path="customer"/>
                          	<form:input type="hidden" id="picture" path="picture"/>
                          	<form:input type="hidden" id="delivery" path="delivery"/>
                          	
                          	<form:input type="hidden" id="warranty" path="warranty"/>
                          	<form:input type="hidden" id="commonSpec" path="commonSpec"/>
                          	<form:input type="hidden" id="autoCarSpec" path="autoCarSpec"/>
                          	<form:input type="hidden" id="autoMotocycleSpec" path="autoMotocycleSpec"/>
                          	
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
	                        
	                        <input type="submit" class="btn mjl-btn-default" value="Renew"/>
                          </form:form>
						  	
                         </div> <!--  row end -->
	                         
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