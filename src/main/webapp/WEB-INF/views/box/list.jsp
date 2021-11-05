<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>BoxList</title>
</head>
<body>
<h1>
	BoxList
</h1>

<c:forEach items="${list}" var="box">
	${box}
</c:forEach>

${param.result}

<button onclick="location.href='${pageContext.request.contextPath}/box/create'">박스 생성</button>

</body>
</html>
