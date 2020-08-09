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
	<button type="button" class="btn btn-success" style="float:right;"><a href="/admin/addcar"><span class="glyphicon glyphicon-plus-sign">Add New</span></a></button>
	</div>
	

		<div class="row">
		
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Type</th>
							<th scope="col">Engine</th>
							<th scope="col">Make Year</th>
							<th scope="col">Action</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="car" items="${carByBrand}">
						<tr>
							<td>${car.carId}</td>
							<td>${car.carName}</td>
							<td>${car.price}</td>
							<td>${car.type}</td>
							<td>${car.engine}</td>
							<td>${car.makeYear}</td>
							<td>
								<button class="btn-primary"><a href="/admin/editcar/${car.carId}">Edit</a></button>
								<button class="btn-danger"><a href="/admin/deletecar/${car.carId}">Delete</a></button>
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