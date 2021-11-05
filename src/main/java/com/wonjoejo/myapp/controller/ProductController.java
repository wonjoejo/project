package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.ProductVO;
import com.wonjoejo.myapp.service.ProductService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/product")
@Controller
public class ProductController {

	@Setter(onMethod_= { @Autowired })
	private ProductService service;
	
	@GetMapping("/productlist")
	public void getProductList(Model model) {
		log.debug("getProductList() invoked.");
		
		Integer box_id = 1005;

		List<ProductVO> list = this.service.getProductList(box_id);				

		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);

	} // getProductList

	
	
	@GetMapping("/productdetail")
	public void productDetail(Model model) {
		log.debug("productDetail() invoked.");
		
		Integer product_no = 6;

		List<ProductVO> list = this.service.getProductList(product_no);				

		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);
		

	} // productDetail

} // end class
