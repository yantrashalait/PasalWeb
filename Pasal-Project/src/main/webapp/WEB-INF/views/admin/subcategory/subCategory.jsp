<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Sub Categories 
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
	<a href="/admin/addsubcategory" class="btn btn-success margin-bottom-sm"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
		<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead style="background-color:black;color:white;">
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Sub-Category Name</th>
								<th scope="col">Category</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="subcategory" items="${subcategories}">
							<tr>
								<td>${subcategory.subCategoryId}</td>
								<td>${subcategory.subCategoryName}</td>
								<td>${subcategory.category.categoryName}</td>
								<td>
									<a class="btn-primary btn btn-sm" href="/admin/editsubcategory/${subcategory.subCategoryId}">Edit</a>
									<%-- <a class="btn-danger btn btn-sm" href="/admin/deletesubcategory/${subcategory.subCategoryId}">Delete</a> --%>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>		
			<!-- ./col -->
		</div>
		<!-- Row -->
	</section>
	<!-- /.content -->
	
</div>
<%@include file="../includes/footer.jsp"%>