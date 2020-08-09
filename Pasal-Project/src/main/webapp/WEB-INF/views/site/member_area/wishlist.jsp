<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
	<!-- Alert Popup -->
    		<c:if test="${param.errorWishlistAlreadyExist!=null}">
			<div class="alert alert-danger alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
				</button>
				<b><i class="fa fa-check" aria-hidden="true"></i> This particular Ad is already added to your Wishlist</b>
			</div>
		</c:if>
		
	    <div class="expandablebox">
	      <h3 class="featured-title">Hello <span style="color:#f28541;">   ${wishlist[0].customer.name}</span>. Your Wish-Listed Ads!</h3>
	       
	          <table class="table table-hover">
	            		<tr>
	            			<th>Ad-Title</th>
	            			<th>Ad-Post Date</th>
	            			<th>Ad-Expired Date</th>
	            			<th>Price</th>
	            			<th>Expired</th>
	            			<th>Action</th>
	            		</tr>
	            		
	            		<h5><b>Wished Ads:</b></h5>
	            		<c:forEach var="list" items="${wishlist}">
		            		
	            			<tr>
	             			<td>
	             				<b><a href="/detail/${list.mainads.id}">${list.mainads.adTitle }</a></b>
	             				<p>Views: ${list.mainads.viewCount }</p>
	            				</td>
	            				
	             			<td>${list.mainads.addedDate}</td>
	             			<td>${list.mainads.expiryDate}</td>
	             			
	             			<td>${list.mainads.price}</td>
	             			<c:choose>
	             				<c:when test="${list.mainads.expired eq false}">
		             				<td>
		             				<span class="label label-success" style="color:white;padding:4px;"><b>Valid</b></span>	
		             				</td>
	             				</c:when>
	             				<c:otherwise>
	             					<td>
	             						<span class="label" style="color:white;padding:4px;background-color:red;"><b>Expired</b></span>
	             					</td>
	             				</c:otherwise>
	             			</c:choose>
	             			
	             			<td>
								<a href="/member/deleteWishlist/${list.id}" class="btn btn-danger btn-sm btn-white" onclick="return confirm('Are you sure to delete?')"><span class="fa fa-trash"></span></a>
	                  		</td>
	            			
	             		</tr>
		            		
	             		
	            		</c:forEach>
	            		
	           </table>
	           <%-- <table class="table table-hover">
	           		<h2 style="color:#f28541;">Expired Ads:</h2>
	            		<c:forEach var="list" items="${mainAds}">
		            		<c:if test="${list.expired eq true}">
		            			<tr>
	             			<td>
	             				<b>${list.adTitle }</b>
	             				<p>Views: ${list.viewCount }</p>
	            				</td>
	            				
	             			<td>${list.addedDate}</td>
	             			<td>${list.expiryDate}</td>
	             			
	             			<td>${list.price}</td>
	             			<td>
             					<span class="label" style="color:white;padding:4px;background-color:red;"><b>Expired</b></span>
             					<a href="/member/renew/${list.id}"><span class="label" style="color:white;padding:4px;background-color:blue;"><b>Renew</b></span></a>
	             			</td>
	             			<td>
	                  			<a href="/member/editAds/${list.id}" class="btn btn-info btn-primary btn-sm"><span class="fa fa-edit"></span></a>
								<a href="/member/deleteAds/${list.id}" class="btn btn-info btn-danger btn-sm" onclick="return confirm('Are you sure to delete?')"><span class="fa fa-trash"></span></a>
	                  		</td>
	            			
	             		</tr>
		            		</c:if>
	             		
	            		</c:forEach>
	           </table>  --%>
	     </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>