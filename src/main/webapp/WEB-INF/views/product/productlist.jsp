<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
    
<html>
<head>
	<title>ProductList</title>
</head>
<body>
<h1>
	ProductList
</h1>

<p>1005번 박스 물품 리스트~</p>

<c:forEach items="${list}" var="product">
	${product}
</c:forEach>

</body>
</html>
