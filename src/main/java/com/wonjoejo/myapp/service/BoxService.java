package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.*;

public interface BoxService {

	public abstract List<BoxVO> getBoxList(Criteria cri);

	public abstract BoxVO getBox(Integer box_no);

	public abstract boolean createBox(BoxVO box);

	public abstract boolean editBox(BoxVO box);

	public abstract boolean deleteBox(Integer box_no);

	public abstract Integer getTotal(String member_id);

	// BaseCategory insert
	public abstract boolean insertCategory(BaseCategoryVO baseCategory);

	public abstract boolean grantMasterPermission(BoxPermissionVO boxPermission);

	public abstract List<ProductVO> getProductList(Integer box_no);

	public abstract boolean joinBox(String member_id, Integer box_no);

} // end interface
