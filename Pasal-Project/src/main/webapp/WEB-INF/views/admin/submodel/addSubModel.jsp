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
			Add New-Model <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/addsubmodel/save" method="POST" commandName="submodel">
			
			<div class="form-group">
	   			<label for="subModelName">Sub-Category Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="subModelName" cssStyle="color:red"/>
		    	<form:input type="text" class="form-control" id="subModelName" placeholder="Sub-Model Name" path="subModelName" required="required"/>
		  	</div>
	  	
		  	<div class="form-group">
	   			<label for="">Select Sub-Category</label>
	   			<form:select path="subCategory" id="subCategory">
	   				<c:forEach var="subcat" items="${subcategories}" varStatus="stat">
	   					<option value="${subcat.subCategoryId}">${subcat.subCategoryName}</option>
	   				</c:forEach>
	   			</form:select>
		  	</div>

		  	<button type="submit" class="btn btn-primary">Add</button> <a href="/admin/submodel" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../includes/footer.jsp"%>