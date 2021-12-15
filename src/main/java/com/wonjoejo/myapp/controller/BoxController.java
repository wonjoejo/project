package com.wonjoejo.myapp.controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.*;
import com.wonjoejo.myapp.service.BoxService;
import com.wonjoejo.myapp.service.GroupService;
import com.wonjoejo.myapp.service.ProductService;
import com.wonjoejo.myapp.util.S3Utils;
import com.wonjoejo.myapp.util.UploadFileUtils;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@NoArgsConstructor

@RequestMapping("/box")
@Controller
public class BoxController {

    S3Utils s3 = new S3Utils();
    String bucketName = "intobox";
    @Setter(onMethod_ = {@Autowired})
    private BoxService service;
    @Setter(onMethod_ = {@Autowired})
    private GroupService groupService;
    @Setter(onMethod_ = {@Autowired})
    private ProductService productService;

    @GetMapping("/list")
    public void list(Model model, Criteria cri, HttpServletRequest req, @RequestParam(value = "result", required = false, defaultValue = "") String box_no) {

        log.debug("list({},{}) invoked.", model, cri);


        HttpSession session = req.getSession();
        String loginId = (String) session.getAttribute("member_id");

        cri.setAmount(6);

        List<BoxVO> list = this.service.getBoxList(cri);
        log.info("\t+ list.size:{}", list.size());

        model.addAttribute("list", list);
        model.addAttribute("member_id", loginId);
        model.addAttribute("result", box_no);
        log.info("boxno: {}", box_no);

        // permission 내용 삭제
        session.removeAttribute("permission");

    } // getBoxList

    @PostMapping("/create")
    public String create(BoxDTO box, RedirectAttributes rttrs, MultipartFile file) throws Exception {

        log.debug("create({},{}) invoked.", box, file);

        // upload 할 폴더 경로 지정
        String uploadDir = "box";

        BoxVO boxVO;

        // 커스텀 이미지 업로드
        if (file.getSize() != 0) { // 기본 이미지 안 올리기 위해서 if문

            // 여기서 함수 불러와서 데이터 넣어줌 (리턴값은 uploadDir 이하 경로 + 파일이름 (/2021/11/14/8c47bd18-b475-4849-beec-a0d3d4d0bd7a_29325736.jpg)
            String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());

//                File targetPath = new File(uploadDir, );
//                file.transferTo(targetPath);

            boxVO = new BoxVO(
                    null,
                    box.getMember_id(),
                    box.getBox_mode(),
                    box.getBox_name(),
                    box.getBox_memo(),
                    uploadedFileName,
                    uploadDir,
                    null,
                    null);

            boolean result = this.service.createBox(boxVO);
            log.info("\t +result: {}", result);

        } else { // 디폴트 이미지 업로드

            boxVO = new BoxVO(
                    null,
                    box.getMember_id(),
                    box.getBox_mode(),
                    box.getBox_name(),
                    box.getBox_memo(),
                    box.getBox_photo_name(),
                    "default/",
                    null,
                    null);

            boolean result = this.service.createBox(boxVO);
            log.info("\t +result: {}", result);

        }


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
        log.info("\t +Permission Result:{}", result3);

//        rttrs.addAttribute("result", result3);
        rttrs.addAttribute("result", boxVO.getBox_no().toString());
        rttrs.addAttribute("member_id", box.getMember_id());


