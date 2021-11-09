<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>ProducDetail</title>
</head>
<body>
<h1>
	ProducDetail
</h1>

<p>6번 물품 세부정보~</p>

이열 매퍼xml에 오류있당 ㅎㅎ

<c:forEach items="${list}" var="product">
	${product}
</c:forEach>


</body>
</html>
