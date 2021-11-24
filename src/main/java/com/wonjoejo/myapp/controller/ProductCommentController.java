package com.wonjoejo.myapp.controller;


import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.Criteria;
import com.wonjoejo.myapp.domain.PageDTO;
import com.wonjoejo.myapp.domain.ProductCommentVO;
import com.wonjoejo.myapp.service.ProductCommentService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@NoArgsConstructor

@RequestMapping("/comment")
@Controller
public class ProductCommentController {

    @Setter(onMethod_= {@Autowired})
    private ProductCommentService service;

    @GetMapping(value = "/list")
    @ResponseBody
    public List<ProductCommentVO> list(@ModelAttribute("criteria") Criteria cri, Model model, @RequestParam Integer product_no) throws Exception{
        log.debug("list() invoked.");
        List<ProductCommentVO> list = this.service.getList(product_no);
        log.info("\t list.size:{}" , list.size());

        model.addAttribute("commentList", list);

        Integer totalAmount = this.service.getTotal(product_no);
        PageDTO pageDTO = new PageDTO(cri, totalAmount);

        model.addAttribute("pageMaker", pageDTO);

        return list;
    } // list

    @PostMapping(value = "/insert", produces = "application/json; charset=utf8")
    @ResponseBody
    public String insertComment(@RequestBody String data){
        log.debug("insertComment({}) invoked.", data);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(data);

        ProductCommentVO comment = new ProductCommentVO(
                null,
                element.getAsJsonObject().get("member_id").getAsString(),
                element.getAsJsonObject().get("product_no").getAsInt(),
                element.getAsJsonObject().get("comment_content").getAsString(),
                null
        );

        boolean result = this.service.createComment(comment);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        log.info("json: {}", json);

        return json;
    } // insertComment

    @PostMapping(value = "/edit", produces = "application/json; charset=utf8")
    @ResponseBody
    public String editComment(@RequestBody String data){
        log.debug("editComment({}) invoked.", data);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(data);

        ProductCommentVO comment = new ProductCommentVO(
                element.getAsJsonObject().get("comment_no").getAsInt(),
                element.getAsJsonObject().get("member_id").getAsString(),
                element.getAsJsonObject().get("product_no").getAsInt(),
                element.getAsJsonObject().get("comment_content").getAsString(),
                null
        );

        boolean result = this.service.editComment(comment);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        log.info("json: {}", json);

        return json;
    } // editComment

    @PostMapping(value = "/delete", produces = "application/json; charset=utf8")
    @ResponseBody
    public String deleteComment(@RequestBody String data){
        log.debug("deleteComment({}) invoked.", data);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(data);

        Integer comment_no = element.getAsJsonObject().get("comment_no").getAsInt();

        boolean result = this.service.deleteComment(comment_no);

        Gson gson = new Gson();
        String json = gson.toJson(result);

        log.info("json: {}", json);

        return json;
    } // deleteComment





} // end class
