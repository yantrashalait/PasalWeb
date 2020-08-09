<%@include file="../includes/header.jsp"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="date" value="${now}" pattern="yyyy-MM-dd" />

  <main id="main" class="site-main">
        <section class="content-wrap">
          <div class="container">
            <div class="row">
              <div id="primary" class="col-md-8">
                <div class="theiaStickySidebar">
                  <div class="main-content">
                    <div class="rent-lists">
                      <ul>
                      <c:if test="${param.success!=null}">
						<div class="alert alert-success alert-dismissible fade in" role="alert">
							<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true" style="color:#fff">×</span>
							</button>
							<b><i class="fa fa-check" aria-hidden="true" style="color:#fff"></i> <span style="color:#fff">Tour Request Sent Successfully.</span></b>
						</div>
					</c:if>
                      <c:forEach var="housing" items="${housings}">
	                      	<li class="rent-list-item">
	                          <div class="rentimg">
	                            <div class="inner-rentimg">
	                              <a href="/detail/housing/${housing.housingId}"><img src="/pasal/images/housing/${housing.brand.brandName}/${housing.picture[0].pictureName}"></a>
	                            </div>
	                          </div>
	                          <div class="rentlists-content">
	                            <h3 class="name"><a href="/detail/housing/${housing.housingId}">${housing.housingName}</a></h3>
	                            <div class="rli-info">
	                              <span>${housing.type}</span>
	                              <span class="middle-dot"></span>
	                              <span>${housing.area} sqft</span>
	                            </div>
	                            <div class="rli-address">
	                              <span>${housing.purpose}</span>
	                            </div>
	                            <div class="rli-contact-dtls">
	                              <!-- <div class="img-wrapper">
	                                <img class="profile-img" src="images/thumb.jpg" alt="img">
	                                <span class="badge-ico"><img src="images/badge.png" alt="img"></span>
	                              </div> -->
	                              <!-- <div class="profile-name">
	                                <a href="#">Property Gallery</a>
	                                <div class="lst-sub-title">Housing Prime Agent</div>
	                              </div> -->
	                            </div>
	                            <div class="rli-btn">
	                              <div class="rli-price">
	                                <i class="fas fa-rupee-sign"></i>
	                                ${housing.price}
	                              </div>
	                              <div class="rli-btn-wrap">
	                                <button class="tertiary btn"><i class="far fa-heart"></i></button>
	                                <button class="btn-contact btn">Contact</button>
	                              </div>
	                            </div>
	                          </div>
	                        </li>
                      </c:forEach>
                        

                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div id="secondary" class="col-md-4">
                <div class="theiaStickySidebar">
                  <aside class="widget">
                    <div class="title-bar">
                      <h3>Request a Tour</h3>
                    </div>
                    <div class="request-tour">
                        <div class="row">
                          <div class="col-12">
                            <form class="tour-act-form" method="POST" name="contactform" action="/send-mail">
                             <div class="formstyle1">
                             	<span class="ico"><i class="fas fa-calendar"></i></span>
                              	<input type="date" name="date" required="required">Choose Tour Day
                             </div> 
                              <div class="formstyle1">
                                <div class="name form-group">
                                  <span class="ico"><i class="fas fa-user"></i></span>
                                  <input type="text" name="name" placeholder="Your Name" required="required">
                                </div>
                                <div class="phone form-group">
                                  <span class="ico"><i class="fas fa-phone"></i></span>
                                  <input type="tel" name="phone" placeholder="Phone" required="required">
                                </div>
                                <div class="email form-group">
                                  <span class="ico"><i class="fas fa-envelope"></i></span>
                                  <input type="email" name="email" placeholder="Email" required="required">
                                </div>
                                <div class="message form-group">
                                  <textarea name="message" placeholder="Add your message" required="required"></textarea>
                                </div>
                                <input type="hidden" name="subject" value="Housing">
                                
                                <div class="submit form-group">
                                	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                  <input class="sitebtn1" name="submit" type="submit" value="Send tour request">
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="col-12">
                            <div class="posting-info">
                              <span class="property-info contact-phone">Call: (425) 533-8177</span>
                            </div>
                          </div>
                        </div>
                        <div class="question-contact-button-field">
                          <div class="row">
                            <div class="col-12">
                              <span class="text-container"> Not ready to tour yet? </span>
                            </div>
                            <div class="col-12">
                              <button type="button" class="btn btn-primary sitebtn1" data-toggle="modal" data-target="#askquestion2">
                                 Ask a question 
                              </button>
                            </div>
                          </div>
                        </div>
                    </div>
                  </aside>
                </div>
                <!-- The Modal -->
                <div class="modal fade" id="askquestion2">
                  <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title">Ask a question</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <!-- Modal body -->
                      <div class="modal-body">
                        <form class="formstyle1" method="POST" name="contactform" action="/send-mail">
                          <div class="name form-group">
                            <span class="ico"><i class="fas fa-user"></i></span>
                            <input type="text" name="name" placeholder="Your Name" required="required">
                          </div>
                          <div class="phone form-group">
                            <span class="ico"><i class="fas fa-phone"></i></span>
                            <input type="tel" name="phone" placeholder="Phone" required="required">
                          </div>
                          <div class="email form-group">
                            <span class="ico"><i class="fas fa-envelope"></i></span>
                            <input type="email" name="email" placeholder="Email" required="required">
                          </div>
                          <div class="message form-group">
                            <textarea name="message" placeholder="Add your message"></textarea>
                          </div>
                          <input type="hidden" name="date" value="${date}">
                          <input type="hidden" name="subject" value="Housing">
                          <div class="submit form-group">
                            <input class="sitebtn1" type="submit" name="submit" value="Send question">
                          </div>
                        </form>
                        <span class="contact-phone">Call: (425) 533-8177</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
       <!-- Civil Home Phases Comes here -->
        
        <section class="imp-area gradientbgposition1">
          <div class="container">
            <div class="top-imp">
              <div class="row">
              
                <div class="col-md-4 left-box">
                  <figure class="img-holder">
                    <a href="/detail/housing/${selectedHousing[0].housingId}">
                      <img src="/pasal/images/housing/${selectedHousing[0].brand.brandName}/${selectedHousing[0].picture[0].pictureName}" alt="img" style="height:300px;">
                      <span class="img-caption">${selectedHousing[0].housingName}</span>
                    </a>
                  </figure>
                </div>
                
                <div class="col-md-8 right-box">
                
                
                  <div class="bs-box">
                    <div class="box-brands">
                      <figure class="img-holder">
                        <a href="/housing"><img src="images/brand1.png" alt="img"> Ongoing Projects</a>
                      </figure>
                    </div>
                    <div class="social-inline">
                       <ul>
                         <li class="ico-facebook"><a href="${selectedHousing[0].brand.facebookLink}" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
                         <li class="ico-instagram"><a href="${selectedHousing[0].brand.instagramLink}" title="instagram"><i class="fab fa-instagram"></i></a></li>
                         <li class="ico-youtube"><a href="${selectedHousing[0].brand.twitterLink}" title="youtube"><i class="fab fa-twitter"></i></a></li>
                         <li class="ico-google-plus"><a href="${selectedHousing[0].brand.googlePlusLink}" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
                       </ul>
                     </div>
                  </div>
                  
                  <div class="nicepro-box row">
                  <c:forEach var="product" items="${selectedHousing}">
	                  <c:if test="${product ne selectedHousing[0]}">
	                  	<div class="col-4">
	                      <figure class="img-holder"><a href="/detail/housing/${product.housingId}"><img src="/pasal/images/housing/${product.brand.brandName}/${product.picture[0].pictureName}" alt="img"></a></figure>
	                      <h3 class="featured-title">
	                        <a href="/detail/housing/${product.housingId}"><span class="pro-area">${product.housingName}</span></a>
	                      </h3>
	                    </div>
	                  </c:if>
                    
                  </c:forEach>  
                  </div>
                </div>
              </div>
            </div>
            <div class="single-adsbox">
              <a href="#"><img src="images/ads1.png" alt="img"></a>
            </div>
          </div>
        </section>
        
      </main>
<%@include file="../includes/footer.jsp"%>  