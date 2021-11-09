package com.wonjoejo.myapp.mapper;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.domain.Criteria;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

	
    @Setter(onMethod_= {@Autowired})
    private BoardMapper mapper;

    
    @Before
    public void setup() {		
        log.debug("setup() invoked.");

        assert this.mapper != null;

        log.info("\t+ mapper:{}", this.mapper);
        log.info("\t+ type:{}", this.mapper.getClass().getName());
    }//setup

    
    //게시물 목록 조회 
    @Test
    public void testGetList() {
        log.debug("testGetList() invoked.");

        List<BoardVO> list = this.mapper.getList();
        list.forEach(log::info); //람다식과 메소드 참조라는 것을 알아야한다

    }//testGetList
    
    
    //페이징 처리된 게시판 목록조회
    @Test
	public void testGetListWithPaging() {
		log.debug("testGetListWithPaging() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(4);
		cri.setAmount(5);
		
		List<BoardVO> list = this.mapper.getListWithPaging(cri);
		list.forEach(log::info); //람다식과 메소드 참조라는 것을 알아야한다 
		
	}//testGetListWithPaging

    
    //총 게시물 개수를 반환 
    @Test
	public void testGetTotalCount() {
		log.debug("testGetTotalCount() invoked.");
		
		int totalCount = this.mapper.getTotalCount();
		log.info("\t+ totalCount: {}",totalCount);
		
	}//testGetTotalCount
    
    
    //게시물 작성 
    @Test
	public void testInsert() {
		log.debug("testInsert() invoked.");
		
		BoardVO board=
				new BoardVO(
						null,
						"MEMBERid99",
						"TEST",
						"TEST",
						0,
						null,
						null,null,null);
		
		this.mapper.insert(board);
		log.info("\t+ board:{}",board);
		
	}//testInsert
    
    
    //새로운 게시글이 등록완료됨과 동시에 ,자동생성된 게시글(BNO)값을 얻어낼수가 있다.
    @Test
	public void testInsertSelectKey() {
		log.debug("testInsertSelectKey() invoked.");
		
		BoardVO newBoard=
				new BoardVO(
						null,
						"MEMBERid99",
						"TITLE_TEST",
						"CONTENT_TEST",
						0,
						null, 
						null,null,null);
		
			int affectedLines = this.mapper.insertSelectKey(newBoard); 

		log.info(" ===============================================");	
		log.info("\t+ affectedLines:{}", affectedLines);
		log.info("\t+ newBoard:{}", newBoard);
		
	}//testInsertSelectKey
    
    
    //게시물 삭제 
    @Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		
		int board_idx=228;
		int affectedLines = this.mapper.delete(board_idx);
		
		log.info("\t+ affectedLines:{}", affectedLines);		
	}//testDelete
    
    
    //게시물 상세보기 
    @Test
	public void testRead() {
		log.debug("testRead () invoked.");
		
		int board_idx=99;
		BoardVO board = this.mapper.read(board_idx);
		
		log.info("\t+ board:{}", board);		
	}//testRead
    
    
    //게시물 수정 
    @Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");
		
		BoardVO newBoard=
				new BoardVO(
				226,
				"MEMBERid99",
				"MODIFIED",
				"MODIFIED",
				0,
				null, 
				null,null,null);
		
			int affectedLines = this.mapper.update(newBoard);
			
			log.info("\t+ affectedLines:{}", affectedLines);
			
	}//testUpdate
    
    
    //답글 작성 
    @Test
    public void testReplyInsert() {
    	log.debug("testReplyInsert() invoked.");
		
		BoardVO board=
				new BoardVO(
						null,
						"MEMBERid99",
						"TEST",
						"TEST",
						0,
						null,
						99,1,1);
		
		this.mapper.insertReply(board);
		log.info("\t+ board:{}",board);
		
    }//testReplyInsert
    
    
    //답글 수정 
    @Test
	public void testReplyUpdate() {
		log.debug("testReplyUpdate() invoked.");
		
		BoardVO newBoard=
				new BoardVO(
				238,
				"MEMBERid99",
				"답글",
				"답글",
				0,
				null, 
				99,1,1);
		
			int affectedLines = this.mapper.update(newBoard);
			
			log.info("\t+ affectedLines:{}", affectedLines);
			
	}//testReplyUpdate
    
    
    //답글 삭제 
    @Test
	public void testReplyDelete() {
		log.debug("testReplyDelete() invoked.");
		
		int ref = 99;
		int affectedLines = this.mapper.deleteReply(ref);
		
		log.info("\t+ affectedLines:{}", affectedLines);		
	}//testDelete
    
    
    @After
    public void tearReplyDawn() {
        log.debug("tearDawn() invoked.");

    }//tearDawn

}
