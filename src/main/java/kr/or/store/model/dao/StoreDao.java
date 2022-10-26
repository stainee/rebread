package kr.or.store.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreDetail;

@Repository
public class StoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Store> selectAllStore() {
		List list = sqlSession.selectList("store.selectAllStore");
		return (ArrayList<Store>)list;
	}

	public StoreDetail selectOneStore(int storeNo) {
		StoreDetail sd = sqlSession.selectOne("store.selectOneStore",storeNo);
		return sd;
	}

	public int updateStoreDetail(Store s) {
		int result = sqlSession.update("store.updateStoreDetail", s);
		return result;
	}
}
