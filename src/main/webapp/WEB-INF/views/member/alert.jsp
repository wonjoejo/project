<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alertPage</title>
</head>

	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/img/logo6.png" sizes="16x16">

	<!-- sweetalert -->
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/login.css?ver=3"/>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">
		let message = "${msg}";
		let url = "${url}";
		Swal.fire({
			toast: true,
			icon: 'error',
			message,
			text: '아이디 혹은 비밀번호가 일치하지 않습니다.'
		}).then(function(){
			window.location.href = url;
		});
	</script>
</body>
</html>