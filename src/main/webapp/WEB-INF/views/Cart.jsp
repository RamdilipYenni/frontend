<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Techno-World/Cart Page</title>
<style type="text/css">
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
/*     border: 1px solid #ddd; */
}
th, td {
    text-align: left;
    padding: 8px;
}
input {
	text-align: center;
}
#grad1 {
    height: 50px;
   	background: blue; /* For browsers that do not support gradients */ 
    background: linear-gradient(to right, rgba(0,128,128,0), rgba(0,128,128,1)); /* Standard syntax (must be last) */
}
</style>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="container">
<h1 id="grad1">Shopping Cart</h1>
<div class="row my-4">
<div class="col-lg-4">

</div>
<div class="col-lg-8">
<div style="overflow-x:auto;">
  <table class="table table-hover">
    <tr>
      <th>Product Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total Price</th>
      <th>Operation</th>
    </tr>
    <c:forEach items="${listItems}" var="cartItems">
    <tr>
    <form class="form-horizontal" action="updateItem,${cartItems.cartId}" method="get">
      <td>${cartItems.productName}</td>
      <td>${cartItems.price}/-</td>
      <td><input type="text" value="${cartItems.quantity}" name="quantity"/></td>
      <td>${cartItems.price*cartItems.quantity}/-</td>
      <td>
      	<button type="submit" value="update" class="btn btn-block">Update</button> 
		<a href="<c:url value='deleteItem,${cartItems.cartId}'/>" class="btn btn-block">Delete</a>
	  </td>
	</form>  
    </tr>
    </c:forEach>
    <tr>
    	<td colspan="3">Total Payment</td>
    	<td colspan="2">${totalPayment}/-</td>
    </tr>
    <tr>
    	<td colspan="3"><a href="<c:url value='index'/>" class="btn btn-default btn-block">Continue Shopping</a></td>
    	<td colspan="2"><a href="<c:url value='checkOut'/>" class="btn btn-danger btn-block">Check Out</a></td>
    </tr>
  </table>
  <br>
</div>
</div>
</div>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>