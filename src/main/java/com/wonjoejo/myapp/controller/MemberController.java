package com.wonjoejo.myapp.controller;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.wonjoejo.myapp.domain.LoginDTO;
import com.wonjoejo.myapp.domain.MemberDTO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.MemberService;
import com.wonjoejo.myapp.util.Email;
import com.wonjoejo.myapp.util.EmailSender;
import com.wonjoejo.myapp.util.UploadFileUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping(value = "/member", method = {RequestMethod.GET, RequestMethod.POST})
@Controller
public class MemberController {

    // 권한
    public static final String authKey = "__AUTH__";

    @Setter(onMethod_ = {@Autowired})
    private MemberService service;

    @Setter(onMethod_ = {@Autowired})
    private Email email;

    @Setter(onMethod_ = {@Autowired})
    private EmailSender emailSender;

    // 회원가입
    @PostMapping("/registerPost")
    public String register(MemberDTO member, RedirectAttributes rttrs, MultipartFile file) throws Exception {
        log.debug("register({}, {}) invoked.", member, file);

        // upload 할 폴더 경로 지정
        String uploadDir = "profile";
        MemberVO memberVO;
        String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());

        // 멤버 타입
        if (member.getMember_type() == 0) { // 개인
            if (file.getSize() != 0) { // 프로필 있음
                memberVO = new MemberVO(
                        member.getMember_id(),
                        0,
                        0,
                        member.getName(),
                        member.getPassword(),
                        member.getEmail(),
                        member.getPhone_number(),
                        uploadedFileName,
                        uploadDir,
                        null,
                        null,
                        null,
                        null
                );

                boolean result = this.service.register(memberVO);
                log.info("\t + 개인 프로필 result: {}", result);
                rttrs.addAttribute("result", result);

            } else { // 디폴트
                memberVO = new MemberVO(
                        member.getMember_id(),
                        0,
                        0,
                        member.getName(),
                        member.getPassword(),
                        member.getEmail(),
                        member.getPhone_number(),
                        member.getPhoto_name(),
                        member.getPhoto_name(),
                        null,
                        null,
                        null,
                        null
                );
                boolean result = this.service.register(memberVO);
                log.info("\t +개인 디폴트 result: {}", result);
                rttrs.addAttribute("result", result);

            }    // photo if-else

        } else { // 기업
            if (file.getSize() != 0) { // 프로필 있음
                memberVO = new MemberVO(
                        member.getMember_id(),
                        1,
                        0,
                        member.getName(),
                        member.getPassword(),
                        member.getEmail(),
                        member.getPhone_number(),
                        uploadedFileName,
                        uploadDir,
                        member.getCompany_name(),
                        null,
                        null,
                        null
                );

                boolean result = this.service.register(memberVO);
                log.info("\t + 기업 프로필 result: {}", result);
                rttrs.addAttribute("result", result);

            } else { // 디폴트
                memberVO = new MemberVO(
                        member.getMember_id(),
                        1,
                        0,
                        member.getName(),
                        member.getPassword(),
                        member.getEmail(),
                        member.getPhone_number(),
                        member.getPhoto_name(),
                        member.getPhoto_name(),
                        member.getCompany_name(),
                        null,
                        null,
                        null
                );

                boolean result = this.service.register(memberVO);
                log.info("\t +기업 디폴트 result: {}", result);
                rttrs.addAttribute("result", result);

            } // photo if-else

        } // member-type if-else

