package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.MemberMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_= { @Autowired})
    private MemberMapper mapper;

    @Override
    public boolean register(MemberVO member) {
        return false;
    }

    @Override
    public MemberVO login(String member_id, String password) {
        return null;
    }

    @Override
    public MemberVO logout(String email) {
        return null;
    }

    @Override
    public MemberVO changePwd(String email) {
        return null;
    }

    @Override
    public boolean editMember(MemberVO member) {
        return false;
    }

    @Override
    public boolean deleteAccount(String member_id) {
        return false;
    }
}
