package com.wonjoejo.myapp.controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.*;
import com.wonjoejo.myapp.service.ProductService;
import com.wonjoejo.myapp.util.QRUtils;
import com.wonjoejo.myapp.util.UploadFileUtils;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    public void excelDownload(HttpServletResponse response, Integer box_no) throws IOException {
        log.info("excelDownload() invoked.");

        // excel poi 설정 부분
        Workbook wb = new SXSSFWorkbook();
        Sheet sheet = wb.createSheet(box_no.toString());
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        CellStyle style = wb.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillBackgroundColor(IndexedColors.GREY_25_PERCENT.index);
        style.setFillBackgroundColor(IndexedColors.GREY_25_PERCENT.index);


        List<ProductCategoryVO> list = this.service.getProductList(box_no);
        BaseCategoryVO baseCategory = this.service.getBaseCategory(box_no);

        // header
        row = sheet.createRow(rowNum++);
        List<String> valueList = new ArrayList<>();
//        valueList.add("NO.");
        valueList.add("물품명");
        valueList.add(baseCategory.getCate_name1());
        valueList.add(baseCategory.getCate_name2());
        valueList.add(baseCategory.getCate_name3());
        valueList.add(baseCategory.getCate_name4());
        valueList.add(baseCategory.getCate_name5());
        valueList.add("수량");
        valueList.add("메모");
        valueList.add("등록날짜");

        List<Integer> temp = new ArrayList<>();
        List<Integer> listNo = new ArrayList<>();

        for (int i = 0; i < valueList.size(); i++) {
            if (valueList.get(i) != null) {
                listNo.add(i);
            } else if (valueList.get(i) == null) {
                temp.add(i);
            }
        }

        for (int i = 0; i < listNo.size(); i++) {
            cell = row.createCell(i);
            cell.setCellStyle(style);
            cell.setCellValue(valueList.get(listNo.get(i)));
        }

        // 여기까지 첫 행 만듦 (제목)

        log.info("listnosize: {}", listNo.size());

        // 전체 밸류값 넣어줌
        List<String> values = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");


        for (ProductCategoryVO product : list) {
//            values.add(product.getProduct_no().toString());
            values.add(product.getProduct_name());
            values.add(product.getCate_detail1());
            values.add(product.getCate_detail2());
            values.add(product.getCate_detail3());
            values.add(product.getCate_detail4());
            values.add(product.getCate_detail5());
            values.add(product.getProduct_qtn().toString());
            values.add(product.getProduct_memo());
            values.add(sdf.format(product.getReg_date()));
        }


        // 해시맵에 키 붙여서 넣어주기
        Map<String, String> cellValue = new HashMap<>();
        int num = 0;
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < valueList.size(); j++) {
                cellValue.put(i + "_" + j, values.get(num++));
            } // j - for
        } // i - for


        // valueList = 가로 cellValue = 해시맵
        int column = 0;
        for (int i = 0; i < cellValue.size(); i++) {
            row = sheet.createRow(rowNum++);
            for (int j = 0; j < valueList.size(); j++) {
                log.info("column값: {} / j 값: {}", column, j);
                if (column > listNo.size() - 1) {
                    column = 0;
                }
                if (!temp.contains(j)) {
                    String key = i + "_" + j;
                    cell = row.createCell(column++);
                    cell.setCellValue(cellValue.get(key));
                }

            }
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
                    "default/",
                    product.getBarcode(),
                    product.getReg_date()
            );

            boolean result = this.service.insertProduct(productVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
        }

        QRUtils qrUtils = new QRUtils();

        String barcodeName = qrUtils.qrMaker(productVO.getProduct_no(), product.getBox_no());
        log.info("\t + barcodeName: {}", barcodeName);

        Boolean isSuccess = this.service.createBarcode(productVO.getProduct_no(), barcodeName);

        log.info("\t +barcode Success: {}", isSuccess);

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
            		product.getProduct_no(),
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
            		product.getProduct_no(),
                    product.getBox_no(),
                    product.getProduct_name(),
                    product.getProduct_memo(),
                    product.getProduct_qtn(),
                    product.getProduct_photo_name(),
                    "default/",
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
        
        rttrs.addAttribute("box_no", product.getBox_no());

        // category 삭제
        boolean result1 = this.service.deleteCategory(product_no);
        log.info("\t +result1(Category): {}", result1);

        // product 삭제
        boolean result2 = this.service.deleteProduct(product_no);
        log.info("\t +result2: {}", result2);

        return "redirect:/product/listPerPage";
    } // productDelete

    @PostMapping(value = "/search", produces = "application/json; charset=utf8")
    @ResponseBody
    public String searchProduct(@RequestBody String data) {
        log.debug("searchProduct({}) invoked.", data);

        JsonElement element = JsonParser.parseString(data);

        List<ProductCategoryVO> list = this.service.searchProduct(
                element.getAsJsonObject().get("keyword").getAsString(),
                element.getAsJsonObject().get("box_no").getAsInt());

        list.forEach(log::info);

        Gson gson = new Gson();


        return gson.toJson(list);
    }

    @PostMapping("/qrcode")
    @ResponseBody
    public void makeQrcode(@RequestBody String data) throws Exception {
        QRUtils qrUtils = new QRUtils();

        JsonElement element = JsonParser.parseString(data);

        String fileName = qrUtils.qrMaker(element.getAsJsonObject().get("product_no").getAsInt(), element.getAsJsonObject().get("box_no").getAsInt());

        log.info("/t + fileName : {}", fileName);

    } // makeQrcode


} // end class
