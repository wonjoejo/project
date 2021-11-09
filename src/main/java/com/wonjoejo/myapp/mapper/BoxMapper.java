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
<<<<<<< Updated upstream

	public abstract Integer getTotalCount();
=======
>>>>>>> Stashed changes

} // end interface
