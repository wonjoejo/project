package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BaseCategoryDTO;
import com.wonjoejo.myapp.domain.BoxDTO;
import com.wonjoejo.myapp.domain.BoxVO;
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

		String user_id = "MEMBERid1";

		List<BoxVO> list = this.mapper.selectBoxList(user_id);
		log.info(list.get(0).getBox_mode());
		list.forEach(log::info);


	} // testGetPersonalList

	@Test
	public void testInsertBox() {
		log.debug("testInsertBox() invoked.");

		Integer box_mode = 1;
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


		if(box_mode==1) {
			BaseCategoryDTO dto = new BaseCategoryDTO("종류","유통기한","보관방법","커스텀1",null,box.getBox_no());
			this.mapper.insertCategory(dto);
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
