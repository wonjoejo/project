package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.Criteria;

import java.util.List;

public interface BoxService {

	// box list
	public abstract List<BoxVO> getBoxList(Criteria cri);

	// box detail
	public abstract BoxVO getBox(Integer box_no);

	public abstract boolean createBox(BoxVO box);

	public abstract boolean editBox(BoxVO box);

	public abstract boolean deleteBox(Integer box_no);

	public abstract Integer getTotal(String member_id);

	// BaseCategory insert
	public abstract boolean insertCategory(BaseCategoryVO baseCategory);

	public abstract boolean grantMasterPermission(BoxPermissionVO boxPermission);

	public abstract boolean joinBox(String member_id, Integer box_no);

} // end interface
