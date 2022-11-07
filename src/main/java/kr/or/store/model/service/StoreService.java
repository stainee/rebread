package kr.or.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.product.model.dao.ProductDao;
import kr.or.product.model.vo.Product;
import kr.or.store.model.dao.StoreDao;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreDetail;
import kr.or.store.model.vo.StoreListDetail;
import kr.or.store.model.vo.StorePageData;

@Service
public class StoreService {
	@Autowired
	private StoreDao dao;
	@Autowired 
	private ProductDao pdao;

	public ArrayList<Store> selectAllStore() {
		return dao.selectAllStore();
	}

	public StoreDetail selectOneStore(int storeNo) {
		return dao.selectOneStore(storeNo);
	}
	
	public StoreListDetail selectOneStoreDetail(int storeNo) {
		return dao.selectOneStoreDetail(storeNo);
	}
	
	public int updateStoreDetail(Store s) {
		return dao.updateStoreDetail(s);
	}
	
	//별점포함 가져오는 매장 상세페이지 
	public StoreDetail selectOneStore2(int storeNo) {
		Store s = dao.selectOneStore2(storeNo);
		ArrayList<Product> lossList = pdao.selectLossList(storeNo);
		ArrayList<Product> nomalList = pdao.selectNomalList(storeNo);
		StoreDetail sd = new StoreDetail();
		sd.setS(s);
		sd.setLossList(lossList);
		sd.setNomalList(nomalList);
		System.out.println(s);
		System.out.println(lossList);
		System.out.println(nomalList);
		return sd;
	}
	//매장 전체페이지 리스트와 페이지 네비
	public StorePageData selectStoreList(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Store> list = dao.selectStoreList(map);

		int totalCount = dao.selectStoreCount();
		// 전체 페이지 수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		// 페이지 네비 길이
		int pageNaviSize = 5;
		int pageNo = 1;
		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}
		// pageNavi생성 시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='/storeList.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/storeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/storeList.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		StorePageData spd = new StorePageData(list, pageNavi, reqPage, numPerPage);
		return spd;
	}

}
