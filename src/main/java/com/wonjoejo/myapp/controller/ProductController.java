package com.wonjoejo.myapp.controller;

import java.util.List;

import com.wonjoejo.myapp.domain.CategoryDTO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.domain.ProductVO;
import com.wonjoejo.myapp.service.ProductService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Log4j2
@NoArgsConstructor

@RequestMapping("/product")
@Controller
public class ProductController {

	@Setter(onMethod_= { @Autowired })
	private ProductService service;
	
	@GetMapping("/list")
	public void getProductList(Model model) {
		log.debug("getProductList() invoked.");

		Integer box_id = 1005;

		List<ProductVO> list = this.service.getProductList(box_id);				

		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);

	} // getProductList

	@GetMapping("/detail")
	public void productDetail(Model model) {
		log.debug("productDetail() invoked.");
		
		Integer product_no = 6;

		List<ProductVO> list = this.service.getProductList(product_no);				

		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);

	} // productDetail

	@PostMapping("/create")
	public String create(ProductDTO product, CategoryDTO category, RedirectAttributes rttrs){
		log.debug("create({}) invoked", product);

		ProductVO productVO = new ProductVO(
				null,
				product.getBox_no(),
				product.getProduct_name(),
				product.getProduct_memo(),
				product.getProduct_qtn(),
				product.getProduct_photo_name(),
				product.getProduct_photo_path(),
				product.getBarcode(),
				null
		);

		boolean result = this.service.insertProduct(productVO);
		log.info("\t+ result: {}", result);

		// Category insert
		CategoryVO categoryVO = new CategoryVO(
				null,
				null,
				product.getProduct_no(),
				category.getCate_detail1(),
				category.getCate_detail2(),
				category.getCate_detail3(),
				category.getCate_detail4(),
				category.getCate_detail5()

		);

		boolean result2 = this.service.insertCategory(categoryVO);
		log.info("\t+ category result2: {}", result2);


		return "/product/list";
	}

} // end class
