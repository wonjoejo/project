<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>ProductInsert</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/mvp.css">

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
			<td><input type="text" name="box_no" value="${baseCategory.box_no}"></td>
		</tr>
		<tr>
			<td>물품이름(Product_name)</td>
			<td><input type="text" name="product_name"></td>
		</tr>
		<tr>
			<td>물품메모(Product_memo)</td>
			<td><input type="text" name="product_memo"></td>
		</tr>
		<tr>
			<td>수량(Product_qtn)</td>
			<td><input type="text" name="product_qtn"></td>
		</tr>
		<tr>
			<td>물품사진이름(Product_photo_name)</td>
			<td><input type="text" name="product_photo_name" value=""></td>
		</tr>
		<tr>
			<td>물품사진경로(Product_photo_path)</td>
			<td><input type="text" name="product_photo_path" value=""></td>
		</tr>
		<tr>
			<td>바코드(Barcode)</td>
			<td><input type="text" name="barcode" value=""></td>
		</tr>
		<tr>
			<td>카테고리1: ${baseCategory.cate_name1}</td>
			<td><input type="text" name="cate_detail1"></td>
		</tr>
		<tr>
			<td>카테고리2: ${baseCategory.cate_name2}</td>
			<td><input type="text" name="cate_detail2"></td>
		</tr>
		<tr>
			<td>카테고리3: ${baseCategory.cate_name3}</td>
			<td><input type="text" name="cate_detail3"></td>
		</tr>
		<tr>
			<td>카테고리4: ${baseCategory.cate_name4}</td>
			<td><input type="text" name="cate_detail4"></td>
		</tr>
		<tr>
			<td>카테고리5: ${baseCategory.cate_name5}</td>
			<td><input type="text" name="cate_detail5"></td>
		</tr>
		<tr>
			<td><input type="text" name="product_no" value="${product.product_no}"></td>
			<td><input type="text" name="category_no" value="${baseCategory.category_no}"></td>
		</tr>
		<tr>
			<td><input type="submit" value="전송전송"></td>
			<td><input type="button" id="listBtn" value="목록목록"></td>
		</tr>


	</table>
</form>
${baseCategory}

</body>
</html>
