<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
        
    li a {
    color:white;
    }
.sticky-container{
		/*background-color: #333;*/
		padding: 0px;
		margin: 0px;
		position: fixed;
		right: -120px;
		top:250px;
		width: 200px;
		z-index:9999;
	}
	.sticky li{
		list-style-type: none;
		background-color: #fff;
		color: #efefef;
		padding: 0px;
		margin: 0px 0px 5px 0px;
		-webkit-transition:all 0.25s ease-in-out;
		-moz-transition:all 0.25s ease-in-out;
		-o-transition:all 0.25s ease-in-out;
		transition:all 0.25s ease-in-out;
		cursor: pointer;
		border:1px solid #e5e5e5;
             
	}
	.sticky li:hover{
		margin-left: -85px;
		/*-webkit-transform: translateX(-115px);
		-moz-transform: translateX(-115px);
		-o-transform: translateX(-115px);
		-ms-transform: translateX(-115px);*/
		/*transform:translateX(-115px);*/
		/*background-color: #8e44ad;*/
		color:red;
		
	}
	.sticky li img{
		float: left;
		margin: 5px 5px;
		margin-right: 10px;
	}
	.sticky li span{
		padding: 0px;
		margin: 0px;
		text-transform: uppercase;
		line-height: 43px;
		color:#36361F;
	}
 
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    	<ul class="navbar-brand">
    	<li><a href="index">Techno-World</a></li>	
    	</ul>   	
    </div>
       
    <div class="collapse navbar-collapse" id="myNavbar">
    <c:if test="${!sessionScope.loggedIn}">    	
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="home"><i class="fa fa-home" style="font-size:20px"></i></a></li>
        <li><a href="about" >About</a></li>
<!--         <li><a href="product">Products</a></li> -->
<!--         <li><a href="category">Category</a></li> -->
<!--         <li><a href="supplier">Supplier</a></li> -->
        <li><a href="contact">Contact</a></li>
        <li><a href="signup">SignUp</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		<li><a type="button" href="login" ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>	       
	  </ul>
	  </c:if>	      
	<c:if test="${sessionScope.loggedIn}">
		<c:if test="${sessionScope.role=='ROLE_USER'}">	    	
	      <ul class="nav navbar-nav navbar-right">
	        <li class="active"><a href="home"><i class="fa fa-home" style="font-size:20px"></i></a></li>
	        <li><a href="about" >About</a></li>
<!-- 	        <li><a href="product">Products</a></li> -->
	<!--         <li><a href="category">Category</a></li> -->
	<!--         <li><a href="supplier">Supplier</a></li> -->
	        <li><a href="contact">Contact</a></li>
	        <li><a type="button" href="cart" ><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
			<li><a type="button" href="<c:url value="/logout"/> "><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>	       
		  </ul>
	  </c:if>
	  <c:if test="${sessionScope.role=='ROLE_ADMIN'}">	    	
	      <ul class="nav navbar-nav navbar-right">
	        <li class="active"><a href="home"><i class="fa fa-home" style="font-size:20px"></i></a></li>
<!-- 	        <li><a href="about" >About</a></li> -->
	        <li><a href="product">Products</a></li>
	        <li><a href="category">Category</a></li>
	        <li><a href="supplier">Supplier</a></li>
<!-- 	        <li><a href="contact">Contact</a></li> -->
	<!--         <li><a href="signup">SignUp</a></li> -->
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
			<li><a type="button" href="<c:url value="/logout"/> "><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>	       
		  </ul>
	  </c:if>
	</c:if>  	      
	</div>
</div>
</nav>

<!-- Social links aligned right  -->
<div class="sticky-container">
	<ul class="sticky">
			<li>
				<img width="32" height="32" title="Facebook" alt="" src="<spring:url value="/resources/Images/facebook-icon.png/"/>" />
				<a href="https://www.facebook.com" target="_blank"><span>Facebook</span></a>
			</li>
			<li>
				<img width="32" height="32" title="Linkedin" alt="" src="<spring:url value="/resources/Images/linkedin-icon.png/"/>" />
				<a href="https://www.linkedin.com/" target="_blank"><span>Linkedin</span></a>
			</li>
	</ul>
</div> 


</body>
</html>
</body>
</html>