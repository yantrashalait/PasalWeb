<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Categories
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<a href="/admin/addcategory" class="btn btn-success margin-bottom-sm"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Category-Name</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="category" items="${categories}">
						<tr>
							<td>${category.categoryId}</td>
							<td>${category.categoryName}</td>
							<td>
								<a class="btn btn-sm btn-primary" href="/admin/editcategory/${category.categoryId}">Edit</a>
								<%-- <a class="btn btn-sm btn-danger" href="/admin/deletecategory/${category.categoryId}" onclick="return confirm('Are you sure to delete?')">Delete</a> --%>
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