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

        BoxVO box = this.boxService.getBox(box_no);
        log.info("\t+ box: {}", box);

        model.addAttribute("box", box);





    }; // chart

} // end class
