<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Description</title>
</head>
<body>
<%@include file="Header.jsp" %>

<div class="container">

<div class="row my-4">
			
			<div class="col-lg-6">
			<img src="<c:url value="/resources/Images/${product.productId}.jpg"/>" alt="Products" style="width:100%">
			</div>
			<div class="col-lg-6">
			<h4>Product: ${product.productName}</h4>
			<hr>
			<h5>Price: RS ${product.price}/-</h5>
			<h5>Specifications: ${product.productDesc}</h5>
			<h5>Stock: ${product.stock}</h5>
			<form action="addToCart,${product.productId}" method="get">
			<tr>
				<td>Quantity</td>
				<td><select name="quantity" class="form-control btn-block">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select></td>
			</tr>
			<tr>
				<button type="submit" class="btn btn-danger btn-block">Add To Cart</button>
			</tr>	
			</form>
			</div> 
			
</div>

</div>

<%@include file="Footer.jsp" %>
</body>
</html>