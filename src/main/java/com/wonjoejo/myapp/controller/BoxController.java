package com.wonjoejo.myapp.controller;

import java.util.List;

import com.wonjoejo.myapp.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wonjoejo.myapp.service.BoxService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@NoArgsConstructor

@RequestMapping("/box")
@Controller
public class BoxController {

    @Setter(onMethod_ = {@Autowired})
    private BoxService service;

    @GetMapping("/list")
    public void list(Model model, Criteria cri) {

        log.debug("list({},{}) invoked.", model, cri);

        List<BoxVO> list = this.service.getBoxList(cri);
        log.info("\t+ list.size:{}", list.size());

        model.addAttribute("list", list);

        // paging
        Integer totalAmount = this.service.getTotal();
        PageDTO dto = new PageDTO(cri, totalAmount);
        model.addAttribute("pageMaker", dto);

    } // getBoxList

    @PostMapping("/create")
    public String create(BoxDTO box, RedirectAttributes rttrs) {

        log.debug("create({}) invoked.", box);

        BoxVO boxVO = new BoxVO(
                null,
                box.getMember_id(),
                box.getBox_mode(),
                box.getBox_name(),
                box.getBox_memo(),
                box.getBox_photo_name(),
                box.getBox_photo_path(),
                null
        );

        boolean result = this.service.createBox(boxVO);
        log.info("\t +result: {}", result);


//		BaseCategory insert
        BaseCategoryVO basecategoryVO = null;
        boolean result2 = false;


        switch (boxVO.getBox_mode()) {
            case 1:
                basecategoryVO = new BaseCategoryVO(
                        null,
                        "종류",
                        "유통기한",
                        "보관방법",
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;

            case 2:
                basecategoryVO = new BaseCategoryVO(
                        null,
                        "종류",
                        "유통기한",
                        "색상",
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;

            case 3:
                basecategoryVO = new BaseCategoryVO(
                        null,
                        "구매자",
                        "구매일자",
                        "종류",
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;

            case 4:
                basecategoryVO = new BaseCategoryVO(
                        null,
                        "구매자",
                        "종류",
                        "색상",
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;

            case 5:

                basecategoryVO = new BaseCategoryVO(
                        null,
                        "종류",
                        "구매일자",
                        "멤버명",
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;

            default:
                basecategoryVO = new BaseCategoryVO(
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        boxVO.getBox_no()
                );
                result2 = this.service.insertCategory(basecategoryVO);
                log.info("\t +category Result:{}", result2);
                break;
        }
      
      		// 박스 마스터권한 부여
		BoxPermissionVO permissionVo = new BoxPermissionVO(
				null,
				boxVO.getMember_id(),
				boxVO.getBox_no(),
				0,
				0,
				0,
				0,
				0,
				0
		);
		boolean result3 = this.service.grantMasterPermission(permissionVo);
		log.info("\t +Permission Result:{}",result3);

		rttrs.addAttribute("result",result);



        return "/box/list";
    } // create

    @PostMapping("/edit")
    public String edit(BoxDTO box, RedirectAttributes rttrs) {

        log.debug("edit({}) invoked.", box);


        BoxVO boxVO = new BoxVO(
                box.getBox_no(),
                box.getMember_id(),
                box.getBox_mode(),
                box.getBox_name(),
                box.getBox_memo(),
                box.getBox_photo_name(),
                box.getBox_photo_path(),
                null
        );

        boolean result = this.service.editBox(boxVO);
        log.info("\t +result: {}", result);
        rttrs.addAttribute("result", result);

        return "/box/list";
    } // edit

    @PostMapping("/delete")
    public String delete(Integer box_no, RedirectAttributes rttrs) {

        log.debug("delete({}) invoked.", box_no);

        boolean result = this.service.deleteBox(box_no);
        log.info("\t +result: {}", result);
        rttrs.addAttribute("\t+ result: {}", result);

        return "/box/list";
    } // delete
  
  	@GetMapping("/createview")
	public void createView() {
		log.debug("createView() invoked.");
	} // createview

} // end class
