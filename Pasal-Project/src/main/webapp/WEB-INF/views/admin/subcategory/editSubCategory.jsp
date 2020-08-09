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
			Edit New-SubCategory <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/editsubcategory/save" method="POST" commandName="subcategory">
			<form:input type="hidden" id="subCategoryId"  path="subCategoryId"/>
			<div class="form-group">
	   			<label for="subCategoryName">Sub-Category Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="subCategoryName" cssStyle="color:red"/>
		    	<form:input type="text" class="form-control" id="subCategoryName" placeholder="Sub-Category Name" path="subCategoryName" required="required"/>
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
	   			<label for="">Select Category</label>
	   				<form:select path="category" id="category">
	   				<form:option value="${subcategory.category.categoryId}" label="${subcategory.category.categoryName}" />
	   					<c:forEach var="category" items="${categories}">
	   						<form:option value="${category.categoryId}" label="${category.categoryName}" />
	   					</c:forEach>
	   				</form:select>
		  	</div>

		  	<button type="submit" class="btn btn-primary">Edit</button> <a href="/admin/subcategory" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../includes/footer.jsp"%>