<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL 을 사용해서 예외객체가 가지고 있는, 한 개 이상의 스택트레이스를 출력해보자!!!! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage.jsp</title>
</head>
<body>

	<h1>/WEB-INF/views/errorPage.jsp</h1>
	
	<hr/>
	
	<h2>exception: ${exception}</h2>
	
	<hr/>

	<p>잠시 시스템에 문제가 발생했습니다. 잠시 후에 다시 시도하여 주세요.</p>
	
</body>
</html>