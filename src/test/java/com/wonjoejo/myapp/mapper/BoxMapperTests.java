package com.wonjoejo.myapp.mapper;

import java.util.List;

<<<<<<< Updated upstream
import com.wonjoejo.myapp.domain.*;
=======
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxVO;
>>>>>>> Stashed changes
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoxMapperTests {
	
	@Setter(onMethod_= { @Autowired })
	private BoxMapper mapper;
	
	@Before
	public void setup() {
		
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", this.mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} // setup
	
	@Test
	public void testGetBoxList() {

		log.debug("testGetBoxList() invoked.");

		String member_id = "MEMBERid32";
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
		cri.setAmount(5);
		cri.setMember_id(member_id);

		List<BoxVO> list = this.mapper.selectBoxList(cri);
		log.info(list.get(0).getBox_mode());
		list.forEach(log::info);


	} // testGetPersonalList

	@Test
	public void testInsertBox() {
		log.debug("testInsertBox() invoked.");

		Integer box_mode = 5;
		BoxVO box = new BoxVO(
				null,
				"MEMBERid4",
				box_mode,
				"boxname2",
				"mappertest",
				"mapperimg",
				"mapperpath",
				null
		);

		this.mapper.insertBox(box);
		log.info("\t+ box:{}",box);


<<<<<<< Updated upstream
		if(box_mode==1) {
			BaseCategoryVO vo = new BaseCategoryVO(box.getBox_no(),null,"종류","유통기한","보관방법","커스텀1",null);
			this.mapper.insertCategory(vo);
=======
//		BaseCategory insert
		BaseCategoryVO basecategoryVO = null;

		switch (box_mode){
			case 1:
				basecategoryVO = new BaseCategoryVO(null, "종류","유통기한","보관방법",null,null,box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
			case 2:
				basecategoryVO = new BaseCategoryVO(null, "종류", "유통기한", "색상", null, null, box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
			case 3:
				basecategoryVO = new BaseCategoryVO(null, "구매자", "구매일자", "종류", null, null, box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
			case 4:
				basecategoryVO = new BaseCategoryVO(null, "구매자", "종류", "색상", null, null, box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
			case 5:
				basecategoryVO = new BaseCategoryVO(null, "종류", "구매일자", "멤버명", null, null, box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
			default:
				basecategoryVO = new BaseCategoryVO(null, null, null, null, null, null, box.getBox_no());
				this.mapper.insertCategory(basecategoryVO);
				break;
>>>>>>> Stashed changes
		}


	}

	@Test
	public void testUpdateBox() {
		log.debug("testUpdateBox() invoked.");

		BoxVO box = new BoxVO(
				1093,
				null,
				null,
				"box-edit",
				"box-path-edit",
				"photoname",
				"photopath",
				null
		);
		this.mapper.updateBox(box);
		log.info("\t+ box:{}",box);
	}

	@Test
	public void testDeleteBox() {
		log.debug("testDeleteBox() invoked.");

		int box_no = 1100;

		this.mapper.deleteBox(box_no);

		log.info("\t+ box:{}",box_no);
	}

}
