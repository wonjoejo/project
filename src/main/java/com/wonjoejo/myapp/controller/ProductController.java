package com.wonjoejo.myapp.controller;

import java.util.List;

import com.wonjoejo.myapp.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
//	@GetMapping("/list")
//	public void productList(Model model) {
//		log.debug("ProductList() invoked.");
//		Integer box_id = 1005;
//
//		List<ProductVO> list = this.service.getProductList(box_id);				
//
//		log.info("\t+ list.size:{}",list.size());
//
//		model.addAttribute("list",list);
//
//	} // ProductList
	
	
	@GetMapping("/listPerPage")
	public String productListPerPage(@ModelAttribute("cri") Criteria cri, Integer box_no, Model model) {
		log.debug("productListPerPage({}) invoked.", model);
		
		cri.setAmount(5);
 		List<ProductCategoryVO> list = this.service.getListPerPage(cri);
 		log.info("\t+ list size:{}",list.size());
 		model.addAttribute("list",list);
 		
 		
 		// --- 페이지 처리 --- //
 		
 		Integer totalAmount = this.service.getTotalCount(box_no); 
 		PageDTO pageDTO = new PageDTO(cri,totalAmount);
 		model.addAttribute("pageMaker",pageDTO);
 		
 		

 		return "/product/list";

	} // productListPerPage
	
	

	@GetMapping("/detail")
	public void productDetail(Integer product_no, Integer box_no, Model model) {
		log.debug("productDetail() invoked.");

		ProductVO product = this.service.getProduct(product_no);
		log.info("\t+ 물품이름: {}", product.getProduct_name());

		model.addAttribute("product", product);

		// Category Detail
		CategoryVO category = this.service.getCategory(product_no);
		log.info("\t+ category: {}" , category);
		model.addAttribute("category", category);

		// BaseCategory Detail
		BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
		log.info("\t+ baseCategory: {}", baseCategory);
		model.addAttribute("baseCategory", baseCategory);

	} // productDetail

	@GetMapping("/edit")
	public void productEdit(Integer product_no, Integer box_no, Model model) {
		log.debug("productEdit() invoked.");

		ProductVO product = this.service.getProduct(product_no);
		log.info("\t+ 물품이름: {}", product.getProduct_name());

		model.addAttribute("product", product);

		// Category Detail
		CategoryVO category = this.service.getCategory(product_no);
		log.info("\t+ category: {}" , category);
		model.addAttribute("category", category);

		// BaseCategory Detail
		BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
		log.info("\t+ baseCategory: {}", baseCategory);
		model.addAttribute("baseCategory", baseCategory);

	} // productEdit

	
	
	@PostMapping("/insert")
	public String productInsert(ProductDTO product, CategoryDTO category, RedirectAttributes rttrs) {

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
		rttrs.addAttribute("result", result);

		// Category insert
		CategoryVO categoryVO = new CategoryVO(
				null,
				null,
				productVO.getProduct_no(),
				category.getCate_detail1(),
				category.getCate_detail2(),
				category.getCate_detail3(),
				category.getCate_detail4(),
				category.getCate_detail5()
		);

		boolean result2 = this.service.insertCategory(categoryVO);
		log.info("\t+ category result2: {}", result2);
		rttrs.addAttribute("result2", result2);

		return "/product/list";
	} // productInsert
	
	
	@GetMapping("/insertview")	// 물품 작성페이지
	public void productInsertView(Integer box_no, Model model) {
		log.debug("productInsertView() invoked.");

		// BaseCategory Detail
		BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
		log.info("\t+ baseCategory: {}", baseCategory);
		model.addAttribute("baseCategory", baseCategory);

	} //productInsertView
	
	
	@PostMapping("/edit")
	public String productEdit(ProductDTO product, CategoryDTO category, RedirectAttributes rttrs) {
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

		// Category 수정
		CategoryVO categoryVO = new CategoryVO(
				category.getIdx(),
				category.getCategory_no(),
				category.getProduct_no(),
				category.getCate_detail1(),
				category.getCate_detail2(),
				category.getCate_detail3(),
				category.getCate_detail4(),
				category.getCate_detail5()
		);

		boolean result2 = this.service.editCategory(categoryVO);
		log.info("\t+ result2 : {}",result2);
		rttrs.addAttribute("product_no" , product.getProduct_no());
		rttrs.addAttribute("box_no" , product.getBox_no());

		return "redirect:/product/detail";
	} // productEdit
	
	
	
	@PostMapping("/delete")
	public String productDelete(Integer product_no, ProductDTO product, RedirectAttributes rttrs) {
		log.debug("productDelete({}) invoked.", product_no);


		// category 삭제
		boolean result1 = this.service.deleteCategory(product_no);
		log.info("\t +result1(Category): {}", result1);

		// product 삭제
        boolean result2 = this.service.deleteProduct(product_no);
        log.info("\t +result2: {}", result2);


		rttrs.addAttribute("box_no" , product.getBox_no());

        return "redirect:/product/list";
	} // productDelete
	

} // end class
