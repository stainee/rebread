package kr.or.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.NaverLoginBO;
@Controller
public class NaverController {
	//네이버로그인
			/* NaverLoginBO */
			@Autowired
			private NaverLoginBO naverLoginBO;
			@Autowired
			private MemberService service;
			/*
			@Autowired
			private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
				this.naverLoginBO = naverLoginBO;
			}
			*/
			
			//로그인 첫 화면 요청 메소드
			@RequestMapping(value = "/loginFrm.do", method = { RequestMethod.GET, RequestMethod.POST })
			public String login(Model model, HttpSession session) {
				
				/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
				String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
				
				System.out.println("네이버:" + naverAuthUrl);
				
				//네이버 
				model.addAttribute("url", naverAuthUrl);
		 
				return "member/loginFrm";
			}
			
		 
			//네이버 로그인 성공시 callback호출 메소드
			@RequestMapping(value = "/naver_callback.do", method = { RequestMethod.GET, RequestMethod.POST })
			public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
				
				System.out.println("여기는 callback");
				OAuth2AccessToken oauthToken;
		        oauthToken = naverLoginBO.getAccessToken(session, code, state);
		        System.out.println("oauthToken =" +oauthToken);
		        
		        //1. 로그인 사용자 정보를 읽어온다.
				String apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
				System.out.println("apiResult : " + apiResult);
				/** apiResult json 구조
				{"resultcode":"00",
				 "message":"success",
				 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
				**/
				
				//2. String형식인 apiResult를 json형태로 바꿈
				JSONParser parser = new JSONParser();
				Object obj = parser.parse(apiResult);
				JSONObject jsonObj = (JSONObject) obj;
				
				System.out.println("jsonObj = " + jsonObj);
				//3. 데이터 파싱 
				//Top레벨 단계 _response 파싱
				JSONObject response_obj = (JSONObject)jsonObj.get("response");
				//response의 nickname값 파싱
				String memberId = (String)response_obj.get("id");
				System.out.println(memberId);
				String memberName = (String)response_obj.get("name");
				System.out.println(memberName);
				String memberMail = (String)response_obj.get("email");
				System.out.println(memberMail);
				String memberPw = memberId;
				Member user = service.searchId(memberId);
				System.out.println("user :"+ user);
				
				Member m =new Member();
				if(user==null) {
	            	//신규회원가입인경우
	            	m.setMemberId(memberId);
	            	m.setMemberName(memberName);
	            	m.setMemberMail(memberMail);
	            	m.setMemberPw(memberPw);
	            	 /*로그아웃 처리 시, 사용할 토큰 값*/
	            	model.addAttribute("m", m);
	            	return "member/addPropilFrm";
	            }else {
	            	System.out.println("user :" + user);
	            	//신규회원이 아닌경우
	            	session.setAttribute("m", user);
	            	 /*로그아웃 처리 시, 사용할 토큰 값*/
	            	return "redirect:/";
	            }
			}	
}
