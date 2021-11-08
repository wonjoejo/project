package com.wonjoejo.myapp.mapper;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxVO;

public interface GroupMapper {
	
	public abstract List<BoxVO> selectBox(Integer box_no); 
	
}
