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
	      <h3 class="featured-title">Hello <span style="color:#f28541;">${customer.name}</span>, Your current Phone-Number is,</h3>
	       	
	       	<h1><a class="btn" style="background-color: #60656d;color: #FFF;border-radius: 7px;border-width: 2px;font-size: 10px;font-style: normal;font-weight: 600;padding: 5px 10px;">
			 Nepal (+977)</a> | ${customer.phone}</h1>
	       	<c:choose>
	       		<c:when test="${customer.verified==true}">
	       			<a class="btn" style="background-color: #108c27;color: #FFF;border-radius: 7px;border-width: 2px;font-size: 10px;font-style: normal;font-weight: 600;padding: 5px 10px;">
			 Verified</a>
	       		</c:when>
	       		<c:otherwise>
	       			<form action="/member/verifypage/${customer.phone}" method="POST">
			       		<input class="btn big-login" style="background-color:#0b3fb0;" type="submit" value="Verify this Number">
			       	</form>
	       		</c:otherwise>
	       	</c:choose>

	     </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>