        return "/member/loginIndex";
    } // register

    // 로그인
    @PostMapping("/loginPost")
    public String loginPost(
            LoginDTO dto, Model model, HttpSession session) throws Exception {

        log.debug("loginPost({}) invoked.", dto);

        MemberVO member = this.service.login(dto);
        log.info("\t+ member: {}", member);

        if (member != null) {

            model.addAttribute(MemberController.authKey, member);

            //자동 로그인 처리 추가 (rememberMe)
            if (dto.getRememberMe() != null) { // on

                String member_id = dto.getMember_id();
                String session_id = session.getId();

                long now = System.currentTimeMillis();

                long timeAmount = 60 * 60 * 24 * 7 * 1000; // 일주일..
                Date rememberAge = new Date(now + timeAmount);

                this.service.editMemberWithRememberMe(member_id, session_id, rememberAge);
            } // if

            log.info("여기왔나");

        } else { // 11.27 지수 -> 로그인 실패 alert 추가
        	
			model.addAttribute("msg", "");
			model.addAttribute("url", "/member/login");
			
			return "/member/alert";
    	}//if else
        
		return "/member/login";
            
    } // loginPost

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        log.debug("logout({}) invoked.", session);

        session.removeAttribute(MemberController.authKey);

        log.info("\t+ Sesson ID to be destroyed: {}", session.getId());

        session.invalidate();
        session = null;

        return "redirect:/";

    } // logout

    // 회원 정보 수정
    @PostMapping("/edit")
    public String edit(MemberDTO member, RedirectAttributes rttrs, MultipartFile file, HttpSession session) throws Exception {
        log.debug("edit({}) invoked.", member);

        // upload 할 폴더 경로 지정
        String uploadDir = "profile";

        MemberVO memberVO;
		String uploadedFileName = UploadFileUtils.uploadFile(uploadDir, file.getOriginalFilename(), file.getBytes());
		
		log.info(file.getOriginalFilename());
		
		// 멤버 타입
		if(member.getMember_type()==0 ) { // 개인
			if(file.getSize()!=0) { // 프로필 있음
				memberVO = new MemberVO(
						member.getMember_id(),
						0,
						0,
						member.getName(),
						member.getPassword(),
						member.getEmail(),
						member.getPhone_number(),
						uploadedFileName,
	                    uploadDir,
						null,
						null,
						null,
						null
				);
					
				boolean result = this.service.editMember(memberVO);
				log.info("\t + 개인 프로필 result: {}",result);
				rttrs.addAttribute("result",result);
				session.setAttribute("photo_name", member.getPhoto_name());
	            session.setAttribute("photo_path", member.getPhoto_path());
				
			} else { // 디폴트
				memberVO = new MemberVO(
						member.getMember_id(),
						0,
						0,
						member.getName(),
						member.getPassword(),
						member.getEmail(),
						member.getPhone_number(),
						member.getPhoto_name(),
						member.getPhoto_path(),
						null,
						null,
						null,
						null
				);
				boolean result = this.service.editMember(memberVO);
				log.info("\t +개인 디폴트 result: {}",result);
				rttrs.addAttribute("result",result);
				session.setAttribute("photo_name", member.getPhoto_name());
	            session.setAttribute("photo_path", member.getPhoto_path());
	            
			}	// photo if-else 
			
		} else { // 기업
			if(file.getSize()!=0) { // 프로필 있음
				memberVO = new MemberVO(
						member.getMember_id(),
						1,
						0,
						member.getName(),
						member.getPassword(),
						member.getEmail(),
						member.getPhone_number(),
						uploadedFileName,
						uploadDir,
						member.getCompany_name(),
						null,
						null,
						null
				);
				
				boolean result = this.service.editMember(memberVO);
				log.info("\t + 기업 프로필 result: {}",result);
				rttrs.addAttribute("result",result);
				session.setAttribute("photo_name", member.getPhoto_name());
	            session.setAttribute("photo_path", member.getPhoto_path());
				
			} else { // 디폴트
				memberVO = new MemberVO(
						member.getMember_id(),
						1,
						0,
						member.getName(),
						member.getPassword(),
						member.getEmail(),
						member.getPhone_number(),
						member.getPhoto_name(),
						member.getPhoto_path(),
						member.getCompany_name(),
						null,
						null,
						null
				);
				
				boolean result = this.service.editMember(memberVO);
				log.info("\t +기업 디폴트 result: {}",result);
				rttrs.addAttribute("result",result);
				session.setAttribute("photo_name", member.getPhoto_name());
	            session.setAttribute("photo_path", member.getPhoto_path());
				
			} // photo if-else
			
		} // member-type if-else
		
		rttrs.addAttribute("member_id",member.getMember_id());
		session.setAttribute("photo_name", member.getPhoto_name());
        session.setAttribute("photo_path", member.getPhoto_path());
		
		return "redirect:/member/myPage?member_id={member_id}";
		
	} // edit
	
	
	// 회원 탈퇴 -> memberstatus : 1
	@PostMapping("/delete")
	public String delete(String member_id, RedirectAttributes rttrs) {
		log.debug("delete({}) invoked.",member_id);

		boolean result = this.service.deleteAccount(member_id);
		log.info("\t +result: {}",result);
		rttrs.addAttribute("\t+ result: {}",result);

		return "redirect:/member/logout";
	} // delete

	@GetMapping("/login")
	public void login() {

	}
	
	@GetMapping(value = {"/register", "/loginIndex"})
	public void register() {

	}


	@GetMapping("/myPage")
	public void edit(String member_id, Model model, HttpSession session) {
		log.debug("myPage invoked.");

		MemberVO member = this.service.getMember(member_id);
		log.info("\t+ member: {}", member);

		model.addAttribute("member", member);
		session.setAttribute("photo_name", member.getPhoto_name());
        session.setAttribute("photo_path", member.getPhoto_path());
		
		
		
	} // edit
  


	@GetMapping(value = "/profile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String profile(String member_id) {
		log.debug("profile({}) invoked.", member_id);

		MemberVO member = this.service.getMember(member_id);
		log.info("\t+ member: {}", member);

		Gson gson = new Gson();

		return gson.toJson(member);

	} // profile
  
  
  	// 아이디 체크 // 21.11.26. 지수
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(String member_id){
        log.debug("idCheck({}) invoked.", member_id);
        
        int cnt = this.service.idCheck(member_id);
        
        return cnt;
    } // idCheck
  
    // 아이디 찾기
    @PostMapping(value = "/findId", produces = "application/json; charset=utf8")
    @ResponseBody
    public MemberVO findId(@Param("name") String name, @Param("email") String email) throws Exception {
        log.debug("findId({} , {}) invoked.", name, email);

        MemberVO member = this.service.findId(email, name);

        log.info("========= member{}", member);

        return member;
    } // findId
  
    // 아이디, 이메일 일치 여부
    @PostMapping(value = "/findPw", produces = "application/json; charset=utf8")
    @ResponseBody
    public MemberVO findPw(@Param("member_id") String member_id, @Param("email") String email) throws Exception {
        log.debug("findPw({} , {}) invoked.", member_id, email);

        MemberVO member = this.service.findPw(member_id, email);

        log.info("========= member{}", member);

        return member;
    } // findPw

    // 임시 비밀번호 설정
    @PostMapping(value = "/newPassword", produces = "application/json; charset=utf8")
    @ResponseBody
    public String newPassword(@Param("member_id") String member_id) throws IOException {
//        Random r = new Random();
//        int num = r.nextInt(89999) + 10000;
//        String npassword = "bapsi" + Integer.toString(num);
        String npassword = UUID.randomUUID().toString().replace("-","");
        npassword = npassword.substring(0,10);

        log.info("\t+ 임시비밀번호 : {}" + npassword);

        boolean result = this.service.changePwd(npassword, member_id);

        log.info("\t + result: {}", result);

        Gson gson = new Gson();
        return gson.toJson(member_id);
    } // newPassword

  // 이메일 전송
    @PostMapping(value = "/findPassword" , produces = "application/json; charset=utf8")
    @ResponseBody
    public String findPasswordOK(String member_id, HttpSession session) throws Exception {

        MemberVO memberVO = this.service.getMember(member_id);

        email.setContent("임시 비밀번호는 " + memberVO.getPassword() + " 입니다. \n임시 비밀번호로 로그인 후, 마이페이지에서 비밀번호 변경 부탁드립니다.");
        email.setReceiver(memberVO.getEmail());
        email.setSubject("[IntoBox] 안녕하세요. " + memberVO.getName() + "님,  재설정된 비밀번호를 확인해주세요.");
        emailSender.SendEmail(email);

        log.info("email: {}" + email);

        Gson gson = new Gson();
        return gson.toJson("/login");
    } //findPasswordOK
    
    
} // end class
