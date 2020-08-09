<%@include file="../../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Housings  <small> Pasal Dashboard </small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
	<div>
	<button type="button" class="btn btn-success" style="float:right;"><a href="/admin/addhousing"><span class="glyphicon glyphicon-plus-sign">Add New</span></a></button>
	</div>
	

		<div class="row">
		
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">Area</th>
							<th scope="col">Purpose</th>
							<th scope="col">Price</th>
							<th scope="col">Type</th>
							<th scope="col">Action</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="housing" items="${housings}">
						<tr>
							<td>${housing.housingId}</td>
							<td>${housing.housingName}</td>
							<td>${housing.area}</td>
							<td>${housing.purpose}</td>
							<td>${housing.price}</td>
							<td>${housing.type}</td>
							<td>
								<button class="btn-primary"><a href="/admin/edithousing/${housing.housingId}">Edit</a></button>
								<button class="btn-danger"><a href="/admin/deletehousing/${housing.housingId}">Delete</a></button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			
		
			<!-- ./col -->
		</div>
		<!-- Row -->
	</section>
	<!-- /.content -->
	
</div>
<%@include file="../../includes/footer.jsp"%>