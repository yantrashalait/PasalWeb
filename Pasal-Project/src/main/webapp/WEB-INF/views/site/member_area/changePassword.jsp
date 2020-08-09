<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
	
			<c:if test="${param.success!=null}">
				<div class="alert alert-success alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true" style="color:#fff">×</span>
					</button>
					<b><i class="fa fa-check" aria-hidden="true" style="color:#fff"></i> <span style="color:#fff">Password Successfully Updated</span></b>
				</div>
			</c:if>	
			
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">×</span>
					</button>
					<b><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Incorrect Previous password.</b>
				</div>
			</c:if>	
			
                    <div class="expandablebox">
                      <h3 class="featured-title">Hello <span style="color:#f28541">${customer.name}</span>, change your password below.</h3>
                         
                         <div class="col-md-9">
						<form id="changePassForm" method="POST" action="/member/changepassword/save">
					    	<div class="form-group">
					    		<div class="form-group">
								  <label for="prevPass">Previous Password*</label>
							      <input type="password" class="form-control" id="prevPass" name="prevPass" placeholder="Previous Password" required="required"/>
								</div>
								<hr/>
								<div class="form-group">
								  <label for="newPass">New Password*</label>
							      <input type="password" class="form-control" id="newPass" name="password" placeholder="New Password" required="required"/>
							      <span id="passCountErr" class="text-danger"></span>
								</div>
								<div class="form-group">
								  <label for="confirmPass">Confirm New Password*</label>
							      <input type="password" class="form-control" id="confirmPass" placeholder="Confirm New Password" required="required"/>
								</div>
								<span id="regPassErr" class="text-danger"></span>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							    <hr/>
							    <button type="submit" class="btn btn-success" style="width:100%;height:42px;">UPDATE</button>
							    
							</div>
						</form>
					</div>
                          <script>
								$('#changePassForm').submit(function(){
									let passwordOne = $('#newPass').val();
									let passwordTwo = $('#confirmPass').val();		
									if(passwordOne != passwordTwo){
										$('#regPassErr').html("<b>Password didn't match.</b>");
										return false;
									}else{
										if(passwordOne.length<5){
											$('#passCountErr').html("<b>Your password must be at least 5 character or longer</b>");
											$('#regPassErr').html("");
											return false;
										}
									}
									return true;
								});
						</script>
                     </div>
     <%@include file="../includes/navUtilsFooter.jsp"%>
<%@include file="../includes/footer.jsp"%>