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
}
