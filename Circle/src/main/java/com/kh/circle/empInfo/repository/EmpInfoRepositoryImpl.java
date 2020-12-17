package com.kh.circle.empInfo.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

@Repository
public class EmpInfoRepositoryImpl implements EmpInfoRepository{
	@Autowired
	private SqlSession sqlSession;
	
	//사원 1명의 정보 조회
	@Override
	public EmpInfoAll empInfoOne(String emp_no) {
		
		EmpInfoAll empInfoOne = sqlSession.selectOne("empInfo.searchWithEmpNo", emp_no);
		
		return empInfoOne;
	}

	
	@Override
	public int total(PagingInfo pInfo) {
		
		int total = sqlSession.selectOne("empInfo.total", pInfo);
		
		return total;
	}

	@Override
	public List<EmpInfoAll> empInfoList(PagingInfo pInfo) {
		
		List<EmpInfoAll> empList = sqlSession.selectList("empInfo.empList", pInfo);
		
		return empList;
	}


	@Override
	public String checkPwd(Map<String, Object> map) {
		return sqlSession.selectOne("empInfo.checkPwd", map);
	}

	@Override
	public List<String> compare(EmpInfoAll empInfoAll) {
		HashMap<String, Object> map = sqlSession.selectOne("empInfo.compare", empInfoAll);

		List<String> ucnlist = new ArrayList<String>();

		for(Map.Entry<String, Object> entry : map.entrySet()) {
			ucnlist.add(entry.getValue().toString());
		}
		
		return ucnlist;
	}
	
	@Override
	public String searchWithCol(Map<String, Object> beforeMap) {
		
		String temp = sqlSession.selectOne("empInfo.searchWithCol", beforeMap);
		
		return temp;
				
	}

	@Override
	public Map<String, Object> setAfterCol(EmpInfoAll changeInfo) {
		
		Map<String, Object> map = sqlSession.selectOne("infoModify.colName", changeInfo);
		
		return map;
	}
	
	@Override
	public void addChangeCol(Map<String, Object> compareMap) {
		sqlSession.insert("infoModify.addChange", compareMap);
	}

	@Override
	public void updateChangeInfo(EmpInfoAll changeInfo) {

		sqlSession.update("empInfo.updateChange", changeInfo);
	}


	@Override
	public List<String> deptCodeList() {
		return sqlSession.selectList("empInfo.deptCodeList");
	}


	@Override
	public List<String> deptNameList() {
		return sqlSession.selectList("empInfo.deptNameList");
	}

	@Override
	public List<String> jobCodeList() {
		return sqlSession.selectList("empInfo.jobCodeList");
	}


	@Override
	public List<String> jobNameList() {
		return sqlSession.selectList("empInfo.jobNameList");
	}


	@Override
	public void insert(EmpInfoAll eInfo) {
		sqlSession.insert("empInfo.add", eInfo);
	}


}
