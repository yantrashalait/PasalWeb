<%@include file="../../includes/header.jsp"%>
<div class="content-wrapper">
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span class="glyphicon glyphicon-remove"></span> Duplicate Brand_Name !!
				</div>
			</c:if>
	<section class="content-header">
		<h1>
			Edit New-Brand <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/editbrand/save" method="POST" commandName="brand">
			<form:input type="hidden" id="brandId"  path="brandId"/>
				<div class="form-group">
		   			<label for="brandName">Brand-Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="brandName" cssStyle="color:red"/>
			    	<form:input type="text" class="form-control" id="brandName" placeholder="Brand Name" path="brandName" required="required"/>
			  	</div>
			  	<div class="form-group">
			  	
               <label>Type <span style="color:red;"> * </span>:</label><form:errors path="type" cssStyle="color:red"/>
	               <div class="right">
	                 <form:select class="halfwidth" type="text" id="type" path="type" required="required">
	                   <option>${brand.type}</option>
	                   <option value="housing">Housing</option>
	                   <option value="cars">Cars</option>
	                 </form:select>
	               </div>
	             </div>
			  	
			  	<div class="form-group">
		   			<label for="facebookLink">Facebook-Link</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="facebookLink" cssStyle="color:red"/>
			    	<form:input type="text" class="form-control" id="facebookLink" placeholder="Facebook Link" path="facebookLink"/>
			  	</div>
			  	
			  	<div class="form-group">
		   			<label for="instagramLink">Instagram-Link</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="instagramLink" cssStyle="color:red"/>
			    	<form:input type="text" class="form-control" id="instagramLink" placeholder="Instagram Link" path="instagramLink"/>
			  	</div>
			  	
			  	<div class="form-group">
		   			<label for="twitterLink">Twitter-Link</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="twitterLink" cssStyle="color:red"/>
			    	<form:input type="text" class="form-control" id="twitterLink" placeholder="Twitter Link" path="twitterLink"/>
			  	</div>
			  	
			  	<div class="form-group">
		   			<label for="googlePlusLink">Google Plus-Link</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="googlePlusLink" cssStyle="color:red"/>
			    	<form:input type="text" class="form-control" id="googlePlusLink" placeholder="Google Plus Link" path="googlePlusLink"/>
			  	</div>
	  	
		  	<button type="submit" class="btn btn-primary">Edit</button> <a href="/admin/brands" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../../includes/footer.jsp"%>