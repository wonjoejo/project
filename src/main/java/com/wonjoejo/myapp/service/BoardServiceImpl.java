package com.wonjoejo.myapp.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.BoardVO;
import com.wonjoejo.myapp.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
//@NoArgsConstructor
@AllArgsConstructor

@Service
public class BoardServiceImpl
	implements BoardService, InitializingBean, DisposableBean{

    private BoardMapper mapper;

	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> getList() {
		log.debug(" getList({}) invoked.");
		return this.mapper.getList();
	}
}
