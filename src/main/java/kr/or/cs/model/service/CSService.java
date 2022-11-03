package kr.or.cs.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.cs.model.dao.CSDao;
import kr.or.cs.model.vo.CS;

@Service
public class CSService {
	
	@Autowired
	private CSDao dao;

	public ArrayList<CS> selectAllCS() {
		return (ArrayList<CS>)dao.selectAllCS();
	}

	@Transactional
	public int updateCheck(int csNo, int i) {
		// TODO Auto-generated method stub
		return dao.updateCheck(csNo, i);
	}

	public int selectOneCheck(int csNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCheck(csNo);
	}

	public int insertCS(CS cs) {
		return dao.insertCS(cs);
	}
}
