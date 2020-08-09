<%@ include file="includes/header.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="container-fluid">
		<h3>Dashboard</h3>
		<div class="row">
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	        <a href="/admin?page=1&ads">
	          <div class="info-box" style="background-color:#0818ce;">
				<span style="color:#fff;">${totalAds}</span>
				<p style="font-size:18px;color:#fff;"> TOTAL ADS</p>
	          </div>
	          </a>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	        		<a href="/admin?page=1&users">
		          <div class="info-box" style="background-color:#d8500d;">
					<span style="color:#fff;">${totalUsers}</span>
					<p style="font-size:18px;color:#fff;"> TOTAL USERS</p>
		          </div>
	          	</a>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	
	        <!-- fix for small devices only -->
	        <div class="clearfix visible-sm-block"></div>
		
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	        		<a href="/admin?page=1&activeads">
	        			<div class="info-box" style="background-color:#2f9146;">
						<span style="color:#fff;">${totalActiveAds}</span>
						<p style="font-size:18px;color:#fff;"> TOTAL ACTIVE ADS</p>
	          		</div>
	          	</a>
	          <!-- /.info-box -->
	        </div>
	        
	        <!-- /.col -->
	        <!-- /.col -->
	        <!-- /.col -->
	        <div class="col-md-3 col-sm-6 col-xs-12">
	        <a href="/admin?page=1&expiredads">
	          <div class="info-box" style="background-color:#d11d1d;">
				<span style="color:#fff;">${totalExpiredAds}</span>
				<p style="font-size:18px;color:#fff;"> TOTAL EXPIRED ADS</p>
	          </div>
	          </a>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	        <!-- /.col -->
      </div><!-- Stat box -->      
   </div>
	<!-- Container fl -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			All Details:
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				
					<c:if test="${param.users != null}">
						<div id="users">
							<table class="table">
							<thead style="background-color:black;color:white;">
								<tr>
									<th scope="col">Customer Name</th>
									<th scope="col">Customer Email</th>
									<th scope="col">Contact No</th>
									<th scope="col">Location</th>
									<th scope="col">Added Date</th>
								</tr>
							</thead>
							
							<tbody>
							<c:forEach var="customer" items="${customers}">
							
							
								<tr>
									<td>${customer.name}</td>
									<td>${customer.user.email}</td>
									<td>${customer.phone}</td>
									<td>${customer.cityName},${customer.areaLocation},${customer.streetName}</td>
									<td>${customer.addedDate}</td>
									
									<%-- <td>
										<c:choose>
											<c:when test="${ad.featured eq true}">
												<a class="btn btn-sm btn-success" href="/admin/featured/${ad.id}">Featured</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-sm btn-default" href="/admin/featured/${ad.id}">Featured</a>
											</c:otherwise>
										</c:choose>
									</td> --%>
								</tr>
								
							</c:forEach>
							</tbody>
							
						</table>
						</div>
						<nav aria-label="Page navigation" class="text-center">
				        <ul class="pagination" id="pagination" data-total-pages="${totalPages}"></ul>
				    </nav>
					</c:if>
					<c:if test="${param.ads != null}">
						<div id="ads">
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
						</div>
						<nav aria-label="Page navigation" class="text-center">
				        <ul class="pagination" id="pagination" data-total-pages="${totalPagesAds}"></ul>
				    </nav>
					</c:if>
				<c:if test="${param.activeads != null}">
						<div id="activeads">
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
								<c:forEach var="ad" items="${activeads}">
								
								
									<tr>
										<td>${ad.id}</td>
										<td>${ad.adTitle}</td>
										<td>${ad.adRunDays}</td>
										<td>${ad.price}</td>
										<td>${ad.expired}</td>
										<td>
											<c:choose>
												<c:when test="${ad.featured eq true}">
													<a class="btn btn-sm btn-success" href="/admin/featured/${ad.id}">Featured</a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-sm btn-default" href="/admin/featured/${ad.id}">Featured</a>
												</c:otherwise>
											</c:choose>
											
											
										</td>
									</tr>
									
								</c:forEach>
								</tbody>
								
							</table>
						</div>
						<nav aria-label="Page navigation" class="text-center">
				        <ul class="pagination" id="pagination" data-total-pages="${totalPagesActiveUsers}"></ul>
				    </nav>
					</c:if>
					<c:if test="${param.expiredads != null}">
						<div id="expiredads">
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
								<c:forEach var="ad" items="${expiredads}">
								
								
									<tr>
										<td>${ad.id}</td>
										<td>${ad.adTitle}</td>
										<td>${ad.adRunDays}</td>
										<td>${ad.price}</td>
										<td>${ad.expired}</td>
										<td>
											<c:choose>
												<c:when test="${ad.featured eq true}">
													<a class="btn btn-sm btn-success" href="/admin/featured/${ad.id}">Featured</a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-sm btn-default" href="/admin/featured/${ad.id}">Featured</a>
												</c:otherwise>
											</c:choose>
											
											
										</td>
									</tr>
									
								</c:forEach>
								</tbody>
								
							</table>
						</div>
						<nav aria-label="Page navigation" class="text-center">
				        <ul class="pagination" id="pagination" data-total-pages="${totalPagesExpiredUsers}"></ul>
				    </nav>
					</c:if>
			</div>
			
			<!-- ./col -->
		</div>
		<!-- Row -->
	</section>
	<!-- /.content -->
	
</div>
<script src="/js/jquery.twbsPagination.js"></script>
<%@ include file="includes/footer.jsp" %>
