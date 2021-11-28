package com.wonjoejo.myapp.controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.*;
import com.wonjoejo.myapp.service.BoxService;
import com.wonjoejo.myapp.service.ProductService;
import com.wonjoejo.myapp.util.QRUtils;
import com.wonjoejo.myapp.util.UploadFileUtils;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.apache.poi.hssf.record.LabelSSTRecord;
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

@RequestMapping("/chart")
@Controller
public class ChartController {

    @Setter(onMethod_ = {@Autowired})
    private ProductService productService;

    @Setter(onMethod_ = {@Autowired})
    private BoxService boxService;

    @GetMapping("/get")
    public void chart(Integer box_no, Model model){
        log.debug("chart({}) invoked.", box_no);

        // 박스 디테일
        BoxVO box = this.boxService.getBox(box_no);
        log.info("\t+ box: {}", box);

        model.addAttribute("box", box);

        // 물품 총 개수
        Integer totalAmount = this.productService.getTotalCount(box_no);
        log.info("\t+ total: {}" , totalAmount);
        model.addAttribute("totalAmount",totalAmount);

        // Top5 물품 리스트
        List<ProductVO> topproductList = this.productService.getTopProductList(box_no);
        List<ProductVO> toplist = new ArrayList<>();

        if (topproductList.size() <= 5) {
            toplist.addAll(topproductList);
        } else {
            for (int i = 0; i < 5; i++) {
                toplist.add(topproductList.get(i));
            }
        }

        model.addAttribute("topProductList", toplist);

        // 최신 입고 물품
        List<ProductVO> dateProductList = this.productService.getDateProductList(box_no);
        List<ProductVO> dateList = new ArrayList<>();

        if (dateProductList.size() <= 5) {
            dateList.addAll(dateProductList);
        } else {
            for (int i = 0; i < 5; i++) {
                dateList.add(dateProductList.get(i));
            }
        }


        model.addAttribute("dateProductList", dateList);


    }; // chart

} // end class
