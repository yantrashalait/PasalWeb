<%@include file="../includes/header.jsp"%>
	<%@include file="../includes/navUtils.jsp"%>
      
	    <div class="expandablebox">
	      <h3 class="featured-title">Hello <span style="color:#f28541;">   ${customer.name}</span>. Your Posted Ads!</h3>
	      	
	      	<h4><b>Speak Message : </b> Posted on your Ads</h4>
	         
	          <table class="table table-hover">
	            		<tr>
	            			<th>Ad-Title</th>
	            			<th>Question</th>
	            			<th>Asked On</th>
	            			<th>Asked By</th>
	            			<th>Action</th>
	            		</tr>
	            		
	            		<c:forEach var="question" items="${customerBasedQuestions}">
		            		
	            			<tr>
	             			<td>
	             				<b><a href="/detail/${question.mainAds.id}">${question.mainAds.adTitle }</a></b>
	            				</td>
	            				
	             			<td>${question.questionComment}</td>
	             			<td>${question.askedOn}</td>
	             			
	             			<td>${question.askedBy.name}</td>
	             			<td>
		             			<c:choose>
		             				<c:when test="${question.reply.replied eq true}">
			             				<span class="label label-success" style="color:white;padding:4px;"><b>Replied</b></span>
			             			</c:when>
			             			<c:otherwise>
			             				<a href="" style="color:white;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="${question.questionId}">Reply</a>
			             			</c:otherwise>
		             			</c:choose>
	                  		</td>
	             		</tr>
	             		
	             		<!--  Question Form !! --> 
							<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							  <c:choose>
							    <c:when test="${customer.name ne null}">
							    		<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Reply for Buyer</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      
								      <div class="modal-body">
								      	
								        <form:form class="secondaryform" action="/member/saveReply" method="POST" modelAttribute="reply">
								        		
								        		<form:input type="hidden" id="question" path="question"/>
								        		
									          <div class="form-group">
									            <label for="replyComment" class="col-form-label">Reply:</label> (Max 1000 characters)
									            <form:textarea class="form-control" id="replyComment" path="replyComment" style="height:120px;"/>
									          </div>
									          
									          <div class="modal-body">
									          	<p style="color:red;">WARNING:
									          	<ul style="color:red;list-style-type:square;">
									          		<li>Do not use any obscene/abusive words which may hurt the feelings of other users. Such posts will be deleted immediately, and your account will be banned.</li>
									          		<li>Only post comment regarding this ad. Do not advertise about other ads, product or website.</li>
									          	</ul>
												</p>
									          </div>
									          
									          <div class="modal-footer">
										        <button type="button" class="btn mjl-btn-default" data-dismiss="modal">Close</button>
										        <button type="submit" class="btn btn-primary">Send message</button>
										      </div>
									          
								        </form:form>
								      </div>  
							    </c:when>
							    <c:otherwise>
							    		<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">First, You need to login</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<h3>Login Here: <button class="btn btn-success btn-sm"><a href="/login" style="color:#fff;">Login</a></button></h3>
								      	<h5>if not logged in yet, <button class="btn btn-primary btn-sm"><a href="/register" style="color:#fff;">Register</a></button></h5>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn mjl-btn-default" data-dismiss="modal">Close</button>
								      </div>
							    </c:otherwise>
							  </c:choose>      
						      </div>
						  </div>
						</div>
					     <!-- End Of Question Form !! --> 
	             		
	            		</c:forEach>
	            		<script>
	            		$('#exampleModal').on('show.bs.modal', function (event) {
	            			  var button = $(event.relatedTarget) // Button that triggered the modal
	            			  var recipient = button.data('whatever') // Extract info from data-* attributes
	            			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	            			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	            			  var modal = $(this)
	            			  
	            			  modal.find('.modal-body input').val(recipient)
	            			})
	            		</script>
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