package com.wonjoejo.myapp.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import com.wonjoejo.myapp.domain.PersonalBoxVO;
import com.wonjoejo.myapp.mapper.BoxMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class BoxServiceImpl implements BoxService, InitializingBean, DisposableBean {
	
	private BoxMapper mapper;

	@Override
	public void destroy() throws Exception {
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}

	@Override
	public List<PersonalBoxVO> getPersonalBoxList() {
		
		log.debug("getPersonalBoxList() invoked.");
		
		List<PersonalBoxVO> list = this.mapper.getPersonalBoxList();
		
		return list;
	}
	
	

}
