
  $(function name() {
    console.clear();
    console.log('jquery started...');
    
   // 답글 작성 
    $('#replyWriteBtn').on('click', function () {
        console.log('onclicked on writeBtn...');

        self.location = '/board/replywrite?ref=${board.ref}&title=${board.title}';
    });//onclick
    
   //delete 버튼에 대한 이벤트 등록 처리
    $('#deleteBtn').click(function () {
      console.log('click event triggered..');

      var formObj = $('form');
      formObj.attr('method', 'POST');
      formObj.attr('action', '/board/delete');

      formObj.submit();
    }); //onclick
    
   //edit 버튼에 대한 이벤트 등록 처리
    $('#editBtn').click(function () {
      console.log('click event triggered..');

      self.location = '/board/edit?board_idx=${board.board_idx}';
    }); //onclick

    //list 버튼에 대한 이벤트 등록 처리
    //$(#listBtn).on('click',function(){
    $('#listBtn').click(function () {
      console.log('click event triggered..');

      self.location = '/board/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
    }); //onclick
        

    // 등록 버튼을 마우스로 클릭하면, 이벤트 핸들러가 발생한다
    $('#writeBtn').on('click', function () {
          console.log('onclicked on writeBtn...');

          self.location = '/board/register?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}';
        });

    //페이지네이션에서, prev/next 클릭시 , 제대로 이동하도록 처리 
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
    });  

  }); //.jq

