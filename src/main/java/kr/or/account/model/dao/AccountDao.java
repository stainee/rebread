package kr.or.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.account.model.vo.Account;

@Repository
public class AccountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertOneAccount(Account a) {
		int result = sqlSession.insert("account.insertOneAccount",a);
		return result;
	}
	
}
