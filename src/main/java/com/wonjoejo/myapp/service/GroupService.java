package com.wonjoejo.myapp.service;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;

public interface GroupService {
	
	public abstract List<BoxPermissionVO> get(String member_id);
	
	public abstract MemberVO getGroup(String member_id);
	
}

