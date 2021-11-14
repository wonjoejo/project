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

import javax.servlet.http.HttpSession;

@Log4j2
@NoArgsConstructor

@Service
public class BoxServiceImpl implements BoxService, InitializingBean, DisposableBean {

	@Setter(onMethod_= { @Autowired})
	private BoxMapper mapper;

	@Override
	public void destroy() throws Exception {
		
	} // destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		
	} // afterPropertiesSet


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
	public Integer getTotal(String member_id) {
		log.debug("getTotal() invoked.");

		return this.mapper.getTotalCount(member_id);
	} // getTotal

	@Override
	public boolean insertCategory(BaseCategoryVO baseCategory) {
		log.debug("insertCategory({}) invoked.",baseCategory);

		int affectedLines = this.mapper.insertCategory(baseCategory);

		return affectedLines == 1;
	} // insertCategory

	@Override
	public boolean grantMasterPermission(BoxPermissionVO boxPermission) {
		log.debug("grantMasterPermission({}) invoked.",boxPermission);

		int affectedLines = this.mapper.insertMasterPermission(boxPermission);

		return affectedLines == 1;
	} // grantMasterPermission

	@Override
	public List<ProductVO> getProductList(Integer box_no) {
		log.debug("getProductList({}) invoked.",box_no);

		List<ProductVO> productList = this.mapper.getProductList(box_no);
		log.info("\t+ productList: {}",productList);

		return productList;
	} // getProductList

	@Override
	public boolean joinBox(String member_id, Integer box_no) {
		log.debug("joinBox({},{}) invoked.",box_no,member_id);

		int affectedLines = this.mapper.insertGroup(member_id,box_no);

		return affectedLines == 1;
	}


} // end class
