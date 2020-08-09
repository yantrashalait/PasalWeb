<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
      
	    <div class="expandablebox">
	    <c:if test="${param.errorThisAdBelongsToYou!=null}">
			<div class="alert alert-danger alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
				</button>
				<b><i class="fa fa-check" aria-hidden="true"></i> This Ad Belongs to you. So not added to Wishlist</b>
			</div>
		</c:if>
	      <h3 class="featured-title">Hello <span style="color:#f28541;">   ${customer.name}</span>. Your Posted Ads!</h3>
	         
	          <table class="table table-hover">
	            		<tr>
	            			<th>Ad-Title</th>
	            			<th>Ad-Post Date</th>
	            			<th>Ad-Expired Date</th>
	            			<th>Price</th>
	            			<th>Expired</th>
	            			<th>Action</th>
	            		</tr>
	            		
	            		<h5 class="text-success"><b><i class="fa fa-check" aria-hidden="true"></i> Active Ads:</b></h5>
	            		<c:forEach var="list" items="${mainAds}">
		            		<c:if test="${list.expired eq false}">
	            			<tr>
	             			<td>
	             				<b><a href="/detail/${list.id}">${list.adTitle }</a></b>
	             				<p>Views: ${list.viewCount }</p>
	            				</td>
	            				
	             			<td>${list.addedDate}</td>
	             			<td>${list.expiryDate}</td>
	             			
	             			<td>${list.price}</td>
	             			<td>
	             				<span class="label label-success" style="color:white;padding:4px;"><b>Valid</b></span>	
	             			</td>
	             			<td>
	                  			<a href="/member/editAds/${list.id}" class="btn btn-info btn-sm btn-white"><span class="fa fa-edit"></span></a>
								<a href="/member/deleteAds/${list.id}" class="btn btn-danger btn-sm btn-white" onclick="return confirm('Are you sure to delete?')"><span class="fa fa-trash"></span></a>
	                  		</td>
	            			
	             		</tr>
		            		</c:if>
	             		
	            		</c:forEach>
	            		
	           </table>
	           <hr style="margin-bottom:30px;" />
	           <table class="table table-hover">
	           		<tr>
	            			<th>Ad-Title</th>
	            			<th>Ad-Post Date</th>
	            			<th>Ad-Expired Date</th>
	            			<th>Price</th>
	            			<th>Renew</th>
	            			<th>Action</th>
	            		</tr>
	           		<h5 class="text-danger"><b><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Expired Ads:</b></h5>
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
             					<!-- <span class="label" style="color:white;padding:4px;background-color:red;"><b>Expired</b></span> -->
             					<a href="/member/renew/${list.id}"><span class="label" style="color:white;padding:4px;background-color:#00a65a;"><b>Renew</b></span></a>
	             			</td>
	             			<td>
	                  			<a href="/member/editAds/${list.id}" class="btn btn-info btn-sm btn-white"><span class="fa fa-edit"></span></a>
								<a href="/member/deleteAds/${list.id}" class="btn btn-danger btn-sm btn-white" onclick="return confirm('Are you sure to delete?')"><span class="fa fa-trash"></span></a>
	                  		</td>
	            			
	             		</tr>
		            		</c:if>
	             		
	            		</c:forEach>
	           </table> 
	     </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>