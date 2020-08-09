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
          			<c:forEach var="picture" items="${housingPicture}">
          				<figure class="parent-hover">
				           <img src="/pasal/images/housing/${housing.brand.brandName}/${picture.pictureName}" />
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
                              ${housing.housingName }
                            </h2>
                            <ul class="adrs-bbs">
                              <li>${housing.bedroom} bedrooms</li>
                              <li>${housing.bathroom} baths</li>
                              <li>${housing.area} sqft</li>
                            </ul>
                          </td>
                          <td class="adrs-summary">
                            <div class="status-icon-row">
                              <span class="zsg-icon-for-rent"></span> ${housing.purpose}
                            </div>
                            <div class="adrs-summary-row">   
                              <span>
                                NRS. ${housing.price}
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
                          ${housing.description}
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
                              <p>${housing.type}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Laundry</h3>
                              <p>${housing.laundry}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Heating</h3>
                              <p>${housing.heating}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Cooling</h3>
                              <p>${housing.cooling}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Pets</h3>
                              <p>${housing.pets}</p>
                            </li>
                            <li>
                              <span class="ico"><i class="far fa-building"></i></span>
                              <h3 class="featured-title">Parking</h3>
                              <p>${housing.parking}</p>
                            </li>
                          </ul>
                        </div>
                        <div class="fact-moreless-content showmore_content">
                          <h4 class="fact-category-heading">Rental Facts</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <ul>
                                  <li>
                                    <span class="fact-name">Deposit & fees:</span>
                                    <span class="fact-value">${housing.price}</span>
                                  </li>
                                  <li>
                                    <span class="fact-value">${housing.available}</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Laundry:</span>
                                    <span class="fact-value">${housing.laundry}</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Pets:</span>
                                    <span class="fact-value">${housing.pets}</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Posted:</span>
                                    <span class="fact-value">${housing.addedDate}</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Unit floor #:</span>
                                    <span class="fact-value">${housing.unitFloor}</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Rent/sqft:</span>
                                    <span class="fact-value">${housing.rentPerSqft}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <h4 class="fact-category-heading">Interior Features</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <h3 class="featured-title">Bedrooms</h3>
                                <ul>
                                  <li>
                                    <span class="fact-name">Beds:</span>
                                    <span class="fact-value">${housing.bedroom}</span>
                                  </li>
                                </ul>
                              </div>
                              <div class="fact-lists">
                                <h3 class="featured-title">Appliances</h3>
                                <ul>
                                  <li>
                                    <span class="fact-name">Appliances included:</span>
                                    <span class="fact-value">${housing.appliances}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <h3 class="featured-title">Flooring</h3>
                                <ul>
                                  <li>
                                    <span class="fact-name">Floor size:</span>
                                    <span class="fact-value">${housing.area} sqft</span>
                                  </li>
                                  <li>
                                    <span class="fact-name">Flooring:</span>
                                    <span class="fact-value">${housing.flooring}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <h4 class="fact-category-heading">Construction</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <h3 class="featured-title">Type and Style</h3>
                                <ul>
                                  <li>
                                    <span class="fact-value">${housing.type}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <h3 class="featured-title">Dates</h3>
                                <ul>
                                  <li>
                                    <span class="fact-value">Built in ${housing.dates}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <h4 class="fact-category-heading">Exterior Features</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <h3 class="featured-title">Other Exterior Features</h3>
                                <ul>
                                  <li>
                                    <span class="fact-name">Unit floor #:</span>
                                    <span class="fact-value">${housing.unitFloor}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <h4 class="fact-category-heading">Parking</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <ul>
                                  <li>
                                    <span class="fact-name">Parking:</span>
                                    <span class="fact-value">${housing.parking}</span>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <h4 class="fact-category-heading">Other</h4>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="fact-lists">
                                <ul>
                                  <li>
                                    <span class="fact-name">Price/sqft:</span>
                                    <span class="fact-value">NRS. ${housing.rentPerSqft}</span>
                                  </li>
                                </ul>
                                <p>
                                  ${housing.others}
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
                                <input type="hidden" name="subject" value="Housing">
                                
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
				                          <input type="hidden" name="message" value="Housing">
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
                          <input type="hidden" name="message" value="Housing">
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
                        <a href="/housing"><img src="/images/brand1.png" alt="img"> Ongoing Projects</a>
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
              <a href="#"><img src="/images/ads1.png" alt="img"></a>
            </div>
          </div>
        </section>
        
        <!-- <section class="product-area product-slide">
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