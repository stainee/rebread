package kr.or.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.account.model.dao.AccountDao;
import kr.or.account.model.vo.Account;
import kr.or.payment.model.dao.PaymentDao;
import kr.or.store.model.dao.StoreDao;

@Service
public class AccountService {
	
	@Autowired
	private PaymentDao payDao;
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private AccountDao accountDao;
	
	//테스트 코드
	//@Scheduled(fixedDelay=10000)
	//@Scheduled(cron ="0 0 0 27 10 ?")
	@Transactional
	public void accountSchedule() {
		//<상점번호, 총매출>을 담는 HashMap 가져오기
		HashMap<Integer, Integer> salesByStore = payDao.selectSalesByStore();
		//총 정산 된 계좌 개수
		int result = 0;
		//각 매출을 정산 내역에 저장한다
		for(Integer key: salesByStore.keySet()) {
			//총 매출
			//account에 들어갈 값 정리
			int sales = salesByStore.get(key); 
			int storeNo = key;
			int accountPayment = (int)Math.round(sales*0.95);
			String account = storeDao.selectOneStoreAccount(storeNo);
			
			Account a = new Account();
			a.setStoreNo(storeNo);
			a.setProfit(sales);
			a.setAccountPayment(accountPayment);
			a.setStoreAccount(account);
			
			result += accountDao.insertOneAccount(a);
		}
		//정산 되었는지 확인
		System.out.println(result);
	}

	public ArrayList<Account> selectAccountList(int storeNo) {
		return accountDao.selectAccountList(storeNo);
	}
	

}
