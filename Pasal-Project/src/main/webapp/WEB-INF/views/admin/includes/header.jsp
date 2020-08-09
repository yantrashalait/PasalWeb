<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>PASAL Control Panel</title>
<link rel="stylesheet" href="/dist/bootstrap/css/bootstrap.min.css"/>
<!-- font awesome -->
<link rel="stylesheet" href="/css/font-awesome.min.css" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/css/admin-css.css" />
<!-- Admin LTE -->
<!-- Theme style -->
<link rel="stylesheet" href="/dist/adminlte/AdminLTE.css" />

</head>
<body>
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="/admin?page=1&ads" class="logo nav-logo-mjl">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Pasal Dashboard</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i> Admin<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="/"><i class="fa fa-share" aria-hidden="true"></i> Go to Site</a></li>
              <li><a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<div class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<!-- <li class="header">MAIN NAVIGATION</li> -->
			<li>
					<a href="/admin?page=1&ads"> 
					<span class="fa-stack fa-sm"> 
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-dashboard text-danger fa-stack-1x fa-inverse"></i>
		
					</span> 
					<span>Dashboard</span>
		
					</a>
				</li>

				<li>
					<a href="/admin/category"> 
					<span class="fa-stack fa-sm"> 
						<i class="fa fa-circle fa-stack-2x"></i>
						<i class="fa fa-map text-danger fa-stack-1x fa-inverse"></i>
		
					</span> 
					<span>Categories</span>
		
					</a>
				</li>

			<li>
				<a href="/admin/subcategory"> 
				<span class="fa-stack fa-sm"> 
					<i class="fa fa-circle fa-stack-2x"></i>
					<i class="fa fa-map text-danger fa-stack-1x fa-inverse"></i>
	
				</span> 
				<span>Sub-Categories</span>
	
				</a>
			</li>
			 
			<li>
				<a href="/admin/submodel"> 
				<span class="fa-stack fa-sm"> 
					<i class="fa fa-circle fa-stack-2x"></i>
					<i class="fa fa-home text-danger fa-stack-1x fa-inverse"></i>
	
				</span> 
				<span>Models</span>
				</a>
			</li>
			
			<li>
				<a href="/admin/ads"> 
				<span class="fa-stack fa-sm"> 
					<i class="fa fa-circle fa-stack-2x"></i>
					<i class="fa fa-home text-danger fa-stack-1x fa-inverse"></i>
	
				</span> 
				<span>Ads</span>
				</a>
			</li>

			<li>
				<a href="/admin/brands"> 
				<span class="fa-stack fa-sm"> 
					<i class="fa fa-circle fa-stack-2x"></i>
					<i class="fa fa-home text-danger fa-stack-1x fa-inverse"></i>
	
				</span> 
				<span>Brands</span>
				</a>
			</li>
			
			<li class="treeview">
	          <a href="#">
	          	<span class="fa-stack fa-sm"> 
	          		<i class="fa fa-circle fa-stack-2x"></i>
	           	 	<i class="fa fa-cubes fa-inverse fa-stack-1x" aria-hidden="true"></i>	
				</span> 
	            <span>Housing Brands</span>
	            <span class="pull-right-container">
	              <i class="fa fa-angle-left pull-right"></i>
	            </span>
	          </a>
	          <ul class="treeview-menu" style="display: none;">            
				<c:forEach var="brand" items="${brandhousing}">
					<li>
						<a href="/admin/housing/${brand.brandId}"> 
						<span class="fa-stack fa-sm"> 
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-home text-danger fa-stack-1x fa-inverse"></i>
			
						</span> 
						<span>${brand.brandName}</span>
						</a>
					</li>
				</c:forEach>
	          </ul>
	        </li>
	        
	        <li class="treeview">
	          <a href="#">
	          	<span class="fa-stack fa-sm"> 
	          		<i class="fa fa-circle fa-stack-2x"></i>
	           	 	<i class="fa fa-cubes fa-inverse fa-stack-1x" aria-hidden="true"></i>	
				</span> 
	            <span>Car Brands</span>
	            <span class="pull-right-container">
	              <i class="fa fa-angle-left pull-right"></i>
	            </span>
	          </a>
	          <ul class="treeview-menu" style="display: none;">            
				<c:forEach var="brand" items="${brandcars}">
					<li>
						<a href="/admin/car/${brand.brandId}"> 
						<span class="fa-stack fa-sm"> 
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-home text-danger fa-stack-1x fa-inverse"></i>
			
						</span> 
						<span>${brand.brandName}</span>
						</a>
					</li>
				</c:forEach>
	          </ul>
	        </li>
		</ul>
	</div>
	<!-- /.sidebar -->
</aside>
  
  
  
