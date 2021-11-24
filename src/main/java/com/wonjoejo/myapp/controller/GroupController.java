package com.wonjoejo.myapp.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.BoxPermissionDTO;
import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.GroupService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@NoArgsConstructor

@RequestMapping("/group")
@Controller
public class GroupController {

	@Setter(onMethod_ = {@Autowired})
	private GroupService service;

	//그룹원 목록
	@GetMapping("/grouplist")
	public void grouplist(Model model, Integer box_no) {

		log.debug("grouplist({},{}) invoked.", model, box_no);

		List<MemberVO> list = this.service.selectGroupMemberList(box_no);

		log.info("\t+list.size{}", list.size());

		model.addAttribute("list", list);
		model.addAttribute("box_no", box_no);

	}//grouplist

	// groupList json
	@PostMapping(value = "/json", produces = "application/json; charset=utf8")
	@ResponseBody
	public String
	json(@RequestBody String data) {

		log.info("json({}) invoked.", data);

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		Integer box_no = element.getAsJsonObject().get("box_no").getAsInt();

		List<MemberVO> list = this.service.selectGroupMemberList(box_no);

		Gson gson = new Gson();
		String result = gson.toJson(list);

		log.info("result: " + result);

		return result;
	}

	//그룹원 권한 목록
	@GetMapping("/permissionlist")
	public void permissionlist(Model model, Integer box_no, HttpServletRequest req) {

		log.debug("permissionlist({},{}) invoked.", model, box_no);

		List<BoxPermissionMemberVO> list = this.service.selectGroupPermissionList(box_no);

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute(MemberController.authKey);

		boolean isMaster = this.service.checkMaster(member.getMember_id(), box_no);

		log.info("\t+list.size{}", list.size());

		model.addAttribute("list", list);
		model.addAttribute("isMaster", isMaster);
		model.addAttribute("box_no", box_no);

	}//permissionlist 

	//그룹원 가입
	@GetMapping("/join")
	public String join(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {
		
		log.debug("join({}) invoked", boxPermission);
		
		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(
				null,
				boxPermission.getMember_id(),
				boxPermission.getBox_no(), 
				boxPermission.getMaster_per(), 
				boxPermission.getWrite_per(), 
				boxPermission.getRead_per(),
				boxPermission.getEdit_per(), 
				boxPermission.getDelete_per(), 
				boxPermission.getMember_stat()
				);
		
		boolean result = this.service.joinGroup(boxPermissionVO);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("result",result);
		
		return "/group/grouplist";
	}// join 
	
	//그룹원 권한 설정 
	@GetMapping("/editview")
	public void editView(Integer box_no, Model model) {
		
		List<BoxPermissionMemberVO> list = this.service.selectGroupPermissionList(box_no);
		
		log.info("\t+list.size{}",list.size());
		
		model.addAttribute("list",list);
		model.addAttribute("box_no",box_no);
		
	}

	@PostMapping("/edit")
	@ResponseBody
	public void edit(@RequestBody String object) {

		log.debug("grouppermission({}) invoked.", object);

		JsonArray array = (JsonArray) JsonParser.parseString(object);

		System.out.println("====size====" + array.size());


		if (!array.isEmpty()) {
			for (int i = 0; i < array.size(); i++) {

				JsonElement element = array.get(i);
				BoxPermissionVO vo = new BoxPermissionVO(
						null,
						element.getAsJsonObject().get("member_id").getAsString(),
						element.getAsJsonObject().get("box_no").getAsInt(),
						element.getAsJsonObject().get("master_per").getAsInt(),
						element.getAsJsonObject().get("write_per").getAsInt(),
						element.getAsJsonObject().get("read_per").getAsInt(),
						element.getAsJsonObject().get("edit_per").getAsInt(),
						element.getAsJsonObject().get("delete_per").getAsInt(),
						0
				);

				boolean result = this.service.permissionGroup(vo);
				log.info("result:=== {} ===", result);

			}
		}


		log.info("=====element : {}", array.toString());

	}//permissiongroup
	
	//그룹원 탈퇴
	@GetMapping("/groupout")
	public String groupout(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {
	
		log.debug("groupout({}) invoked.", boxPermission);

		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(
				boxPermission.getNo(),
				boxPermission.getMember_id(),
				boxPermission.getBox_no(),
				boxPermission.getMaster_per(),
				boxPermission.getWrite_per(),
				boxPermission.getRead_per(),
				boxPermission.getEdit_per(),
				boxPermission.getDelete_per(),
				boxPermission.getMember_stat()
		);

		boolean result = this.service.outGroup(boxPermissionVO);
		log.info("\t +result: {}", result);
		rttrs.addAttribute("result", result);

		return "/group/grouplist";
	}//groupout

	@GetMapping("/find")
	@ResponseBody
	public String findMember(String keyword) {

		log.debug("findMember({}) invoked.", keyword);

		String member_id = this.service.findMember(keyword);

		log.info(member_id);

		Gson gson = new Gson();
		String result = gson.toJson(member_id);

		log.info(result);

		return result;

	} // findMember

	@GetMapping("/master")
	@ResponseBody
	public String updateMaster(String member_id, Integer box_no, HttpServletRequest req) {

		log.debug("updateMaster({}, {}) invoked.", member_id, box_no);

		HttpSession session = req.getSession();
		String loginId = (String) session.getAttribute("member_id");

		boolean result = this.service.updateMaster(member_id, box_no, 0);

		if (result) {
			boolean result2 = this.service.updateMaster(loginId, box_no, 1);
			log.info("\t+ result: {} / result2: {}", result, result2);
			if (result2) {
				return "true";
			}
		} else {
			return "false";
		}
		return "false";
	} // updateMaster

}//end class
