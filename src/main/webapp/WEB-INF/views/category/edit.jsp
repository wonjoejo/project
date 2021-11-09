<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CategoryDetail</title>
</head>
<body>
<h1>CategoryEdit</h1>


${baseCategory}

<hr>

<form action="/category/edit" method="POST">
    <input type="hidden" name="category_no" value="${param.category_no}">
    <input type="hidden" name="box_no" value="${param.box_no}">

    카테고리1: <input type="text" name="cate_name1" value="${baseCategory.cate_name1}">
    <hr>
    카테고리2: <input type="text" name="cate_name2" value="${baseCategory.cate_name2}">
    <hr>
    카테고리3: <input type="text" name="cate_name3" value="${baseCategory.cate_name3}">
    <hr>
    카테고리4: <input type="text" name="cate_name4" value="${baseCategory.cate_name4}">
    <hr>
    카테고리5: <input type="text" name="cate_name5" value="${baseCategory.cate_name5}">

    <button type="submit">SUBMIT</button>
    <button type="list" id="listBtn">LIST</button>

</form>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<script>

    $(function(){
        console.clear();
        console.log('Jquery started...');

        $('#listBtn').click(function(){
            console.log('click event triggered...');
            self.location = '/category/detail';
        }); // listBtn



    }); // jq.

</script>
</html>
