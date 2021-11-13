package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.*;

import java.util.List;

public interface BoxMapper {

	public abstract List<BoxVO> selectBoxList(Criteria cri);

	public abstract BoxVO selectBox(Integer box_no);

	public abstract int insertBox(BoxVO box);

	public abstract int updateBox(BoxVO box);

	public abstract int deleteBox(Integer box_no);

	// BaseCategory insert (박스 생성 시)
	public abstract int insertCategory(BaseCategoryVO baseCategory);

	// Master Permission insert  (박스 생성 시)
	public abstract int insertMasterPermission(BoxPermissionVO boxPermission);

	public abstract Integer getTotalCount();

	public abstract List<ProductVO> getProductList(Integer box_no);

} // end interface
