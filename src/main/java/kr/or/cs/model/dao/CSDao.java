package kr.or.cs.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cs.model.vo.CS;

@Repository
public class CSDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CS> selectAllCS() {
		List list = sqlSession.selectList("cs.selectAllCS");
		return (ArrayList<CS>)list;
	}

	public int updateCheck(int csNo, int i) {
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		map.put("csNo", csNo);
		map.put("csCheck", i);
		int result = sqlSession.update("cs.updateCheck", map);
		return result;
	}

	public int selectOneCheck(int csNo) {
		return sqlSession.selectOne("cs.selectOneCheck", csNo);
	}

	public int insertCS(CS cs) {
		return sqlSession.insert("cs.insertCS", cs);
	}
}
