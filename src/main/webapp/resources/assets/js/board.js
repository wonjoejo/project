
//게시글 내용 미입력 alert 창 	
 $('form').on('submit',function(e){
	if($('.writetitle').val() == ''){
		e.preventDefault();
		 Swal.fire({ icon: 'error', 
   			   //title: 'Alert가 실행되었습니다.', 
   			   text: '제목을 입력하세요.', 
  		});
   
   console.log("sweet alert");
	}else if($('.writecon').val() == ''){
		e.preventDefault();
		Swal.fire({ icon: 'error', 
   			   //title: 'Alert가 실행되었습니다.', 
   			   text: '내용을 입력하세요.', 
  		});
	}
});

//게시글 수정 내용 미입력 alert 창    
$('form').on('submit',function(e){
	if($('.edittitle').val() == ''){
		e.preventDefault();
		Swal.fire({ icon: 'error', 
   			   //title: 'Alert가 실행되었습니다.', 
   			   text: '제목을 입력하세요.', 
  		});
	}else if($('.editcon').val() == ''){
		e.preventDefault();
		Swal.fire({ icon: 'error', 
   			   //title: 'Alert가 실행되었습니다.', 
   			   text: '내용을 입력하세요.', 
  		});
	}
});
	
//검색 alert , 첫페이지로 이동 
let searchForm = $("#searchForm");

$("#searchForm button").on("click", function(e) {
                  
if(!searchForm.find("input[name='keyword']").val()) {
    Swal.fire({ icon: 'warning', 
   			   //title: 'Alert가 실행되었습니다.', 
   			   text: '키워드를 입력하세요.', 
   });
     return false;
}
                        
searchForm.find("input[name='currPage']").val("1");
e.preventDefault();
                        
searchForm.submit();
});
 
//본인 게시글만 확인 alert 
$(function () {  	
	$('.detailcheck' ).click(function () {
       Swal.fire({ icon: 'info', 
       	   text: '본인이 작성한 글만 확인이 가능합니다.' 
    });
}); //onclick
    
//답글 작성 버튼 이벤트 
$('#replyWriteBtn').on('click', function () {
    console.log('onclicked on writeBtn...');

    self.location = `/board/replywrite?ref=${ref}&title=${title}&member_id=${member_id}`;
});//onclick      
    
//로그인 페이지로 이동 
$('.gojoinpage').click(function () {
   Swal.fire({ icon: 'info',  
	   text: '로그인 후 이용 가능합니다.',
	   footer: '<a href="/member/login">로그인 페이지로 이동</a>' 
   });

}); //onclick*/
  
//notice 더보기 버튼 
$('#addBtn').click(function () {
    console.log('click event triggered..');

    self.location = '/board/noticePage';
}); //onclick
   
  
   /*//delete 버튼에 대한 이벤트 등록 처리
  	$('#deleteBtn').click(function () {
      console.log('click event triggered..');

      var formObj = $('form');
      formObj.attr('method', 'POST');
      formObj.attr('action', '/board/delete');
 
      formObj.submit();
    }); //onclick*/
    
//삭제버튼 --> admin 
$('#deleteBtn').on('click',function(e){
      
	Swal.fire({
	  title: '삭제 하시겠습니까?',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '삭제',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		var formObj = $('form');
 	      formObj.attr('method', 'POST');
 	      formObj.attr('action', '/board/delete');
 	     formObj.submit();
	  }
	})
	
}); 
    
   /* //delete 버튼에 대한 이벤트 등록 처리
   $('#replydeleteBtn').click(function () {
      console.log('click event triggered..');

      var formObj = $('form');
      formObj.attr('method', 'POST');
      formObj.attr('action', '/board/alldelete');
     
      formObj.submit();
    }); //onclick */
    
//답글 삭제 버튼 --> 로그인한 아이디 회원 
$('#replydeleteBtn').on('click',function(e){
      
	Swal.fire({
	  title: '삭제 하시겠습니까?',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '삭제',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		var formObj = $('form');
 	      formObj.attr('method', 'POST');
 	      formObj.attr('action', '/board/alldelete'); // 본글 답글 전체삭제 
 	     formObj.submit();
	  }
	})
	
}); 
    
//edit 버튼에 대한 이벤트 등록 처리
$('#editBtn').click(function () {
  console.log('click event triggered..');

  self.location = `/board/edit?board_idx=${board_idx}`;
}); //onclick

//edit 완료 alert
$('#editcomplteBtn').click(function () {
	const Toast = Swal.mixin({
		  toast: true,
		  position: 'middle',
		  showConfirmButton: false,
		  timer: 2000,  
		})

		Toast.fire({
		  icon: 'success',
		  title: '수정 완료'
		})
 }); //onclick*/

//list 버튼에 대한 이벤트 등록 처리
$('#listBtn').click(function () {
  console.log('click event triggered..');

  self.location = `/board/listPerPage?currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
}); //onclick
        
// 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
$('#writeBtn').on('click', function () {
  console.log('onclicked on writeBtn...');

 self.location = `/board/write?board_idx=${board_idx}&currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
});//onclick

//답글 완료 alert
$('.writeBtn').click(function () {
	const Toast = Swal.mixin({
		  toast: true,
		  position: 'middle',
		  showConfirmButton: false,
		  timer: 2000,  
		})

		Toast.fire({
		  icon: 'success',
		  title: '글 등록 완료'
		})
 }); //onclick

// 공지 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
$('#noticewriteBtn').on('click', function () {
  console.log('onclicked on noticewriteBtn...');

   self.location = `/board/noticewrite?currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
});//onclick

//공지리스트로 돌아가기 버튼 
$('#noticepagelistBtn').click(function () {
  console.log('click event triggered..');

  self.location = `/board/noticePage?currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
}); //click   

//q&a 리스트로 돌아가기 
$('#noticelistBtn').click(function () {
  console.log('click event triggered..');

  self.location = `/board/listPerPage?currPage=${currPage}&amount=${amount}&pagesPerPage=${pagesPerPage}`;
}); //click    

//전체 게시글 목록 페이징 : 페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
$('a.prev, a.next').on('click',function(e){
    e.preventDefault();

    const paginationForm=$('#paginationForm')
    paginationForm.attr('action','/board/listPerPage')
    paginationForm.attr('method','GET')

    //Criteria 3개 전송파라미터를 설정 
    paginationForm.find('input[name=currPage]').val($(this).attr('href'));
    paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
    paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

    paginationForm.submit();
});//onclick 
    
//공지사항 페이징 : 페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
$('a.prev, a.next').on('click',function(e){
    e.preventDefault();

    var paginationForm=$('#paginationForm')
    paginationForm.attr('action','/board/noticePage')
    paginationForm.attr('method','GET')

    //Criteria 3개 전송파라미터를 설정 
    paginationForm.find('input[name=currPage]').val($(this).attr('href'));
    paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
    paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

    paginationForm.submit();
});//onclick 
        
//검색 리스트 페이징 : 페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
$('a.prev, a.next').on('click',function(e){
    e.preventDefault();

    var paginationForm=$('#paginationForm')
    paginationForm.attr('action','/board/searchlist')
    paginationForm.attr('method','GET')

    //Criteria 3개 전송파라미터를 설정 
    paginationForm.find('input[name=currPage]').val($(this).attr('href'));
    paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
    paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

    paginationForm.submit();
});//onclick 

}); //.jq