        return "redirect:/box/list";
    } // create

    @PostMapping("/edit")
    public String edit(BoxDTO box, MultipartFile file, RedirectAttributes rttrs) throws Exception {

        log.debug("edit({}) invoked.", box);

        // upload 할 폴더 경로 지정
        String uploadDir = "box";

        BoxVO boxVO;

        if (file.getSize() != 0) {

            // 여기서 함수 불러와서 데이터 넣어줌 (리턴값은 uploadDir 이하 경로 + 파일이름 (/2021/11/14/8c47bd18-b475-4849-beec-a0d3d4d0bd7a_29325736.jpg)
            String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());

            boxVO = new BoxVO(
                    box.getBox_no(),
                    box.getMember_id(),
                    box.getBox_mode(),
                    box.getBox_name(),
                    box.getBox_memo(),
                    uploadedFileName,
                    uploadDir,
                    null,
                    null);

            boolean result = this.service.editBox(boxVO);
            log.info("\t +result: {}", result);
            rttrs.addAttribute("result", result);
        } else if (box.getBox_photo_path().contains("default")) {

            boxVO = new BoxVO(
                    box.getBox_no(),
                    box.getMember_id(),
                    box.getBox_mode(),
                    box.getBox_name(),
                    box.getBox_memo(),
                    box.getBox_photo_name(),
                    "default/",
                    null,
                    null);

            boolean result = this.service.editBox(boxVO);
            log.info("\t +result: {}", result);

        } else {

            boxVO = new BoxVO(
                    box.getBox_no(),
                    box.getMember_id(),
                    box.getBox_mode(),
                    box.getBox_name(),
                    box.getBox_memo(),
                    box.getBox_photo_name(),
                    box.getBox_photo_path(),
                    null,
                    null);
            boolean result = this.service.editBox(boxVO);
            log.info("\t +result: {}", result);

        } // if-else if-else

        rttrs.addAttribute("box_no", box.getBox_no());

        return "redirect:/box/detail";
    } // edit

    @PostMapping("/delete")
    public String delete(Integer box_no, RedirectAttributes rttrs, HttpServletRequest req) {

        log.debug("delete({}) invoked.", box_no);

        boolean result = this.service.deleteBox(box_no);
        log.info("\t +result: {}", result);
        rttrs.addAttribute("\t+ result: {}", result);

        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");
        log.info("id: {}", member_id);

        boolean result2 = this.groupService.deleteBox(box_no, member_id);
        log.info("\t+ group: {} ", result2);
        rttrs.addAttribute("\t+ result2: {}", result2);

        return "/box/list";
    } // delete

    @GetMapping("/createview")
    public void createView() {
        log.debug("createView() invoked.");
    } // createview

    @GetMapping("/editview")
    public void editView(Integer box_no, Model model) {

        log.debug("editView() invoked.");

        BoxVO box = this.service.getBox(box_no);
        log.info("\t +box: {}", box);

        model.addAttribute("box", box);

    } // editview

    @GetMapping("/detail")
    public void get(Integer box_no, Model model, HttpServletRequest req) {
        log.debug("get({}) invoked.", box_no);

        BoxVO box = this.service.getBox(box_no);
        log.info("\t +box: {}", box);

        HttpSession session = req.getSession();
        String loginId = (String) session.getAttribute("member_id");

        // Product List 4개까지 표시
        List<ProductCategoryVO> productList = this.productService.getProductList(box_no);
        List<ProductCategoryVO> list = new ArrayList<>();
        if (productList.size() <= 4) {
            list.addAll(productList);
        } else {
            for (int i = 0; i < 4; i++) {
                list.add(productList.get(i));
            }
        }

        // 멤버 아이디, 박스 번호로 박스 권한 조회
        BoxPermissionVO vo = this.groupService.getPermission(loginId, box_no);
        session.setAttribute("permission", vo);

        model.addAttribute("box", box);
        model.addAttribute("productList", list);
        model.addAttribute("box_no", box_no);

    } // get

    @PostMapping("/join")
    @ResponseBody
    public String joinGroup(@RequestBody String data) { // 아까 stringify한 data
        log.debug("joinGroup({}) invoked.", data);

        JsonElement element = JsonParser.parseString(data);


        boolean result = this.service.joinBox(element.getAsJsonObject().get("member_id").getAsString(),
                element.getAsJsonObject().get("box_no").getAsInt());
        log.info("\t +result: {}", result);

        if (!result) {
            return "false";
        }

        return "/box/list";
    } // joinGroup

    @GetMapping("/check")
    @ResponseBody
    public String checkId(Integer box_no, String member_id, RedirectAttributes rttrs) {
        // 같은 박스에 같은 회원이 이미 존재하는지 중복 검사하는 로직 추가해야 함

        // 박스에 있는 회원 리스트 조회 -> member_id 있는지 확인 -> 있으면 처리하지 않음
        List<MemberVO> groupList = this.groupService.selectGroupMemberList(box_no);
        for (MemberVO member : groupList) {
            log.info("\t+ member_id: {}", member.getMember_id());
            if (member_id.equals(member.getMember_id())) {
                return "false";
            } else {
                break;
            } // if-else
        } // for

        return "true";
    }
} // end class
