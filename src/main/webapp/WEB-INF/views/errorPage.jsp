<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/error.css?ver=10">
</head>
<body>

<div id="wrap">
	<img id="errorimg" src="${pageContext.request.contextPath}/resources/assets/img/error.png">
	
	<h1>Awww...Don't Cry.</h1>
	<p>잠시 시스템에 문제가 발생했습니다. 잠시 후에 다시 시도하여 주세요.</p>
	<h5>exception: ${exception}</h5>
</div>
	
</body>
</html>