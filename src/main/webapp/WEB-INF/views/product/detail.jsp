<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<title>ProductDetail</title>
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

			$('#editBtn').on('click',function (){
				self.location = '/product/edit?product_no=${product.product_no}&box_no=${product.box_no}';
			}); // onClick
		}); // .jp
	</script>
</head>

<body>
<h1>ProductDetail</h1>
<p>http://localhost:8090/product/detail?product_no=352&box_no=1339</p>

	<table>

		<tr>
			<td>박스번호(Box_no)</td>
			<td><input type="text" name="box_no" value="${product.box_no}" readonly></td>
		</tr>
		<tr>
			<td>물품이름(Product_name)</td>
			<td><input type="text" name="product_name" value="${product.product_name}"></td>
		</tr>
		<tr>
			<td>물품메모(Product_memo)</td>
			<td><input type="text" name="product_memo" value="${product.product_memo}"></td>
		</tr>
		<tr>
			<td>수량(Product_qtn)</td>
			<td><input type="text" name="product_qtn" value="${product.product_qtn}"></td>
		</tr>
		<tr>
			<td>물품사진이름(Product_photo_name)</td>
			<td><input type="text" name="product_photo_name" value="${product.product_photo_name}"></td>
		</tr>
		<tr>
			<td>물품사진경로(Product_photo_path)</td>
			<td><input type="text" name="product_photo_path" value="${product.product_photo_path}"></td>
		</tr>
		<tr>
			<td>바코드(Barcode)</td>
			<td><input type="text" name="barcode" value="${product.barcode}"></td>
		</tr>
		<tr>
			<td>카테고리1: ${baseCategory.cate_name1}</td>
			<td><input type="text" name="cate_detail1" value="${category.cate_detail1}"></td>
		</tr>
		<tr>
			<td>카테고리2: ${baseCategory.cate_name2}</td>
			<td><input type="text" name="cate_detail2" value="${category.cate_detail2}"></td>
		</tr>
		<tr>
			<td>카테고리3: ${baseCategory.cate_name3}</td>
			<td><input type="text" name="cate_detail3" value="${category.cate_detail3}"></td>
		</tr>
		<tr>
			<td>카테고리4: ${baseCategory.cate_name4}</td>
			<td><input type="text" name="cate_detail4" value="${category.cate_detail4}"></td>
		</tr>
		<tr>
			<td>카테고리5: ${baseCategory.cate_name5}</td>
			<td><input type="text" name="cate_detail5" value="${category.cate_detail5}"></td>
		</tr>
		<tr>
			<td><input type="text" name="product_no" value="${product.product_no}" readonly></td>
		</tr>
		<tr>
			<td><button type="button" id="editBtn">EDIT</button></td>
			<td><button type="button" ID="listBtn">LIST</button></td>
		</tr>


	</table>

</body>
</html>
