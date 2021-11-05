package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BoxDTO;
import com.wonjoejo.myapp.domain.BoxVO;

import java.util.List;

public interface BoxMapper {

	public abstract List<BoxVO> selectBoxList(String user_id);

	public abstract BoxVO selectBox(Integer box_no);

	public abstract int insertBox(BoxVO box);

	public abstract int updateBox(BoxVO box);

	public abstract int deleteBox(Integer box_no);

} // end interface
