<%@include file="../../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Brands 
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<a href="/admin/addbrand" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Brand Name</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					
					<tbody>
					<h3>Type: Housing</h3>
					<c:forEach var="brand" items="${brandhousing}">
						<tr>
							<td>${brand.brandId}</td>
							<td>${brand.brandName}</td>
							<td>
								<a href="/admin/editbrand/${brand.brandId}" class="btn btn-sm btn-success">Edit</a>
								<a href="/admin/deletebrand/${brand.brandId}" class="btn btn-sm btn-danger">Delete</a>
								<a href="/admin/activatebrand/${brand.brandId}" class="btn btn-sm btn-primary">Activate</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
						
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Brand Name</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
					<h3>Type: Cars</h3>
					<c:forEach var="brand" items="${brandcars}">
						<tr>
							<td>${brand.brandId}</td>
							<td>${brand.brandName}</td>
							<td>
								<a href="/admin/editbrand/${brand.brandId}" class="btn btn-sm btn-success">Edit</a>
								<a href="/admin/deletebrand/${brand.brandId}" class="btn btn-sm btn-danger">Delete</a>
								<a href="/admin/activatebrand/${brand.brandId}" class="btn btn-sm btn-primary">Activate</a>
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
<%@include file="../../includes/footer.jsp"%>