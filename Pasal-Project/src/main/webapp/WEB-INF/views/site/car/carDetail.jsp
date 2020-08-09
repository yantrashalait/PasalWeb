<%@include file="../includes/header.jsp"%> 
<style>
/** Explore Page**/
#scrollContainer {
  cursor: move;
  height: auto;
  overflow: hidden;
  padding:1em 0;
  width: 100%;
  margin-top: 1em;
  }

  #scrollCarousel {
  position: relative;
  }

  .project-index {
  position: relative;
  }

  .project-index figure {
  height: auto;
  float: left;
  padding: 10px;
  width: auto;
  }

  .project-index img {
    width:auto;height: 200px;border-radius: 5px;
  }
  
  .parent-hover a{
	color: #fff;
}
</style>

  <main id="main" class="site-main">
	<div id="scrollContainer">
      		<div id="scrollCarousel">
          		<div class="project-index">
          			<c:forEach var="picture" items="${carPicture}">
          				<figure class="parent-hover">
				           <img src="/pasal/images/car/${car.brand.brandName}/${picture.pictureName}" />
				        </figure>
          			</c:forEach>
		        </div>
	        </div>
        </div>
        <section class="content-wrap">
          <div class="container">
            <div class="row">
              <div id="primary" class="col-md-8">
                <div class="theiaStickySidebar">
                  <div class="main-content">
                    <div class="detail-content-wrapper">
                      <table class="dtl-adrsbox">
                        <tr>
                          <td class="adrs-description">
                            <h2>
                              ${car.carName }
                            </h2>
                            <ul class="adrs-bbs">
                              <li>${car.type}</li>
                              <li>${car.transmission} </li>
                              <li>${car.fuel} </li>
                            </ul>
                          </td>
                          <td class="adrs-summary">
                            <div class="status-icon-row">
                              <span class="zsg-icon-for-rent"></span> Brand New
                            </div>
                            <div class="adrs-summary-row">   
                              <span style="font-size:16px;">
                                NRS. ${car.price}
                                <sub>/mo</sub>
                              </span>    
                            </div>
                            <!-- <div class="prop-value-ad">
                              <a href="#">List your rental on Zillow. It's free!</a>
                            </div> -->
                          </td>
                        </tr>
                      </table>
                      <div class="adrs-content-section showmore_content">
                        <p>
                          ${car.description}
                          <br>
                        </p>
                      </div>
                      <div class="facts-expandable-container">
                        <div class="fact-ataglance-lists">
                          <h2 class="fact-category-title">Facts and Features</h2>
                          <ul>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Type</h3>
                              <p>${car.type}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Transmission</h3>
                              <p>${car.transmission}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Fuel</h3>
                              <p>${car.fuel}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Engine</h3>
                              <p>${car.engine}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Color</h3>
                              <p>${car.color}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Make Year</h3>
                              <p>${car.makeYear}</p>
                            </li>
                          </ul>
                        </div>
                        <div class="fact-moreless-content showmore_content">
                          
                          <h4 class="fact-category-heading">Features</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <ul>
                                  <li>
                                    <span class="fact-name">Price:</span>
                                    <span class="fact-value">NRS. ${car.price}</span>
                                  </li>
                                </ul>
                                <p>
                                  ${car.features}
                                </p>
                              </div>
                            </div>
                          </div>
                          <!-- <h4 class="fact-category-heading">Activity On Zillow</h4> -->
                          <!-- <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <ul>
                                  <li>
                                    <span class="fact-name">Days on Zillow:</span>
                                    <span class="fact-value">Less than 1</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Views since listing:</span>
                                    <span class="fact-value">136</span>
                                  </li>
                                  <li>
                                    <span class="fact-value">5 shoppers saved this home</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div> -->
                        </div>
                      </div>
                      <%-- <div class="request-tour">
                        <h2>Request a Tour</h2>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="posting-info">
                              <span class="property-info contact-phone">Call: (425) 533-8177</span>
                            </div>
                          </div>
                          <div class="col-md-6">
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
                                <input type="hidden" name="subject" value="Cars">
                                
                                <div class="submit form-group">
                                	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                  <input class="sitebtn1" name="submit" type="submit" value="Send tour request">
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div class="question-contact-button-field">
                          <div class="row">
                            <div class="col-md-6">
                              <span class="text-container"> Not ready to tour yet? </span>
                            </div>
                            <div class="col-md-6">
                              <button type="button" class="btn btn-primary sitebtn1" data-toggle="modal" data-target="#askquestion">
                                 Ask a question 
                              </button>

                              <!-- The Modal -->
                              <div class="modal fade" id="askquestion">
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
				                         <input type="hidden" name="message" value="Cars">
				                         <input type="hidden" name="subject" value="Cars">
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
                      </div> --%>
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
                                <input type="hidden" name="subject" value="Cars">
                                
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
                         <input type="hidden" name="message" value="Cars">
                         <input type="hidden" name="subject" value="Cars">
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
        <!-- Hyndai Car start -->
		        
		        <section class="imp-area gradientbgposition1">
		          <div class="container">
		            <div class="top-imp">
		              <div class="row">
		              
		                <div class="col-md-4 left-box">
		                  <figure class="img-holder">
		                    <a href="/detail/car/${selectedCar[0].carId}">
		                      <img src="/pasal/images/car/${selectedCar[0].brand.brandName}/${selectedCar[0].picture[0].pictureName}" alt="img" style="height:300px;">
		                      <span class="img-caption">${selectedCar[0].carName}</span>
		                    </a>
		                  </figure>
		                </div>
		                
		                <div class="col-md-8 right-box">
		                
		                
		                  <div class="bs-box">
		                    <div class="box-brands">
		                      <figure class="img-holder">
		                        <a href="/car"><img src="/images/hyundai.png" alt="img"> ${selectedCar[0].brand.brandName} Cars</a>
		                      </figure>
		                    </div>
		                    <div class="social-inline">
		                       <ul>
		                         <li class="ico-facebook"><a href="${selectedCar[0].brand.facebookLink}" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
		                         <li class="ico-instagram"><a href="${selectedCar[0].brand.instagramLink}" title="instagram"><i class="fab fa-instagram"></i></a></li>
		                         <li class="ico-youtube"><a href="${selectedCar[0].brand.twitterLink}" title="youtube"><i class="fab fa-twitter"></i></a></li>
		                         <li class="ico-google-plus"><a href="${selectedCar[0].brand.googlePlusLink}" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
		                       </ul>
		                     </div>
		                  </div>
		                  
		                  <div class="nicepro-box row">
		                  <c:forEach var="product" items="${selectedCar}">
			                  <c:if test="${product ne selectedCar[0]}">
			                  	<div class="col-4">
			                      <figure class="img-holder"><a href="/detail/car/${product.carId}"><img src="/pasal/images/car/${product.brand.brandName}/${product.picture[0].pictureName}" alt="img"></a></figure>
			                      <h3 class="featured-title">
			                        <a href="/detail/car/${product.carId}"><span class="pro-area">${product.carName}</span></a>
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
       <!--  <section class="product-area product-slide">
          <div class="container">
            <h3 class="section-title">Reommended for You</h3>
            <div class="owl-carousel owl-theme product-carousel5">
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img1.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Tata Sumo Urgen</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img2.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Canon Eos 700d</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img3.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Tata Sumo Urgent</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img4.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Tata Sumo Urgent</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img5.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Tata Sumo Urgent</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
              <div class="item product">
                <div class="product-image">
                  <figure class="img-holder">
                    <a href="#"><img src="images/product-img4.png"></a>
                  </figure>
                </div>
                <div class="product-content">
                  <h3 class="name"><a href="#">Tata Sumo Urgent</a></h3>
                  <div class="metas clearfix">
                    <div class="price">Rs. 18,25,000</div>
                    <div class="pro-status">(USED)</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section> -->
      </main>
<%@include file="../includes/footer.jsp"%>  