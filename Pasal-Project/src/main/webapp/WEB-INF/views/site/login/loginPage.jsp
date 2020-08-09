<%@include file="../includes/header.jsp"%> 
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
        
        <section class="content-wrap login-area">
          <div class="container">
          <!-- ERROR Handelling -->
                     
                 <c:if test="${param.error!=null}">
					<div class="alert alert-danger alert-dismissible fade in" role="alert">
						<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<span class="glyphicon glyphicon-remove"></span> <b>Please sir/madam, your email/password is incorrect !</b>
					</div>
				</c:if>

		<!-- End ERROR Handelling -->
            <div class="row">
              <div class="col-md-4">
                <div class="title-bar">
                  <h3>Browse by Category</h3>
                </div>
                <div class="expandablebox">
                  <h3 class="featured-title">Why do I need to register?</h3>
                  <ul>                    
                      <li>Your own control panel.</li>
                      <li>Add, Edit and Delete Ads.</li>
                      <li>View Ad traffic and hits.</li>
                      <li>Upload Images for your ad.</li>
                      <li>Change your contact info.</li>
                      <li>Verify as trusted member.</li>
                      <li>Write and reply to buyer speak.</li>
                      <li>Give feedback on other user profile.</li>
                      <li>Post your classified FREE.</li>
                  </ul>
                  <p><a href="/register"><u>Not a Member? Join Us!</u></a></p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="title-bar">
                  <h3>Member Login</h3>
                </div>
                <div class="expandablebox">
                  <h3 class="featured-title">Please login in order to access your classifieds. </h3>
                  <form action="/login" method="POST">
                    <div class="form-group">
                      <label class="label">Email address:</label>
                      <div class="right">
                        <input class="form-control" placeholder="Email" type="email" name="email" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="label">Password:</label>
                      <div class="right">
                        <input class="form-control" placeholder="Password" type="password"  name="password" required>
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="submit" value="member login">
                    </div>
                  </form>
                </div>
              </div>
              <div class="col-md-4">
                <div class="title-bar">
                  <h3>Forgot your password?</h3>
                </div>
                <div class="expandablebox">
                  <h3 class="featured-title">Type your email address below and we will send you a new password. </h3>
                  <form>
                    <div class="form-group">
                      <label class="label">Email:</label>
                      <div class="right">
                        <input type="text" id="email1">
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="submit" value="send">
                    </div>
                  </form>
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