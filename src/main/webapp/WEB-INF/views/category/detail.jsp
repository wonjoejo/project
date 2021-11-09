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
    <h1>CategoryDetail</h1>

    ${baseCategory}

    <hr>
    ${baseCategory.cate_name1}
    <hr>
    ${baseCategory.cate_name2}
    <hr>
    ${baseCategory.cate_name3}
    <hr>
    ${baseCategory.cate_name4}
    <hr>
    ${baseCategory.cate_name5}

    <button type="button" id="editBtn">Edit</button>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
<script>

    $(function(){
        console.clear();
        console.log('Jquery started...');

        $('#editBtn').click(function(){
            console.log('click event triggered...');
            self.location = '/category/edit?category_no=${baseCategory.category_no}&box_no=${baseCategory.box_no}';
        }); // editBtn



    }); // jq.

</script>
</html>
