package com.wonjoejo.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

@Log4j2
@NoArgsConstructor

@RequestMapping("/group")
@Controller
public class GroupController {

	@Setter(onMethod_ = { @Autowired })
	private GroupService service;

	// 그룹원 목록
	@GetMapping("/grouplist")
	public void grouplist(Model model, Integer box_no, HttpServletRequest req) {

		log.debug("grouplist({},{}) invoked.", model, box_no);
		HttpSession session = req.getSession();
		String loginId = (String) session.getAttribute("member_id");

		List<MemberVO> list = this.service.selectGroupMemberList(box_no);

		List<BoxPermissionMemberVO> permissionList = this.service.selectGroupPermissionList(box_no);

		String masterId = "";

		for (BoxPermissionMemberVO member : permissionList) {
			if (member.getMaster_per() == 0) {
				masterId = member.getMember_id();
			}
		}

		log.info("\t+list.size{}", list.size());
		log.info("\t+masterId{}", masterId);
		log.info("\t+loginId{}", loginId);

		model.addAttribute("list", list);
		model.addAttribute("box_no", box_no);
		model.addAttribute("master_id", masterId);


	}// grouplist

	// groupList json
	@PostMapping(value = "/json", produces = "application/json; charset=utf8")
	@ResponseBody
	public String json(@RequestBody String data) {

		log.info("json({}) invoked.", data);

		JsonElement element = JsonParser.parseString(data);
		Integer box_no = element.getAsJsonObject().get("box_no").getAsInt();

		List<MemberVO> list = this.service.selectGroupMemberList(box_no);

		Gson gson = new Gson();
		String result = gson.toJson(list);

		log.info("result: " + result);

		return result;
	}

	// 그룹원 권한 목록
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

	}// permissionlist

	// 그룹원 가입
	@GetMapping("/join")
	public String join(BoxPermissionDTO boxPermission, RedirectAttributes rttrs) {

		log.debug("join({}) invoked", boxPermission);

		BoxPermissionVO boxPermissionVO = new BoxPermissionVO(null, boxPermission.getMember_id(),
				boxPermission.getBox_no(), boxPermission.getMaster_per(), boxPermission.getWrite_per(),
				boxPermission.getRead_per(), boxPermission.getEdit_per(), boxPermission.getDelete_per(),
				boxPermission.getMember_stat());

		boolean result = this.service.joinGroup(boxPermissionVO);
		log.info("\t +result: {}", result);
		rttrs.addAttribute("result", result);

		return "/group/grouplist";
	}// join

	// 그룹원 권한 설정
	@GetMapping("/editview")
	public void editView(Integer box_no, Model model) {

		List<BoxPermissionMemberVO> list = this.service.selectGroupPermissionList(box_no);

		log.info("\t+list.size{}", list.size());

		model.addAttribute("list", list);
		model.addAttribute("box_no", box_no);

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
				BoxPermissionVO vo = new BoxPermissionVO(null, element.getAsJsonObject().get("member_id").getAsString(),
						element.getAsJsonObject().get("box_no").getAsInt(),
						element.getAsJsonObject().get("master_per").getAsInt(),
						element.getAsJsonObject().get("write_per").getAsInt(),
						element.getAsJsonObject().get("read_per").getAsInt(),
						element.getAsJsonObject().get("edit_per").getAsInt(),
						element.getAsJsonObject().get("delete_per").getAsInt(), 0);

				boolean result = this.service.permissionGroup(vo);
				log.info("result:=== {} ===", result);

			}
		}

		log.info("=====element : {}", array.toString());

	}// permissiongroup

	// 그룹원 검색
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

	// 그룹원 탈퇴
	@PostMapping("/groupout")
	@ResponseBody
	public String deleteMember(@RequestBody String data, HttpServletRequest req, RedirectAttributes rttrs) {

		log.debug("groupout({}) invoked.", data);
		// member_id는 view단에서 넘겨준 id (-> 그룹 탈퇴를 눌렀을 경우에는,
		// 내 아이디이고 마스터가 회원 추방을 눌렀을 경우에는 그룹 회원의 아이디)

		JsonElement element = JsonParser.parseString(data);

		String member_id = element.getAsJsonObject().get("member_id").getAsString();
		Integer box_no = element.getAsJsonObject().get("box_no").getAsInt();

		log.info("member_id({})", member_id);
		log.info("boxNo({})", box_no);

		HttpSession session = req.getSession();
		// 로그인 한 아이디
		String loginId = (String) session.getAttribute("member_id");

		// 박스 넘버와 로그인한 아이디로 마스터인지 확인
		boolean isMaster = this.service.checkMaster(loginId, box_no);

		log.info("isMaster({})", isMaster);

		Gson gson = new Gson();
		String sendData = "";

		// 만약에 마스터면서 탈퇴 버튼을 눌렀을 경우
		if (!isMaster && member_id.equals(loginId)) { // 마스터가 아니면서 로그인한 아이디와 탈퇴 시킬 아이디가 같은 경우 (=탈퇴)
			boolean result = this.service.deleteMember(member_id, box_no, 1);
			rttrs.addAttribute("member_id", loginId);
			sendData = gson.toJson("/box/list");
			return sendData;
		} else if (isMaster && !member_id.equals(loginId)) { // 마스터면서 로그인한 아이디와 탈퇴 시킬 아이디가 다른 경우 (=추방)
			boolean result2 = this.service.deleteMember(member_id, box_no, 1);
			rttrs.addAttribute("box_no", box_no);
			sendData = gson.toJson("/group/editview");
			return sendData;
		}

		
		  sendData = gson.toJson("/group/grouplist");
		  
		  return sendData;
		 
	}// groupout

	// 그룹 마스터 양도
	@GetMapping("/master")
	@ResponseBody
	public String updateMaster(String member_id, Integer box_no, HttpServletRequest req) {

		log.debug("updateMaster({}, {}) invoked.", member_id, box_no);

		HttpSession session = req.getSession();
		String loginId = (String) session.getAttribute("member_id");

		if (member_id.equals(loginId)) {
			return "false";
		}

		// 양도 받는 회원 아이디로 업데이트
		boolean result = this.service.updateMaster(member_id, box_no, 0);

		// 위 업데이트가 됐으면 다음으로 실행
		if (result) {
			// 원래 마스터를 일반 회원으로 업데이트
			boolean result2 = this.service.updateMaster(loginId, box_no, 1);
			log.info("\t+ result: {} / result2: {}", result, result2);
			// 둘다 성공이면
			if (result2) {
				return "true";
			}
			// 둘다 성공이 아니면 실패
		} else {
			return "false";
		}
		return "false";
	} // updateMaster

}// end class
