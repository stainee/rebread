package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

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

	@Transactional
	public Member updateCeo(Member m) {
		int result = dao.updateCeo(m);
		if(result>0) {
			Member member = dao.selectOneCeo(m);
		}
		return null;
	}
	
	
	
}
