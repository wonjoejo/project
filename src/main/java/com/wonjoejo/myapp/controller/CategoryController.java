package com.wonjoejo.myapp.controller;


import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.DeleteCategoryVO;
import com.wonjoejo.myapp.service.BaseCategoryService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Log4j2
@NoArgsConstructor

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Setter(onMethod_ = {@Autowired})
    private BaseCategoryService service;

    @GetMapping("/detail")
    public void categoryDetail(Integer box_no, Model model, HttpSession session){
        log.debug("categoryDetail({} ,{})", box_no, model);

        BaseCategoryVO baseCategory = this.service.getBaseCategoryList(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);

        model.addAttribute("baseCategory", baseCategory);
        model.addAttribute("member_id", session.getAttribute("member_id"));
        model.addAttribute("box_no", box_no);

        List<AllCategoryVO> allCategory = this.service.getCategoryList(box_no);

        model.addAttribute("allCategory", allCategory);

    } // categoryDetail

    // 비동기 취소 버튼시 ..
    @GetMapping(value = "/detailList")
    @ResponseBody
    public BaseCategoryVO detailList(Integer box_no) {

        BaseCategoryVO baseCategory = this.service.getBaseCategoryList(box_no);

        return baseCategory;
    }

    @PostMapping(value = "/edit", produces = "application/json; charset=utf8")
    @ResponseBody
    public String editBaseCategory(@RequestBody String data) {
        log.debug("editBaseCategory({}) invoked", data);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(data);


        BaseCategoryVO baseCategoryVO = new BaseCategoryVO(
                element.getAsJsonObject().get("category_no").getAsInt(),
                element.getAsJsonObject().get("cate_name1").getAsString(),
                element.getAsJsonObject().get("cate_name2").getAsString(),
                element.getAsJsonObject().get("cate_name3").getAsString(),
                element.getAsJsonObject().get("cate_name4").getAsString(),
                element.getAsJsonObject().get("cate_name5").getAsString(),
                element.getAsJsonObject().get("box_no").getAsInt()
        );


        boolean result1 = this.service.editBaseCategory(baseCategoryVO);


        Gson gson = new Gson();
        String result = gson.toJson(result1);

        log.info("result: {}", result);

        return result;

    } //editBaseCategory

    @PostMapping(value = "/deleteCategory", produces = "application/json; charset=utf8")
    @ResponseBody
    public String deleteCategory(@RequestBody String data){
        log.debug("deleteCategory({}) invoked.", data);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(data);

        BaseCategoryVO baseCategoryVO = new BaseCategoryVO(
                element.getAsJsonObject().get("category_no").getAsInt(),
                element.getAsJsonObject().get("cate_name1").getAsString(),
                element.getAsJsonObject().get("cate_name2").getAsString(),
                element.getAsJsonObject().get("cate_name3").getAsString(),
                element.getAsJsonObject().get("cate_name4").getAsString(),
                element.getAsJsonObject().get("cate_name5").getAsString(),
                element.getAsJsonObject().get("box_no").getAsInt()

        );
        boolean result1 = this.service.editBaseCategory(baseCategoryVO);

        // cate_detail "" 으로 ..
        String selectedNum = element.getAsJsonObject().get("selectedNum").getAsString();
        String rowName = "cate_detail" + selectedNum;
        log.info(rowName);

        boolean result2 = this.service.deleteCategory(element.getAsJsonObject().get("category_no").getAsInt(), rowName);

        Gson gson = new Gson();
        String result = gson.toJson(result1);

        log.info("result: {}",result);


        return result;

    } //deleteCategory



} // CategoryController