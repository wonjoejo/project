package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.PersonalBoxVO;

public interface BoxService {
	
	public abstract List<PersonalBoxVO> getPersonalBoxList();

}
