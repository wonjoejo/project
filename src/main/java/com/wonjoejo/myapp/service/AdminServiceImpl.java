package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.AdminMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Setter(onMethod_= { @Autowired})
    private AdminMapper mapper;

    @Override
    public List<MemberVO> viewMemberList(String member_id) {
        return null;
    }

    @Override
    public MemberVO viewMemberDetail(String member_id) {
        return null;
    }

    @Override
    public MemberVO searchMember(String member_id, String name) {
        return null;
    }
}
