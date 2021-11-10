package com.wonjoejo.myapp.controller;


import com.wonjoejo.myapp.domain.BaseCategoryDTO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.service.BaseCategoryService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Log4j2
@NoArgsConstructor

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Setter(onMethod_={@Autowired})
    private BaseCategoryService service;

    @GetMapping({"/detail", "/edit"})
    public void categoryDetail(Integer box_no, Model model){
        log.debug("categoryDetail({} ,{})", box_no, model);

        BaseCategoryVO baseCategory = this.service.getBaseCategoryList(box_no);
        log.info("\t+ baseCategory: {}", baseCategory);

        model.addAttribute("baseCategory", baseCategory);

    } // categoryDetail

    @PostMapping("/edit")
    public String editBaseCategory(BaseCategoryDTO baseCategory, RedirectAttributes rttrs){
        log.debug("editBaseCategory({}, {}) invoked", baseCategory, rttrs);

        BaseCategoryVO baseCategoryVO = new BaseCategoryVO(
              baseCategory.getCategory_no(),
              baseCategory.getCate_name1(),
              baseCategory.getCate_name2(),
              baseCategory.getCate_name3(),
              baseCategory.getCate_name4(),
              baseCategory.getCate_name5(),
              baseCategory.getBox_no()
        );

        boolean result = this.service.editBaseCategory(baseCategoryVO);
        log.info("\t+ result: {}", result);
        rttrs.addAttribute("box_no", baseCategory.getBox_no());

        return "redirect:/category/detail";
    } //editBaseCategory




} // CategoryController
