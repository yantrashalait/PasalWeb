<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Pasal Online</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- font-awesome -->
    <link rel="stylesheet" type="text/css" href="/css/fontawesome-all.min.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" type="text/css" href="/css/owl.carousel.min.css">
    <!-- image-zoomer -->
    <link rel="stylesheet" type="text/css" href="/css/xzoom.css">
    <link rel="stylesheet" type="text/css" href="/css/magnific-popup.css">
    <!-- Css link -->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <!-- Responsive link -->
    <link rel="stylesheet" type="text/css" href="/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery.fancybox.min.css">
    
    <link rel="stylesheet" type="text/css" href="/css/login-register.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <link href="https://www.authy.com/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">
	<script src="https://www.authy.com/form.authy.min.js" type="text/javascript"></script>
  </head>
  <body>
	<div id="fpage">
    <div id="page" class="hfeed site">
      <header id="masthead" class="site-header">
        <div class="top-header">
          <div class="container">
            <div class="site-branding">
               <h1 class="site-title">
                 <a href="/"><img src="/images/site-logo.png" alt="site_logo"></a>
               </h1>
            </div>
            
            <c:if test="${pageContext.request.userPrincipal.name eq null}">
            
            		<div class="float-right hgroup-right">
	              <div class="login-topbar">
	                <a class="login" href="/login"><i class="fas fa-user"></i> Login in</a>
	                <a class="register" href="/register">Register</a>
	              </div>
	            </div>
           </c:if>
            
            <!-- ${pageContext.request.userPrincipal.name} -->
            
            <sec:authorize access="hasAnyRole('USER')">
			    <div class="float-right hgroup-right">
	              <div class="login-topbar">
		              <%-- <a href="/member" class="login"><i class="fas fa-home"></i> Member Area</a>
		              <a class="login">${customer.name}</a>
		              <a href="/logout" class="login"><i class="fa fa-user"></i> Logout</a> --%>
	              
		              <div class="dropdown">
					  	<button class="dropbtn"> <a class="login">${customer.name}</a> <span class="fa fa-bars"></span></button>
						  <div class="dropdown-content">
						    
						    <a href="/member" class="login mjl-dropdown-a"><i class="fas fa-home"></i> Member Area</a>
						    <a href="/logout" class="login mjl-dropdown-a"><i class="fa fa-user"></i> Logout</a>
						  </div>
					 </div>
	              </div>
	              
	              <a class="postadd" href="/new-ads">Post Free Ad</a>
	            </div>
			</sec:authorize>
			
			<sec:authorize access="hasAnyRole('ADMIN')">
			    <div class="float-right hgroup-right">
	              <div class="login-topbar">
	                <%-- <a class="login">${customer.name}</a>
	                <a href="/logout" class="login"><i class="fa fa-user"></i> Logout</a> --%>
	                
		                <div class="dropdown">
						  	<button class="dropbtn"> <a class="login">${customer.name}</a> <span class="fa fa-bars"></span></button>
							  <div class="dropdown-content">
							    
							    <a href="/admin/category" class="login mjl-dropdown-a"><i class="fas fa-home"></i> Admin Panel</a>
							    <a href="/logout" class="login mjl-dropdown-a"><i class="fa fa-user"></i> Logout</a>
							  </div>
						 </div>
	              </div>
	              <!-- <a class="postadd" href="/admin/category">Admin Panel</a> -->
	            </div>
			</sec:authorize>
			
            <%-- <c:if test="${role eq '[ROLE_USER]'}">
            		
            </c:if> --%>
            
            <%-- <c:if test="${role eq '[ROLE_ADMIN]'}">
            		<div class="float-right hgroup-right">
	              <div class="login-topbar">
	                <a class="login"><i class="fas fa-user"></i> ${email}</a>
	              </div>
	              <a class="postadd" href="/admin/category">Admin Panel</a>
	            </div>
            </c:if> --%>
            
            <div class="inline-icons">
              <ul>
                <li><a class="ico-1" href="/search/Automobiles/Motorcycles/id=2"><img src="/images/ico1.png"></a></li>
                <li><a class="ico-2" href="/car"><img src="/images/ico2.png"></a></li>
                <li><a class="ico-3" href="/housing"><img src="/images/ico3.png"></a></li>
                <li><a class="ico-4" href="#"><img src="/images/ico4.png"></a></li>
              </ul>
            </div>
            <div class="search-box">
              <label>Nepal's best classified marketplace</label>
              <form class="input-group" method="GET" action="/">
                <input type="text" name="fullSearch" class="form-control" required />
                <button id="basic-addon2" type="submit" class="btn btn-success">SEARCH</button>
              </form>
            </div>
          </div>
        </div>
      </header>
      
      <style>
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    font-weight: 500;
    text-align: center;
    width: 100%;
}
.dropdown {
    position: relative;
    width: 100%;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {background-color: #f1f1f1}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>