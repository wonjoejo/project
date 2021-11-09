package com.wonjoejo.myapp.service;


import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
//@RunWith(SpringRunner.class)
@ContextConfiguration(
        locations= {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        })

public class BoardServiceTests {

    @Setter(onMethod_= {@Autowired})
    private BoardService service;

    @Before
    public void setup() {
        log.debug("setup() invoked.");

        //DI 검증 수행
        assertNotNull(this.service);
        log.info("\t+ service: {}", this.service);

    }//setup

    @Test(timeout=1000)
    public void testGetList() {
        log.debug("testGet() invoked.");

        List<BoardVO> board = this.service.getList();

        assert board != null;

        board.forEach(log::info);
    }//testGetList
    
    @Test(timeout=1000)
	public void testGetListPerPage() {
		log.debug("testGetListPerPage() invoked.");
				
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
		cri.setAmount(10);
		
		List<BoardVO> board = this.service.getListPerPage(cri);
		
		assert board != null;
		
		board.forEach(log::info);
	}//testGetListPerPage
    
    @Test(timeout=1000)
	public void testGetTotal() {
		log.debug("testGetTotal() invoked.");
				
		int totalCount = this.service.getTotal();		
		log.info("\t+ totalCount: {}",totalCount);
	}//testGetTotal
    
    
    @Test(timeout=1000)
	public void testWrite() {
		log.debug("testWrite() invoked.");
		
		BoardVO board=
				new BoardVO(
				null,
				"MEMBERid99",
				"NEWTITLE",
				"NEWCONTENT",
				0,
				null, 
				null,null,null);
		
		boolean isSeccess=this.service.write(board);
		log.info("\t+ isSeccess: {}", isSeccess);
			
	}//testWrite
    
    @Test(timeout=1000)
	public void testEdit() {
		log.debug("testModify() invoked.");
		
		BoardVO board=
				new BoardVO(
				99,
				"MEMBERid99",
				"질문글99",
				"질문글 내용99",
				0,
				null, 
				null,null,null);
		
		boolean isSeccess=this.service.edit(board);
		log.info("\t+ isSeccess: {}", isSeccess);
	}//testEdit
    
    @Test(timeout=1000)
	public void testDelete() {
		log.debug("testRemove() invoked.");
				
		int board_idx = 237;	
		boolean isSeccess=this.service.delete(board_idx);
		
		log.info("\t+ isSeccess: {}", isSeccess);
	}//testDelete
    
    @Test(timeout=1000)
	public void testDetail() {
		log.debug("testGet() invoked.");
				
		int board_idx = 90;	
		BoardVO board = this.service.detail(board_idx);
		
		Objects.requireNonNull(board);
		
		log.info("\t+ board: {}",board);
	}//testDetail
    
    
    @Test(timeout=1000)
	public void testReplyWrite() {
		log.debug("testReplyWrite() invoked.");
		
		BoardVO board=
				new BoardVO(
				null,
				"MEMBERid99",
				"NEWTITLE",
				"NEWCONTENT",
				0,
				null, 
				99,1,1);
	
		boolean isSeccess=this.service.writeReply(board);
		log.info("\t+ isSeccess: {}", isSeccess);
			
	}//testReplyWrite
    
    @Test(timeout=1000)
   	public void testReplyDelete() {
   		log.debug("testReplyDelete() invoked.");
   				
   		int ref = 99;	
   		boolean isSeccess=this.service.deleteReply(ref);
   		
   		log.info("\t+ isSeccess: {}", isSeccess);
   	}//testReplyDelete
    
    @Test(timeout=1000)
   	public void testReplyEdit() {
   		log.debug("testReplyEdit() invoked.");
   		
   		BoardVO board=
   				new BoardVO(
   				234,
   				"MEMBERid99",
   				"수정",
   				"수정",
   				0,
   				null, 
   				99,1,1);
   		
   		boolean isSeccess=this.service.editReply(board);
   		log.info("\t+ isSeccess: {}", isSeccess);
   	}//testReplyEdit

}
