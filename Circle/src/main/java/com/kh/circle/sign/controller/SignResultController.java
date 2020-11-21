package com.kh.circle.sign.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.circle.sign.vo.SignEmpList;
import com.kh.circle.sign.vo.SignListJoiner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/signResult")
public class SignResultController {
	
	@Autowired
	private SqlSession sqlSession;

	/*
	 * @GetMapping("/signListJoinerCount") public Map<String, Object>
	 * signListJoinerCount(@RequestParam String signCode) { int count =
	 * sqlSession.selectOne("sign.count", signCode);
	 * 
	 * Map<String, Object> map = new HashMap<>(); map.put("count", count);
	 * 
	 * return map; }
	 */
	
	@GetMapping("/signListJoinerCheck")
	public List<SignListJoiner> signJoinerCheck(@RequestParam String signCode) {
		
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoinerCheck", signCode);
		
		return list;
	}
	
	@GetMapping("/signListJoiner")
	public List<SignListJoiner> signJoiner(@RequestParam String signCode) {
		
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoiner", signCode);
		
		return list;
	}

	@GetMapping("/signListWatcher")
	public List<SignListJoiner> signWatcher(@RequestParam String signCode) {
		
		List<SignListJoiner> list = sqlSession.selectList("sign.signWatcher", signCode);
		
		return list;
	}
	
//	@GetMapping("/signTypeContent")
//	public String signTypeContent(@RequestParam String typeCode) {
//		
//		return sqlSession.selectOne("sign.signTypeContent", typeCode);
//	}
	
//	결재 작성 매핑 시작
	@GetMapping("/signTypeContent")
	public Map<String, Object> signTypeContent(@RequestParam String typeCode) {
		
		String result = sqlSession.selectOne("sign.signTypeContent", typeCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		
		return map;
	}
	
}
