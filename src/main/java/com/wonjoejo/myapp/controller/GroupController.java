package com.wonjoejo.myapp.controller;

import com.wonjoejo.myapp.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor


@RequestMapping("/group")
@Controller
public class GroupController {

	@Setter(onMethod_= {@Autowired})
	private GroupService service;
	
	
}
