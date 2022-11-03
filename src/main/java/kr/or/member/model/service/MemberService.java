package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;

	public ArrayList<Member> selectAllMember() {
		return dao.selectAllMember();
	}

	public Member selectOneMember(int memberNo) {
		return dao.selectOneMember(memberNo);
	}
	
	@Transactional
	public int updateOneMember(Member m) {
		return dao.updateOneMember(m);
	}

	@Transactional
	public int deleteOneMember(int memberNo) {
		return dao.deleteOneMember(memberNo);
	}

	public Member selectOneCeo(Member member) {
		return dao.selectOneCeo(member);
	}

	public Member updateCeo(Member m) {
		// TODO Auto-generated method stub
		int result = dao.updateCeo(m);
		if(result>0) {
			Member member = dao.selectOneCeo(m);
			return member;
		}else {
			return null;
		}
	}
	
	//로그인
	public Member loginMember(Member member) {
		Member m = dao.loginMember(member);
		return m;
	}
	//아이디체크
	public Member idCheck(Member m) {
		Member member = dao.idCheck(m);
		return member;
	}
	//회원가입
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		//String api_key = "NCSYOLUKOEOQOVTE";	
		//구동시에만 아래의 api-key삭제 후 주석 풀어주시기 바랍니다. (20원씩 날라가요 ㅠㅠ)
		
		String api_key = "";
	    String api_secret = "XS3HZOGLMQWOUMH1DIPLFUDIREUPD0VR";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01041390974");  // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[리브레드] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}

	public ArrayList<Member> searchId(Member m) {
		return dao.searchId(m);
	}

	public Member searchPw(Member m) {
		return dao.searchPw(m);
	}
}
