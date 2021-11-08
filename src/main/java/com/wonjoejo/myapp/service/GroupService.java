package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxPermissionVO;

public interface GroupService {
	
	public abstract List<BoxPermissionVO> get(String )
	
	public abstract GroupVO getGroup(String member_id);
	
}

