package com.wonjoejo.myapp.controller;

import java.util.List;

import com.wonjoejo.myapp.domain.BoxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.service.BoxService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/box")
@Controller
public class BoxController {
	
	@Setter(onMethod_= { @Autowired })
	private BoxService service;
	
	@GetMapping("/boxlist")
	public void getBoxList(Model model) {

		log.debug("getBoxList() invoked.");

		String user_id = "userid3";

		List<BoxVO> list = this.service.getBoxList(user_id);
		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);

	} // list
	

}
