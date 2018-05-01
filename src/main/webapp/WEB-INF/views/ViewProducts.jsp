<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DisplayProducts</title>
</head>
<body>	
   <%@include file="Header.jsp" %> 
    
    <div class="container">
    <div class="row">
    <c:forEach items="${productList}" var="product">
     <div class="col-sm-6 col-md-3">   	
      <c:if test="${product.categoryId == categoryid}">	
      <a href="<c:url value='ProductDesc,${product.productId}'/>" class="thumbnail">
      <img src="<c:url value="/resources/Images/${product.productId}.jpg"/>" alt="Products" style="width:100%">
      </a>
      <h4>${product.productName}</h4>
      <p>Price:${product.price}</p>
      </c:if>
      </div>  
    </c:forEach>
    </div>
    </div>
   <%@include file="Footer.jsp" %> 
</body>
</html>