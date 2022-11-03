package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member>)list;
	}

	public Member selectOneMember(int memberNo) {
		Member m = sqlSession.selectOne("member.selectOneMember", memberNo);
		return m;
	}

	public int updateOneMember(Member m) {
		return sqlSession.update("member.updateOneMember", m); 
	}

	public int deleteOneMember(int memberNo) {
		return sqlSession.delete("member.deleteOneMember", memberNo);
	}

	public Member selectOneCeo(Member member) {
		Member m = sqlSession.selectOne("member.selectOneCeo",member);
		return m;
	}

	public int updateCeo(Member m) {
		int result = sqlSession.update("member.updateCeo",m);
		return result;
	}
	
	//로그인
	public Member loginMember(Member member) {
		Member m = sqlSession.selectOne("member.loginMember", member);
		return m;
	}
	public Member idCheck(Member m) {
		return sqlSession.selectOne("member.idCheck", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);
	}

	public ArrayList<Member> searchId(Member m) {
		List list = sqlSession.selectList("member.searchId", m);
		return (ArrayList<Member>)list;
	}

	public Member searchPw(Member m) {
		return sqlSession.selectOne("member.searchPw", m);
	}

	public int updatePwMember(Member m) {
		return sqlSession.update("member.updatePw",m);
	}

	public Member checkPwMember(Member m) {
		return sqlSession.selectOne("member.pwCheck", m);
	}

	public Member searchId(String memberId) {
		return sqlSession.selectOne("member.kakaoSearchId", memberId);
	}


}
