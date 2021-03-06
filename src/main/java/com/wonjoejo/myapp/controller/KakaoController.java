package com.wonjoejo.myapp.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
public class KakaoController {

@Setter(onMethod_ = {@Autowired})
private MemberService service;

// 인가코드 받기
@RequestMapping(value = "/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=00ef15c831025dec2d6369d13510dee5"
				+ "&redirect_uri=http://localhost:8090/login/oauth_kakao"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session, ModelAndView modelAndView) throws Exception {
		
		
		session.removeAttribute(MemberController.authKey);
		
		System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        

        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);

        
        String kakaoId = (String)(userInfo.get("email"));
        log.info("아이디 받았니({})", kakaoId);
        
        String kakaoName = (String)userInfo.get("nickname");
        log.info("이름 받았니({})", kakaoName);
        
        String kakaoPhoto = (String)userInfo.get("profile_image_url");
        log.info("프로필 받았니({})", kakaoPhoto);
        
        MemberVO memberVO = null;

        
        if(service.getMember(kakaoName)==null) { // 같은 아이디 없으면 가입시켜쥼
        	log.debug("if 넘어왔니");
        	
        	memberVO 
        	= new MemberVO(
        			kakaoName, 
        			0, 
        			0, 
        			kakaoName, 
        			"12345!!!", 
        			kakaoId,
        			null,
        			kakaoPhoto,
        			null,
        			null,
        			null,
        			null,
        			null
        			);
        	
        	
        	boolean result = service.register(memberVO);
        	log.debug("등록성공했니");
        	
        	if(result == true)
        		//session.setAttribute("member", memberVO);
        		session.setAttribute(MemberController.authKey, memberVO);
        		
        	log.debug("true가 아니니?");	
        	
        	log.debug("등록된거니"); // DB 저장까지 되는데...      
        	log.debug(MemberController.authKey);
        	
        } else {
        	MemberVO vo = new MemberVO(
        			kakaoName, 
        			0, 
        			0, 
        			kakaoName, 
        			"12345!!!", 
        			kakaoId,
        			null,
        			kakaoPhoto,
        			null,
        			null,
        			null,
        			null,
        			null
        			);
        	
        	session.setAttribute(MemberController.authKey, vo);
        			
        }
 
        session.setAttribute("member_id", kakaoName);
        session.setAttribute("photo_name", kakaoPhoto);
        session.setAttribute("name", kakaoName);
        
        
        return "redirect: /";
	} // oauthKakao
	
    // 토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함
            conn.setRequestMethod("POST");
            // URLConnection의 출력 스트림을 사용할지의 여부
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=00ef15c831025dec2d6369d13510dee5");  // 발급받은 key
            sb.append("&redirect_uri=http://localhost:8090/login/oauth_kakao");     // redirect 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) { // readLine은 string으로 타입 고정
                result += line;
            }
            System.out.println("response body : " + result);

            // JSON객체 파싱에 유용한 Gson 라이브러리 활용
            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    } // getAccessToken
	
    // 유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {
    		
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String profile_image_url = kakao_account.getAsJsonObject().get("profile").getAsJsonObject().get("profile_image_url").getAsString();
            
            log.debug(nickname);
            log.debug(email);
            log.debug(profile_image_url);
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("profile_image_url", profile_image_url);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    } // getUserInfo
    
    // 로그아웃
    public void kakaoLogout(String access_Token) {
        //String reqURL = "https://kapi.kakao.com/v1/user/logout";
    	String reqURL="https://kauth.kakao.com/oauth/logout?client_id=00ef15c831025dec2d6369d13510dee5&logout_redirect_uri=http://localhost:8090/";
    	
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
  
    @RequestMapping(value="/logout")
    public String kakaoLogout(HttpSession session) {
    	
        kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        
        return "redirect:/";
    } // kakaoLogout

    
 } // KakaoController