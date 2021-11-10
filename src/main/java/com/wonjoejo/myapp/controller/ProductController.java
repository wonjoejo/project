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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wonjoejo.myapp.domain.ProductDTO;
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
	public void productList(Model model) {
		log.debug("ProductList() invoked.");
		Integer box_id = 1005;

		List<ProductVO> list = this.service.getProductList(box_id);				

		log.info("\t+ list.size:{}",list.size());

		model.addAttribute("list",list);

	} // ProductList

	@GetMapping("/detail")
	public void productDetail(Model model) {
		log.debug("productDetail() invoked.");
		
		Integer product_no = 6;

		ProductVO product = this.service.getProduct(product_no);				

		log.info("\t+ 물품이름: {}", product.getProduct_name());

		model.addAttribute("product",product);		

	} // productDetail
	
	
	
	@PostMapping("/insert")
	public void productInsert(ProductDTO product, RedirectAttributes rttrs) {
		log.debug("productInsert() invoked.");
		
		ProductVO productVO = new ProductVO(
				null,
				product.getBox_no(),
				product.getProduct_name(),
				product.getProduct_memo(),
				product.getProduct_qtn(),
				product.getProduct_photo_name(),
				product.getProduct_photo_path(),
				product.getBarcode(),
				product.getReg_date()
        );

        boolean result = this.service.insertProduct(productVO);
        log.info("\t +result: {}", result);

	} // productInsert
	
	
	@GetMapping("/insertview")	// 물품 작성페이지
	public void productInsertView() {
		log.debug("productInsertView() invoked.");		
	} //productInsertView
	
	
	
	@PostMapping("/edit")
	public void productEdit(ProductDTO product, RedirectAttributes rttrs) {
		log.debug("productEdit() invoked.");
		
		ProductVO productVO = new ProductVO(
				product.getProduct_no(),
				product.getBox_no(),
				product.getProduct_name(),
				product.getProduct_memo(),
				product.getProduct_qtn(),
				product.getProduct_photo_name(),
				product.getProduct_photo_path(),
				product.getBarcode(),
				product.getReg_date()
        );

        boolean result = this.service.editProduct(productVO);
        log.info("\t +result: {}", result);

	} // productEdit
	
	
	
	@PostMapping("/delete")
	public String productDelete(Integer product_no, RedirectAttributes rttrs) {
		log.debug("productDelete() invoked.");
		
        boolean result = this.service.deleteProduct(product_no);
        log.info("\t +result: {}", result);
        
        return "/product/list";

	} // productDelete
	

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
