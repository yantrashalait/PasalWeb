<%@include file="../includes/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			All Ads  
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
	<!-- <div>
	<button type="button" class="btn btn-success" style="float:right;"><a href="/admin/addbrand"><span class="glyphicon glyphicon-plus-sign">Add New</span></a></button>
	</div> -->
	

		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead style="background-color:black;color:white;">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Ads Title</th>
							<th scope="col">Ads Run Days</th>
							<th scope="col">Price</th>
							<th scope="col">Expired</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="ad" items="${ads}">
					
					
						<tr>
							<td>${ad.id}</td>
							<td>${ad.adTitle}</td>
							<td>${ad.adRunDays}</td>
							<td>${ad.price}</td>
							<td>
								<c:choose>
									<c:when test="${ad.expired eq false}">
										<label class="label label-success">Active</label>
									</c:when>
									<c:otherwise>
										<label class="label label-danger">Expired</label>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${ad.featured eq true}">
										<a class="btn btn-sm btn-success" style="min-width:100px;" href="/admin/featured/${ad.id}">Featured</a>
									</c:when>
									<c:otherwise>
										<a class="btn btn-sm btn-primary" style="min-width:100px;" href="/admin/featured/${ad.id}">Not Featured</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
					</c:forEach>
					</tbody>
					
				</table>
				<nav aria-label="Page navigation" class="text-center">
				        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
				    </nav>
			</div>
			
			<!-- ./col -->
		</div>
		<!-- Row -->
	</section>
	<!-- /.content -->
	
</div>
<script src="/js/jquery.twbsPagination.js"></script>  
<%@include file="../includes/footer.jsp"%>