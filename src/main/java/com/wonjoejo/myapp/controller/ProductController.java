package com.wonjoejo.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryDTO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.PageDTO;
import com.wonjoejo.myapp.domain.ProductCategoryVO;
import com.wonjoejo.myapp.domain.ProductDTO;
import com.wonjoejo.myapp.domain.ProductVO;
import com.wonjoejo.myapp.service.ProductService;
import com.wonjoejo.myapp.util.UploadFileUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/product")
@Controller
public class ProductController {

    @Setter(onMethod_ = {@Autowired})
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
    public String productListPerPage(@ModelAttribute("cri") Criteria cri, Integer box_no, Model model, HttpSession session) {
        log.debug("productListPerPage({}) invoked.", model);

        cri.setAmount(5);
        List<ProductCategoryVO> list = this.service.getListPerPage(cri);
        log.info("\t+ list size:{}", list.size());
        model.addAttribute("list", list);
        model.addAttribute("member_id", session.getAttribute("member_id"));


        // --- 페이지 처리 --- //

        Integer totalAmount = this.service.getTotalCount(box_no);
        PageDTO pageDTO = new PageDTO(cri, totalAmount);
        model.addAttribute("pageMaker", pageDTO);
        model.addAttribute("box_no", box_no);


        return "/product/list";

    } // productListPerPage

    @GetMapping("/json")
    @ResponseBody
    public String json(Integer box_no) {
        log.info("json({}) invoked.", box_no);
        List<ProductCategoryVO> list = this.service.getProductList(box_no);

        Gson gson = new Gson();
        List<String> jsonList = new ArrayList<>();

        for (ProductCategoryVO product : list) {

            jsonList.add(product.getProduct_name());
            jsonList.add(product.getProduct_memo());
            jsonList.add(product.getCate_name1());
            jsonList.add(product.getCate_name2());
            jsonList.add(product.getCate_name3());
            jsonList.add(product.getCate_name4());
            jsonList.add(product.getCate_name5());
            jsonList.add(product.getCate_detail1());
            jsonList.add(product.getCate_detail2());
            jsonList.add(product.getCate_detail3());
            jsonList.add(product.getCate_detail4());
            jsonList.add(product.getCate_detail5());

        }

        String json = gson.toJson(jsonList);

        log.info("json: {}", json);

        return json;
    }


    @GetMapping("/detail")
    public void productDetail(Integer product_no, Integer box_no, Model model, HttpSession session) {
        log.debug("productDetail() invoked.");

        ProductVO product = this.service.getProduct(product_no);
        log.info("\t+ 물품이름: {}", product.getProduct_name());

        model.addAttribute("product", product);

        // Category Detail
        CategoryVO category = this.service.getCategory(product_no);
        log.info("\t+ category: {}", category);
        model.addAttribute("category", category);

        // BaseCategory Detail
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);
        model.addAttribute("baseCategory", baseCategory);
        model.addAttribute("box_no", box_no);

    } // productDetail

    @GetMapping("/edit")
    public void productEdit(Integer product_no, Integer box_no, Model model, HttpSession session) {
        log.debug("productEdit() invoked.");

        ProductVO product = this.service.getProduct(product_no);
        log.info("\t+ 물품이름: {}", product.getProduct_name());

        model.addAttribute("product", product);

        // Category Detail
        CategoryVO category = this.service.getCategory(product_no);
        log.info("\t+ category: {}", category);
        model.addAttribute("category", category);

        // BaseCategory Detail
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);
        model.addAttribute("baseCategory", baseCategory);
        model.addAttribute("member_id", session.getAttribute("member_id"));
        model.addAttribute("box_no", box_no);
    } // productEdit


    @PostMapping("/insert")
    public String productInsert(ProductDTO product, CategoryDTO category, RedirectAttributes rttrs, MultipartFile file) throws Exception {

        log.debug("productInsert({}, {}) invoked.", product, file);
        
        // upload 할 폴더 경로 지정
        String uploadDir = "product";

        ProductVO productVO;
        
        if (file.getSize() !=0) {
        	String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());

            productVO = new ProductVO(
                    null,
                    product.getBox_no(),
                    product.getProduct_name(),
                    product.getProduct_memo(),
                    product.getProduct_qtn(),
                    uploadedFileName,
                    uploadDir,
                    product.getBarcode(),
                    product.getReg_date()
            );

            boolean result = this.service.insertProduct(productVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
            
        } else {
            productVO = new ProductVO(
                    null,
                    product.getBox_no(),
                    product.getProduct_name(),
                    product.getProduct_memo(),
                    product.getProduct_qtn(),
                    product.getProduct_photo_name(),
                    "/resources/assets/img/",
                    product.getBarcode(),
                    product.getReg_date()
            );

            boolean result = this.service.insertProduct(productVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
        }
        
        

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
        rttrs.addAttribute("box_no", product.getBox_no());

        return "redirect:/product/listPerPage";
    } // productInsert
    


    @GetMapping("/insertview")    // 물품 작성페이지
    public void productInsertView(Integer box_no, Model model, HttpSession session) {
        log.debug("productInsertView() invoked.");

        // BaseCategory Detail
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);
        model.addAttribute("baseCategory", baseCategory);
        model.addAttribute("member_id", session.getAttribute("member_id"));
        model.addAttribute("box_no", box_no);

    } //productInsertView


    @PostMapping("/edit")
    public String productEdit(ProductDTO product, CategoryDTO category, RedirectAttributes rttrs, MultipartFile file) throws Exception  {
        log.debug("productEdit() invoked.");
        
        // upload 할 폴더 경로 지정
        String uploadDir = "product";

        ProductVO productVO;
        
        if (file.getSize() !=0) {
        	String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());

            productVO = new ProductVO(
                    null,
                    product.getBox_no(),
                    product.getProduct_name(),
                    product.getProduct_memo(),
                    product.getProduct_qtn(),
                    uploadedFileName,
                    uploadDir,
                    product.getBarcode(),
                    product.getReg_date()
            );

            boolean result = this.service.editProduct(productVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
            
        } else {
            productVO = new ProductVO(
                    null,
                    product.getBox_no(),
                    product.getProduct_name(),
                    product.getProduct_memo(),
                    product.getProduct_qtn(),
                    product.getProduct_photo_name(),
                    "/resources/assets/img/",
                    product.getBarcode(),
                    product.getReg_date()
            );

            boolean result = this.service.editProduct(productVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
        }

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
        log.info("\t+ result2 : {}", result2);
        rttrs.addAttribute("product_no", product.getProduct_no());
        rttrs.addAttribute("box_no", product.getBox_no());

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


        rttrs.addAttribute("box_no", product.getBox_no());

        return "redirect:/product/list";
    } // productDelete


} // end class
