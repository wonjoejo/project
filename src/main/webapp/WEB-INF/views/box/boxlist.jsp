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

</body>
</html>
