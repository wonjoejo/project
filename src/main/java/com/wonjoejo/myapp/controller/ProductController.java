package com.wonjoejo.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.ProductDTO;
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
	
	@GetMapping("/list")
	public void getlist(Model model) {
		log.debug("getProductList() invoked.");
		
		Integer box_id = 1005;
		List<ProductVO> list = this.service.getProductList(box_id);	

		model.addAttribute("list",list);

	} // getlist

	
	
	@GetMapping("/detail")
	public void detail(Model model) {
		log.debug("productDetail() invoked.");
		
		Integer product_no = 6;
		ProductVO pv = this.service.getProductDetail(product_no);

		model.addAttribute("ProductDetail",pv);
		
	} // detail
	
	
	

} // end class
