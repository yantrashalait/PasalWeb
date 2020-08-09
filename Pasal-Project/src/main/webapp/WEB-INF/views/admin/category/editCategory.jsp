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
			Edit New-Category <small> Pasal Admin Panel</small>
		</h1>
		</br>
		<form:form action="/admin/editcategory/save" method="POST" commandName="category">
			<form:input type="hidden" id="categoryId"  path="categoryId"/>
			<div class="form-group">
	   			<label for="categoryName">Category-Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<form:errors path="categoryName" cssStyle="color:red"/>
		    	<form:input type="text" class="form-control" id="categoryName" placeholder="Category Name" path="categoryName" required="required"/>
		  	</div>
	  	
		  	<%-- <div class="form-group">
	   			<label for="">Select Major Category-ID</label>
	   			<form:select path="majorCategory" id="majorCategory">
	   				<c:forEach var="majorcategory" items="${majorCat}">
	   					<option value="${majorcategory.id}">${majorcategory.countryName}</option>
	   				</c:forEach>
	   			</form:select>
		  	</div> --%>

		  	<button type="submit" class="btn btn-primary">Edit</button> <a href="/admin/category" class="btn btn-default">Cancel</a>		  	
		</form:form>
	</section>
</div>
<%@include file="../includes/footer.jsp"%>