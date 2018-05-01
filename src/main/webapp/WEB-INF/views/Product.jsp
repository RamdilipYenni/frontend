<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Product</title>
<style>
form {
	padding-left: 100px;
}
table, td, th {
	border: 1px solid #ddd;
	text-align: center;
}
table {
	border-collapse: collapse;
	width: 75%;
}
th, td {
	padding: 10px;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<%@include file="Header.jsp"%>

	<div class="container">
		<h2>Add Product</h2>
		<form:form modelAttribute="product" class="form-horizontal"
			action="InsertProduct" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Product
					Name:</label>
				<div class="col-sm-3">
					<form:input path="productName" type="text" class="form-control"
						placeholder="Enter Product Name" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Product
					Price:</label>
				<div class="col-sm-3">
					<form:input path="price" type="number" class="form-control"
						placeholder="Enter Product Price" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Stock:</label>
				<div class="col-sm-3">
					<form:input path="stock" type="number" class="form-control"
						placeholder="Enter Stock" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Category:</label>
				<div class="col-sm-3">
					<form:select path="categoryId" type="number" class="form-control">
						<form:option value="0" label="---select list---" />
						<form:options items="${categoryList}" />
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Supplier:</label>
				<div class="col-sm-3">
					<form:select path="supplierId" type="number" class="form-control">
						<form:option value="0" label="---select list---" />
						<form:options items="${supplierList}" />
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Product
					Description:</label>
				<div class="col-sm-3">
					<form:input path="productDesc" type="text" class="form-control"
						placeholder="Enter Product Description" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="image">Product
					Image:</label>
				<div class="col-sm-3">
					<form:input path="pimage" type="file" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-info">Insert</button>
				</div>
			</div>
		</form:form>
	</div>

	<font color="red"><h3>${ErrorInfo}</h3></font>

	<table align="center">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Category ID</th>
				<th>Supplier ID</th>
				<th>Product Description</th>
				<th>Product Image</th>
				<th>Operation</th>
			</tr>
		</thead>
		<c:forEach items="${productList}" var="product">
			<tbody>
				<tr>
					<td>${product.productId}</td>
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.stock}</td>
					<td>${product.categoryId}</td>
					<td>${product.supplierId}</td>
					<td>${product.productDesc}</td>
					<td><img
						src="<c:url value="/resources/Images/${product.productId}.jpg"/>"
						width="50" height="50" /></td>
					<td><a
						href="<c:url value='EditProduct,${product.productId}'/>">Edit</a>/
						<a href="<c:url value='DeleteProduct,${product.productId}'/>">Delete</a>
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<div>
		<p></p>
	</div>
	<!-- Footer -->
	<%@include file="Footer.jsp"%>
</body>
</html>