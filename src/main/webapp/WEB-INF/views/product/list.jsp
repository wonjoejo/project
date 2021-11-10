<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
    
<html>
<head>
	<title>ProductList</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
</head>
<body>
<h1>
	ProductList
</h1>

<p>1005번 박스 물품 리스트~</p>

<c:forEach items="${list}" var="product">
	${product}
</c:forEach>

<hr>

<a href="/product/insertview"> 물품작성하기 </a>


</body>
</html>
