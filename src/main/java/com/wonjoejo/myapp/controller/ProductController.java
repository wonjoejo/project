package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.service.BoxService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/product")
@Controller
public class ProductController {

	@Setter(onMethod_= { @Autowired })
	private BoxService service;
	
	@GetMapping("/productlist")
	public void getProductlist(Model model) {

		log.debug("getProductList() invoked.");

		String user_id = "userid3";

		List<BoxVO> boxlist = this.service.getBoxList(user_id);
		log.info("\t+ list.size:{}",boxlist.size());

		model.addAttribute("list",boxlist);

	} // list

} // end class
