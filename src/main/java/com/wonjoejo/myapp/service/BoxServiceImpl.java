package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.*;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.mapper.BoxMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class BoxServiceImpl implements BoxService, InitializingBean, DisposableBean {

	@Setter(onMethod_= { @Autowired})
	private BoxMapper mapper;

	@Override
	public void destroy() throws Exception {
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}


	@Override
	public List<BoxVO> getBoxList(Criteria cri) {
		log.debug("getBoxList() invoked.");

		List<BoxVO> list = this.mapper.selectBoxList(cri);

		list.forEach(log::info);

		return list;
	} // getBoxList

	@Override
	public BoxVO getBox(Integer box_no) {
		log.debug("getBox({}) invoked.",box_no);

		BoxVO box = this.mapper.selectBox(box_no);

		log.info(box);

		return box;
	} // getBox

	@Override
	public boolean createBox(BoxVO box) {
		log.debug("createBox({}) invoked", box);

		int affectedLines = this.mapper.insertBox(box);

		return affectedLines == 1;
	} // createBox

	@Override
	public boolean editBox(BoxVO box) {
		log.debug("editBox({}) invoked",box);

		int affectedLines = this.mapper.updateBox(box);

		return affectedLines == 1;
	} // editBox

	@Override
	public boolean deleteBox(Integer box_no) {
		log.debug("deleteBox({}) invoked",box_no);

		int affectedLines = this.mapper.deleteBox(box_no);

		return affectedLines == 1;
	} // deleteBox

	@Override
	public Integer getTotal() {
		log.debug("getTotal() invoked.");

		return this.mapper.getTotalCount();
	}

	@Override
	public boolean insertCategory(BaseCategoryVO baseCategory) {
		log.debug("insertCategory({}) invoked.",baseCategory);

		int affectedLines = this.mapper.insertCategory(baseCategory);

		return affectedLines == 1;
	} // insertCategory

} // end class
