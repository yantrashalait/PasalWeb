<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
                    <div class="expandablebox">
                      <h3 class="featured-title">Hello <span style="color:#f28541;">   ${customer.name}</span>. Welcome to your member area!</h3>
                         
                          <div class="container row">
                          	<p>From here, you can post new ad, manage your existing ads, pictures and contact information.</p>

							<p>Please choose your action from the menu on the left hand side.</p>

							<p>If you require any help, please contact us at webmaster@hamrobazar.com.</p>
							
							<table class="charttable">
		                        <tr>
		                          <th><img src="images/chart2.gif"></th>
		                          <th colspan="2">Account Stats:</th>
		                          <th></th>
		                        </tr>
		                        <tr>
		                          <td></td>
		                          <td>Buyer's Speak New Messages</td>
		                          <td>${countCustomerBasedQuestions}</td>
		                        </tr>
		                        <tr>
		                          <td></td>
		                          <td>Number of ads</td>
		                          <td>${countByCustomerAds}</td>
		                        </tr>
		                        <tr>
		                          <td></td>
		                          <td>People who have contacted you:</td>
		                          <td>${countAskedByUser}</td>
		                        </tr>
		                        <tr>
		                          <td></td>
		                          <td>Number of ad marked sold:</td>
		                          <td>0</td>
		                        </tr>
		                        <tr>
		                          <td></td>
		                          <td>Number of ad views:</td>
		                          <td>${totalViewCount}</td>
		                        </tr>
		                      </table>
                          </div> <!--  row end -->
                          
                     </div>
    <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>