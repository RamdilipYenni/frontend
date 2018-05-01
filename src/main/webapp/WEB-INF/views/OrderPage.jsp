<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Techno-World/Order Page</title>
<style type="text/css">
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
/*     border: 1px solid #ddd; */
}
th, td {
    text-align: center;
    padding: 8px;
}
#grad1 {
    height: 50px;
    background: red; /* For browsers that do not support gradients */
    background: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1)); /* Standard syntax (must be last) */
}
</style>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="container">
<h1 id="grad1">Your Order</h1>
<div class="row my-4">
<div class="col-lg-4">

</div>
<div class="col-lg-8">
<form action="proceed" method="post">
<div style="overflow-x:auto;">
  <table class="table table-hover">
    <tr>
      <th>Product Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total Price</th>
    </tr>
    
    <c:forEach items="${listItems}" var="cartItems">
    <tr>
    <form class="form-horizontal" action="updateItem,${cartItems.cartId}" method="get">
      <td>${cartItems.productName}</td>
      <td>${cartItems.price}/-</td>
      <td>${cartItems.quantity}</td>
      <td>${cartItems.price*cartItems.quantity}/-</td>
	</form>  
    </tr>
    </c:forEach>
    <tr>
    	<td>Total Payment</td>
    	<td colspan="3">${totalPayment}/-</td>
    </tr>
    <br>
    <tr>
    	<td>Select Your Mode Of Payment</td>
    	<td><input type="radio" name="pmode" value="COD"/>Cash On Delivery</td>
    	<td><input type="radio" name="pmode" value="NB"/>Net Banking</td>
    	<td><input type="radio" name="pmode" value="CC"/>Credit Card</td>
    	<td><input type="radio" name="pmode" value="DC"/>Debit Card</td>
    </tr>
    <tr>
    	<td colspan="2"><a href="<c:url value='cart'/>" class="btn btn-default btn-block">EditCart</a></td>
    	<td colspan="2"><input type="submit" value="PAY NOW" class="btn btn-info btn-block"/></a></td>
    </tr>
  </table>
  <br>
</div>
</form>
</div>
</div>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>