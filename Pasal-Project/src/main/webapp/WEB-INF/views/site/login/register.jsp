<%@include file="../includes/header.jsp"%> 

	<%-- <div class="global-header">
    <div class="container">
      <p class="pull-right">
        <a href="index.php">Home</a> / Login-Page
      </p>
    </div>
  </div>

  <section id="nepal-des" class="container">
    <div class="row">
      <h1 class="page-title">Register Page</h1>
	</div><!-- col-md-3-->
	
	<div>
		<form:form action="/register" method="POST" commandName="user">
	         <div class="form-group">
	         	<label>Email</label> 
	         	<input class="form-control" placeholder="Email" type="text" name="email" required/> 
	         </div>
	         <div class="form-group">
	         	<label> Password</label> 
	         	<input class="form-control" placeholder="Password" type="password"  name="password" required/> 
	         </div>
	         <!-- <div class="form-group">
	         	<label> Re-Enter Password</label> 
	         	<input class="form-control" placeholder="Password" type="password"  name="password" required/> 
	         </div> -->
	         <div>
	         	<input type="submit" class="btn btn-primary" value="Register"/>
	         </div>
	         <input  type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
	     </form:form>
	</div>
  </section> --%>

      
      <main id="main" class="site-main">
        <section class="product-area product-slide">
          <div class="container">
            <h3 class="section-title">Featured classifieds</h3>
            <div class="owl-carousel owl-theme product-carousel5">
            		<c:forEach var="recent" items="${featuredAds}">
	            		<div class="item product">
	                <div class="product-image">
	                  <figure class="img-holder">
	                    <c:choose>
		                  	<c:when test="${not empty recent.picture[0].pictureName}">
		                  		<a href="/detail/${recent.id}"><img src="/pasal/images/mainads/${recent.picture[0].pictureName}" style="height:120px;"></a>
		                  	</c:when>
		                  	<c:otherwise>
		           				<a href="/detail/${recent.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
		           			</c:otherwise>
		                  </c:choose>
	                  </figure>
	                </div>
	                <div class="product-content">
	                  <h3 class="name"><a href="/detail/${recent.id}">${recent.adTitle}</a></h3>
	                  <div class="metas clearfix">
	                    <div class="price"> Rs. ${recent.price}</div>
	                    <div class="pro-status" style="color:#365b96;font-size:9px;">${recent.commonSpec.specCondition}</div>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            </div>
          </div>
        </section>
        <section class="content-wrap">
          <div class="container">
            <div class="row">
              <div id="secondary" class="col-md-4">
                <div class="theiaStickySidebar">
                  <aside class="widget">
                    <div class="title-bar">
                      <h3>Register New Member</h3>
                    </div>
                    <div class="expandablebox">
                      <h3 class="featured-title">Why do I need to register?</h3>
                      <ul>
                        <li>Your own control panel.</li>
                        <li>Add, Edit & Delete Ads.</li>
                        <li>View Ad traffic and hits.</li>
                        <li>Upload Images for your ad.</li>
                        <li>Change your contact info.</li>
                        <li>Verify as trusted seller.</li>
                        <li>Write and reply to buyer speak.</li>
                        <li>Give feedback on other user profile.</li>
                        <li>And Most Important, Post your classified FREE.</li>
                      </ul>
                    </div>
                  </aside>
                </div>
              </div>
              <div id="primary" class="col-md-8">
                <div class="theiaStickySidebar">
                  <div class="main-content">
                    <div class="expandablebox">
                    
                      <form:form class="secondaryform" action="/register" method="POST" modelAttribute="user">
                        <div class="form-group">
                          <label class="label">Email address: <font class="red">*</font></label>
                          <div class="right">
                            <form:input type="email" id="email" path="email" required="required" placeholder="eg: abc@xyz.com"/>
                            <small>(Enter valid email address. To activate your account a verification email will be sent in this address.)</small>
                            <c:if test="${emailErr != null}">
                            	<p class="mjl-form-err">Email is already taken.</p>
                            </c:if>
                          </div>
                        </div>
                        <!-- <div class="form-group">
                          <label class="label">Retype Email address:<font class="red">*</font></label>
                          <div class="right">
                            <input type="text">
                          </div>
                        </div> -->
                        
                        <div class="form-group">
                          <label class="label">Password (between 6 and 20 chars): <font class="red">*</font></label>
                          <div class="right">
                            <form:input class="halfwidth" type="password" id="password" path="password" required="required"/>
                            <c:if test="${passErr != null}">
                            	<p class="mjl-form-err">Password Must Be between 6 and 20 chars</p>
                            </c:if>
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="label">Confirm password: <font class="red">*</font></label>
                          <div class="right">
                            <input class="halfwidth" type="password" id="confirm_password" required="required"/>
                          </div>
                        </div>
                        
                        <!-- Javascript code for confirm password validation -->
                        <script>
                        var password = document.getElementById("password"), 
                        confirm_password = document.getElementById("confirm_password");
	
	                      function validatePassword(){
	                        if(password.value != confirm_password.value) {
	                          confirm_password.setCustomValidity("Passwords Don't Match");
	                        } else {
	                          confirm_password.setCustomValidity('');
	                        }
	                      }
	
	                      password.onchange = validatePassword;
	                      confirm_password.onkeyup = validatePassword;
                        </script>
                        
                        <!-- End of User Form -->
                        
                        <!-- Start of Customer Form -->
                        <form:form class="secondaryform" action="/register" method="POST" commandName="customerForm">
                        <form:input type="hidden" path="customerId" id="customerId"/>
                        
                        <div class="form-group">
                          <label class="label">Full name: <font class="red">*</font></label>
                          <div class="right">
                            <form:input type="text" id="name" path="name" required="required"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="label">Mobile Phone: <font class="red">*</font></label>
                          <div class="right">
                            <form:input class="halfwidth" type="text" id="phone" path="phone" required="required" placeholder="eg: 9803539428"/>
                            <c:if test="${phoneErr != null}">
                            	<p class="mjl-form-err">Phone Number must of 10 digit and numeric</p>
                            </c:if>
                          </div>
                        </div>
                        
                        
                        <div class="form-group">
                          <label class="label">City Name:</label>
                          <div class="right">
                            <form:input type="text" id="cityName" path="cityName" placeholder="eg: Kathmandu"/>
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="label">Area Location:</label>
                          <div class="right">
                            <form:input type="text" id="areaLocation" path="areaLocation" placeholder="eg: Boudha-06"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="label">Street Name:</label>
                          <div class="right">
                            <form:input type="text" id="streetName" path="streetName" placeholder="eg: Khuwa Tole"/>
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
                        </div> 
                        <div class="form-group">
                          <label class="label">Security Code:</label>
                          <div class="right">
                            <small>Type in the above 5 letter code:</small>
                            <input class="halfwidth" type="text">
                          </div>
                        </div> 
                        <div class="form-group">
                          <label class="label"></label>
                          <div class="right">
                            <div class="checkboxlist">
                              <span><label><input name="subcribeinput" type="checkbox">I have read and agree to <a href="#"><font class="blue"><u>terms of use</u></font></a></label></span>
                            </div>
                          </div>
                        </div>  -->
                        
                        <input type="submit" value="register">

                      </form:form>
                      </form:form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="imp-area gradientbgposition2">
          <div class="container">
            <div class="top-imp">
              <div class="row">
                <div class="col-md-4 left-box">
                  <figure class="img-holder"><img src="images/civil-home.png" alt="img"></figure>
                </div>
                <div class="col-md-8 right-box">
                  <div class="bs-box">
                    <div class="box-brands">
                      <figure class="img-holder">
                        <a href="#"><img src="images/hyundai.png" alt="img"> HYUNDAI CARS</a>
                      </figure>
                    </div>
                    <div class="social-inline">
                       <ul>
                         <li class="ico-facebook"><a href="#" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
                         <li class="ico-instagram"><a href="#" title="instagram"><i class="fab fa-instagram"></i></a></li>
                         <li class="ico-youtube"><a href="#" title="youtube"><i class="fab fa-twitter"></i></a></li>
                         <li class="ico-google-plus"><a href="#" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
                       </ul>
                     </div>
                  </div>
                  <div class="nicepro-box row">
                    <div class="col-4">
                      <figure class="img-holder"><a href="#"><img src="images/img1.png" alt="img"></a></figure>
                      <h3 class="featured-title">
                        <a href="#">Civil Homes <span class="pro-area">Phase IV Dhapakhel</span></a>
                      </h3>
                    </div>
                    <div class="col-4">
                      <figure class="img-holder"><a href="#"><img src="images/img2.png" alt="img"></a></figure>
                      <h3 class="featured-title">
                        <a href="#">Civil Homes <span class="pro-area">Phase IV Dhapakhel</span></a>
                      </h3>
                    </div>
                    <div class="col-4">
                      <figure class="img-holder"><a href="#"><img src="images/img3.png" alt="img"></a></figure>
                      <h3 class="featured-title">
                        <a href="#">Civil Homes <span class="pro-area">Phase IV Dhapakhel</span></a>
                      </h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="single-adsbox">
              <a href="#"><img src="images/ads5.png" alt="img"></a>
            </div>
          </div>
        </section>
        <section class="product-area product-slide">
          <div class="container">
            <h3 class="section-title">Featured classifieds</h3>
            <div class="owl-carousel owl-theme product-carousel5">
            		<c:forEach var="recent" items="${featuredAds}">
	            		<div class="item product">
	                <div class="product-image">
	                  <figure class="img-holder">
		                  <c:choose>
		                  	<c:when test="${not empty recent.picture[0].pictureName}">
		                  		<a href="/detail/${recent.id}"><img src="/pasal/images/mainads/${recent.picture[0].pictureName}" style="height:120px;"></a>
		                  	</c:when>
		                  	<c:otherwise>
		           				<a href="/detail/${recent.id}"><img src="/pasal/images/site-logo.png" style="width:200px;margin-top: 18%;" /></a>                         			
		           			</c:otherwise>
		                  </c:choose>
	                  </figure>
	                </div>
	                <div class="product-content">
	                  <h3 class="name"><a href="/detail/${recent.id}">${recent.adTitle}</a></h3>
	                  <div class="metas clearfix">
	                    <div class="price"> Rs. ${recent.price}</div>
	                    <div class="pro-status" style="color:#365b96;font-size:9px;">${recent.commonSpec.specCondition}</div>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            </div>
          </div>
        </section>
      </main>
<%@include file="../includes/footer.jsp"%> 