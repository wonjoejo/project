$("#editBtn1").on("click", function (){
   alert("클릭");
});

function update(reply, callback){
    $.ajax({
        type:'GET',
        url:'${pageContext.request.contextPath}/category/edit?box_no=${baseCategory.box_no}',
        success: function (result){
            $()
        }
    })
}
