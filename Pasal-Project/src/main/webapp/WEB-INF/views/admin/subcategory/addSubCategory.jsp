<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
			<c:if test="${param.error!=null}">
				<div class="alert alert-danger alert-dismissible fade in" role="alert">
					<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span class="glyphicon glyphicon-remove"></span> Duplicate Category-Code_Name !!
				</div>
			</c:if>
	<section class="content-header">
		<h1>
			Add New-Category <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/addsubcategory/save" method="POST" commandName="subcategory">
			
			<div class="form-group">
	   			<label for="subCategoryName">Sub-Category Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="subCategoryName" cssStyle="color:red"/>
		    	<form:input type="text" class="form-control" id="subCategoryName" placeholder="Sub-Category Name" path="subCategoryName" required="required"/>
		  	</div>
	  	
		  	<div class="form-group">
	   			<label for="">Select Category</label>
	   			<form:select path="category" id="category">
	   				<c:forEach var="cat" items="${categories}" varStatus="stat">
	   					<option value="${cat.categoryId}">${cat.categoryName}</option>
	   				</c:forEach>
	   			</form:select>
		  	</div>

		  	<button type="submit" class="btn btn-primary">Add</button> <a href="/admin/subcategory" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../includes/footer.jsp"%>