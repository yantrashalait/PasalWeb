<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Models  
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<a href="/admin/addsubmodel" class="btn btn-success margin-bottom-sm"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
	
		<div class="row">
		
			<div class="col-md-12">
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Model Name</th>
							<th scope="col">Sub-Category</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="model" items="${submodel}">
						<tr>
							<td>${model.subModelId}</td>
							<td>${model.subModelName}</td>
							<td>${model.subCategory.subCategoryName}</td>
							<td>
								<a class="btn btn-sm btn-primary" href="/admin/editsubmodel/${model.subModelId}">Edit</a>
								<%-- <a class="btn btn-sm btn-danger" href="/admin/deletesubmodel/${model.subModelId}">Delete</a> --%>
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