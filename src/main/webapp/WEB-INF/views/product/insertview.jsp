<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>ProductInsert</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
	
	<script>
		$(function () {
			console.clear();
			console.log('jquery started...');
			$('#listBtn').click(function () {
				console.log('click event triggered......');

				self.location = '/product/list';
			}); // onclick
		}); // .jp
	</script>
</head>

<body>
<h1>
	ProductInsert
</h1>

<p>물품 등록하기~</p>

<form action="/product/insert" method="POST">
	<table>

		<tr>
			<td>박스번호(Box_no)</td>
			<td><input type="text" name="box_no" value="1005"></td>
		</tr>
		<tr>
			<td>물품이름(Product_no)</td>
			<td><input type="text" name="product_name" value="product_insert"></td>
		</tr>
		<tr>
			<td>물품메모(Product_memo)</td>
			<td><input type="text" name="Product_memo" value="memomemo"></td>
		</tr>
		<tr>
			<td>수량(Product_qtn)</td>
			<td><input type="text" name="product_qtn" value="3"></td>
		</tr>
		<tr>
			<td>물품사진이름(Product_photo_name)</td>
			<td><input type="text" name="Product_photo_name" value=""></td>
		</tr>
		<tr>
			<td>물품사진경로(Product_photo_path)</td>
			<td><input type="text" name="Product_photo_path" value=""></td>
		</tr>
		<tr>
			<td>바코드(Barcode)</td>
			<td><input type="text" name="Barcode" value=""></td>
		</tr>
		<tr>
			<td><input type="submit" value="전송전송"></td>
			<td><input type="button" id="listBtn" value="목록목록"></td>
		</tr>
	</table>
</form>

</body>
</html>
