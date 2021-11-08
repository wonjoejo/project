package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.GroupMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
@NoArgsConstructor

@Service
public class GroupServiceImpl implements GroupService{

	@Setter(onMethod_= {@Autowired})
	private GroupMapper mapper;

	@Override
	public List<BoxPermissionVO> get(String member_id) {
		return null;
	}

	@Override
	public MemberVO getGroup(String member_id) {
		return null;
	}
}
