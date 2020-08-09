<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Hello <span style="color:#f28541">${customer.name}</span>, change your info below.</h3>
                         
                          <!-- Start of Customer Form -->
                        <form:form class="secondaryform" action="/member/editcustomer/save" method="POST" commandName="selectedCustomer">
                        <form:input type="hidden" path="customerId" id="customerId"/>
                        <form:input type="hidden" path="user" id="user"/>
                        <div class="form-group">
                          <label class="label">Full name: <font class="red">*</font></label>
                          <div class="right">
                            <form:input type="text" id="name" path="name"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="label">Mobile Phone: <font class="red">*</font></label>
                          <div class="right">
                            <form:input class="halfwidth" type="text" id="phone" path="phone"/>
                          </div>
                        </div>
                       
                        <div class="form-group">
                          <label class="label">City Name:</label>
                          <div class="right">
                            <form:input type="text" id="cityName" path="cityName"/>
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="label">Area Location:</label>
                          <div class="right">
                            <form:input type="text" id="areaLocation" path="areaLocation" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="label">Street Name:</label>
                          <div class="right">
                            <form:input type="text" id="streetName" path="streetName"/>
                          </div>
                        </div>
                       
                        <!-- <div class="form-group">
                          <label class="label">Subscribe / Hide Phone:</label>
                          <div class="right">
                            <div class="checkboxlist">
                              <span><label><input type="checkbox" name="subcribeinput">I do not want to subscribe to site newsletter.</label></span>
                              <span><label><input type="checkbox" name="subcribeinput">Hide my phone number (only contact me through email)</label></span>
                            </div>
                          </div>
                        </div> -->
                       <!--  <div class="form-group">
                          <label class="label">Security Code:</label>
                          <div class="right">
                            <small>Type in the above 5 letter code:</small>
                            <input class="halfwidth" type="text">
                          </div>
                        </div> -->
                        <!-- <div class="form-group">
                          <label class="label"></label>
                          <div class="right">
                            <div class="checkboxlist">
                              <span><label><input name="subcribeinput" type="checkbox">I have read and agree to <a href="#"><font class="blue"><u>terms of use</u></font></a></label></span>
                            </div>
                            		
                            
                          </div>
                        </div> -->
                        
                        <input type="submit" value="Save Changes">
                        
                      </form:form>
                          
                     </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>