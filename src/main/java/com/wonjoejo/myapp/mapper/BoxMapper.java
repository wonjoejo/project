package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.*;

import java.util.List;

public interface BoxMapper {

	public abstract List<BoxVO> selectBoxList(Criteria cri);

	public abstract BoxVO selectBox(Integer box_no);

	public abstract int insertBox(BoxVO box);

	public abstract int updateBox(BoxVO box);

	public abstract int deleteBox(Integer box_no);

	public abstract int insertCategory(BaseCategoryVO baseCategory);

	public abstract Integer getTotalCount();

} // end interface
