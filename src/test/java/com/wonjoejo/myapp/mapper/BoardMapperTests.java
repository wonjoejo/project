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

    @Test
    public void testGetList() {
        log.debug("testGetList() invoked.");

        List<BoardVO> list = this.mapper.getList();
        list.forEach(log::info); //람다식과 메소드 참조라는 것을 알아야한다

    }//testGetList
    
    @Test
	public void testGetListWithPaging() {
		log.debug("testGetListWithPaging() invoked.");
		
		Criteria cri = new Criteria();
		cri.setCurrPage(4);
		cri.setAmount(5);
		
		List<BoardVO> list = this.mapper.getListWithPaging(cri);
		list.forEach(log::info); //람다식과 메소드 참조라는 것을 알아야한다 
		
	}//testGetListWithPaging

    @Test
	public void testGetTotalCount() {
		log.debug("testGetTotalCount() invoked.");
		
		int totalCount = this.mapper.getTotalCount();
		log.info("\t+ totalCount: {}",totalCount);
		
	}//testGetTotalCount
    
    @Test
	public void testInsert() {
		log.debug("testInsert() invoked.");
		
		BoardVO newBoard=
				new BoardVO(null, "MEMBERid99", "TEST", "TEST", 0, null,null,null,null);
		
			int affectedLines =
				this.mapper.insert(newBoard); 
		
	}//testInsert
    
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
    
    @Test
	public void testDelete() {
		log.debug("testDelete() invoked.");
		
		int board_idx=107;
		int affectedLines = this.mapper.delete(board_idx);
		
		log.info("\t+ affectedLines:{}", affectedLines);		
	}//testDelete
    
    @Test
	public void testRead() {
		log.debug("testRead () invoked.");
		
		int board_idx=100;
		BoardVO board = this.mapper.read(board_idx);
		
		log.info("\t+ board:{}", board);		
	}//testRead
    
    @Test
	public void testUpdate() {
		log.debug("testUpdate() invoked.");
		
		BoardVO newBoard=
				new BoardVO(
				111,
				"MEMBERid99",
				"TITLE_MODIFIED",
				"CONTENT_MODIFIED",
				0,
				null, 
				null,null,null);
		
			int affectedLines = this.mapper.update(newBoard);
			
			log.info("\t+ affectedLines:{}", affectedLines);
			
	}//testUpdate

    @After
    public void tearDawn() {
        log.debug("tearDawn() invoked.");

    }//tearDawn

}
