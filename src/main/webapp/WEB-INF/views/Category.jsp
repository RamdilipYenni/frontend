<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
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
    width: 50%;
}
th, td {
    padding: 10px;
}
  </style>
</head>
<body>
<!-- Navigation -->
<%@include file = "Header.jsp" %>

<div class="container">
  <h2>Category</h2>
  <p>To add New Category</p>
  <form class="form-horizontal" action="InsertCategory" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Category Name:</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" id="catname" placeholder="Enter Category Name" name="catname">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-info">Insert</button>
      </div>
    </div>
  </form>
</div>

<table align="center">
  <thead>	
	<tr>
		<th>Category ID</th>
		<th>Category Name</th>
		<th>Operation</th>
	</tr>
  </thead>
<c:forEach items="${categoryList}" var="category">
	<tbody>
	<tr>
		<td>${category.categoryId}</td>
		<td>${category.categoryName}</td>
		<td>
			<a href="<c:url value='EditCategory,${category.categoryId}'/>">Edit</a>/
			<a href="<c:url value='DeleteCategory,${category.categoryId}'/>">Delete</a>
		</td>
	</tr>
	</tbody>
</c:forEach>
</table>

<div>
<p></p>
</div>

<!-- Footer -->
<%@include file = "Footer.jsp" %>
</body>
</html>