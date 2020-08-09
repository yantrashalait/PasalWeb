<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navUtils.jsp"%>

      
                    <div class="expandablebox">
                      <h3 class="featured-title">Picture Upload:</h3>
                      <p>Select and upload picture for your ad - <b>${mainads.adTitle}</b></p>
                         
	                          <c:choose>
	                          	<c:when test="${fn:length(pictures) gt 4}">
	                          		<p class="text-danger">5 Images has already been Uploaded***.</p> 
	                          		<p class="text-danger">No More than this can be Uploaded***.</p>
	                          	</c:when>
	                          	<c:otherwise>
	                          		<p class="text-danger"><b>Image Size Maximum 7 MB. Maximum of 5 Images can be Uploaded***</b></p> 
	                          		<form:form id="mjlPicSubmit" action="/savePicture/${mainads.id}" method="POST" commandName="picture" enctype="multipart/form-data">
									  		<div class="form-group">
									    		<form:input path="pictureFile" type="file" id="pictureFileMjl" class="form:input-large" accept='image/*' required="required" style="padding-top: 6px;"/>
										  	</div>
										  	<!-- <button type="submit" class="btn btn-info" style="padding: 5px 21px; height: 40px;border-radius: 5px;">Upload</button> -->	
								  	</form:form>
	                          	</c:otherwise>
	                          </c:choose>
                          
						  	
							  	
					  		 <c:if test="${not empty pictures}">
				  				<div class="expandablebox" style="margin:10px 0">
					  			<h3 class="featured-title">Uploaded Images:</h3>
					  			<c:forEach var="picture" items="${pictures}">
					  				<div class="up-img-wrapper" style="position:relative">
					  					<img src="/pasal/images/mainads/${picture.pictureName}" style=" height:150px; width:200px; "/>
						  				<a href="/deletePicture/m=${mainads.id}/p=${picture.id}" class="bg-danger"><span class="badge" style="background-color: red;border-radius: 50%;color: #ffff;right: 0;top: -14px;font-size: 14px;position: absolute;padding: 7px 10px;">x</span></a>
					  				</div>
					  			</c:forEach>
					  			</div>
					  		</c:if>
							  
							 <hr/> 		
	                         <a href="/detail/${mainads.id}"><button type="button" class="btn btn-success">Finish Ad</button></a>
                      </div>
                     </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      <script>
      	// Form auto submit
      	$('#pictureFileMjl').on("change", function(){
	  		var fullPath = document.getElementById('pictureFileMjl').value;
	  		// If new file is uploaded
			if (fullPath) {
				$('#mjlPicSubmit').submit();
			}
	  	});
      </script>
      <%@include file="../includes/footer.jsp"%>