package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxVO;

public interface BoxService {

	public abstract List<BoxVO> getBoxList(String user_id);

	public abstract BoxVO getBox(Integer box_no);

	public abstract boolean createBox(BoxVO box);

	public abstract boolean editBox(BoxVO box);

	public abstract boolean deleteBox(Integer box_no);

}
