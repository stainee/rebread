package kr.or.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.store.model.dao.StoreDao;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreDetail;

@Service
public class StoreService {
	@Autowired
	private StoreDao dao;

	public ArrayList<Store> selectAllStore() {
		return dao.selectAllStore();
	}

	public StoreDetail selectOneStore(int storeNo) {
		return dao.selectOneStore(storeNo);
	}
	
	public int updateStoreDetail(Store s) {
		return dao.updateStoreDetail(s);
	}

}
