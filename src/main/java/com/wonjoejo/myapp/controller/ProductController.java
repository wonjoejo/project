package com.wonjoejo.myapp.controller;

import com.google.gson.Gson;
import com.wonjoejo.myapp.domain.*;
import com.wonjoejo.myapp.service.ProductService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Console;
import java.io.IOException;
import java.util.*;

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

//    excel test

    @GetMapping("/excel")
    public void excelDownload(HttpServletResponse response, Integer box_no) throws IOException{
        log.info("excelDownload() invoked.");
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        List<ProductCategoryVO> list = this.service.getProductList(box_no);
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);


        int cellNum = 0;

        // header
        row = sheet.createRow(rowNum++);
        List<String> valueList = new ArrayList<>();
        valueList.add("물품명");
        valueList.add(baseCategory.getCate_name1());
        valueList.add(baseCategory.getCate_name2());
        valueList.add(baseCategory.getCate_name3());
        valueList.add(baseCategory.getCate_name4());
        valueList.add(baseCategory.getCate_name5());
        valueList.add("수량");
        valueList.add("메모");
        valueList.add("등록날짜");

        log.info("카테고리5555 : {}",baseCategory.getCate_name5() );

//        valueList.removeAll(Arrays.asList("",null));

        List<Integer> temp = new ArrayList<>();
        List<Integer> listNo = new ArrayList<>();

        for (int i=0; i < valueList.size(); i++){
            if(valueList.get(i)!= null) {
                listNo.add(i);
            }else if (valueList.get(i) == null) {
                temp.add(i);
            }
        }
        for (int i = 0; i < listNo.size(); i++){
            cell = row.createCell(i);
            cell.setCellValue(valueList.get(listNo.get(i)));

        }

        log.info("listnosize: {}", listNo.size());

        for (ProductCategoryVO product : list){
            List<String> cellValue = new ArrayList<>(
                    Arrays.asList(product.getProduct_name(),
                                    product.getCate_detail1(),
                                    product.getCate_detail2(),
                                    product.getCate_detail3(),
                                    product.getCate_detail4(),
                                    product.getCate_detail5(),
                                    product.getProduct_qtn().toString(),
                                    product.getProduct_memo(),
                                    product.getReg_date().toString()
                            ));

//            Map<Integer, String> cellValue = new HashMap<>();
//            cellValue.put(0_1,product.getProduct_name());
//            cellValue.put(0_2,product.getCate_detail1());
//            cellValue.put(0_3,product.getCate_detail2());
//            cellValue.put(0_4,product.getCate_detail3());
//            cellValue.put(0_5,product.getCate_detail4());
//            cellValue.put(1,product.getCate_detail5());
//            cellValue.put(1,product.get);
//            cellValue.put(1,product.getCate_detail5());
//            cellValue.put(1,product.getCate_detail5());


            row = sheet.createRow(rowNum++);


            for (Integer nonum:temp){
                cellValue.remove(nonum);
            }


            for (int i = 0; i < cellValue.size(); i++){

                    cell = row.createCell(i);
                    cell.setCellValue(cellValue.get(i));

            }



//            cell = row.createCell(0);
//            cell.setCellValue(product.getProduct_name());
//            cell = row.createCell(1);
//            cell.setCellValue(product.getCate_detail1());
//            cell = row.createCell(2);
//            cell.setCellValue(product.getCate_detail2());
//            cell = row.createCell(3);
//            cell.setCellValue(product.getCate_detail3());
//            cell = row.createCell(4);
//            cell.setCellValue(product.getCate_detail4());
//            cell = row.createCell(5);
//            cell.setCellValue(product.getCate_detail5());
//            cell = row.createCell(6);
//            cell.setCellValue(product.getProduct_qtn());
//            cell = row.createCell(7);
//            cell.setCellValue(product.getProduct_memo());
//            cell = row.createCell(8);
//            cell.setCellValue(product.getReg_date());
////            cell = row.createCell(9);
////            cell.setCellValue(product.getBarcode());

        }

        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=list.xlsx");

        wb.write(response.getOutputStream());
        wb.close();

    } // excelDownload

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
