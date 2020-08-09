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
	      <h3 class="featured-title">Hello <span style="color:#f28541;">${customer.name}</span>, Enter the token received via Phone,</h3>
	       	
	       	
	       	
	       	<form id="submitForm">
	       		<label>Enter Token:</label>
	       		<input type="text" name="otp" id="otp" required="required"/>
	       		
	       		<input type="hidden" name="id" value="${customer.customerId}"/>
	       		<input type="hidden" name="mobilenumber" value="${customer.phone}"/>
	       		
	       		<input type="submit" class="btn big-login" style="background-color:#0b3fb0;" value="Verify">
	       	</form>
	          
	     </div>
	     <div id="result"></div>
	     
	     <!-- Change URL : 
	     		For Localhost: 'http://localhost:8080/mobilenumbers/'+id+"/"+phone+"/otp"
	     		For Server: 'http://pasal-beta.vortexnepal.com/mobilenumbers/'+id+"/"+phone+"/otp"
	     
	     -->
	     
	     <script>
	     $("#submitForm").submit(function(event){
	    	 		
	            event.preventDefault();
	            var form = $(this);
	            
	            var otpVal = form.find('input[name="otp"]').val();
	            
	            var phone = form.find('input[name="mobilenumber"]').val();
	            var id = form.find('input[name="id"]').val();
	            
	            var url = 'http://localhost:8080/mobilenumbers/'+id+"/"+phone+"/otp";
	            var jsonString = JSON.stringify({otp: otpVal});
	            
	            $.ajax({
	                type : 'PUT',
	                url : url,
	                contentType: 'application/json',
	                data : jsonString,
	                success : function(data, status, xhr){
	                   $("#result").html(data);
	                   window.location.href = "/member/verifypage?success_"+data;
	                },
	                error: function(data, textStatus, xhr){
	                		alert(data.responseText);
	                		window.location.href = "/member/verifypage?error_"+data.responseText;
	                }
	            });
	        });
	     </script>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>