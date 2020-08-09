<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span class="glyphicon glyphicon-remove"></span> Error Message Needed !!
				</div>
			</c:if>
	<section class="content-header">
		<h1>
			Edit New-Sub-Model <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/editsubmodel/save" method="POST" commandName="submodel">
			<form:input type="hidden" id="subModelId"  path="subModelId"/>
			<div class="form-group">
	   			<label for="subModelName">Sub-Model Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="subModelName" cssStyle="color:red"/>
		    	<form:input type="text" class="form-control" id="subModelName" placeholder="Sub-Model Name" path="subModelName" required="required"/>
		  	</div>
	  	
		  	<%-- <div class="form-group">
	   			<label for="">Select Category</label>
	   			<form:select path="category" id="category">
	   				<c:forEach var="category" items="${categories}">
	   					<option value="${category.categoryId}">${category.categoryName}</option>
	   				</c:forEach>
	   			</form:select>
		  	</div>  --%>
		  	
		  	<%-- <div class="form-group">
	   			<label for="">Select Category</label>
	   				<form:select path="category" id="category">
	   					<c:forEach var="category" items="${categories}">
	   						<c:if test="${category.majorCategory.id == mj.id}">
	   							<form:option value="${mj.id}">
	   								${mj.countryName}
	   							</form:option>
	   						</c:if>
	   						
	   					</c:forEach>
	   				</form:select>
		  	</div> --%>
		  	
		  	<div class="form-group">
	   			<label for="">Select Sub-Category</label>
	   				<form:select path="subCategory" id="subCategory">
	   				<form:option value="${submodel.subCategory.subCategoryId}" label="${submodel.subCategory.subCategoryName}" />
	   					<c:forEach var="subcategory" items="${subcategories}">
	   						<form:option value="${subcategory.subCategoryId}" label="${subcategory.subCategoryName}"/>
	   					</c:forEach>
	   				</form:select>
		  	</div>

		  	<button type="submit" class="btn btn-primary">Edit</button> <a href="/admin/submodel" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../includes/footer.jsp"%>