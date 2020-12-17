package com.kh.circle.poll.repository;

import java.util.HashMap;
import java.util.List;

import com.kh.circle.poll.entity.Pagination;
import com.kh.circle.poll.entity.PostCode;
import com.kh.circle.poll.entity.PreInputData;
import com.kh.circle.poll.entity.Question;

public interface PollDao {

	List<HashMap<String, String>> homeList(String empNo);
	
	List<HashMap<String, String>> getResult(HashMap<String, String> params);
	
	int countTotalProgressPost(Pagination prePageInfo);
	List<HashMap<String, String>> progressList(Pagination pageInfo);
	
	int countTotalFinishedPost(Pagination prePageInfo);
	List<HashMap<String, String>> finishedList(Pagination pageInfo);
	
	int countTotalMyPost(Pagination prePageInfo);
	List<HashMap<String, String>> myList(Pagination pageInfo);

	List<HashMap<String, String>> getQuestion(HashMap<String, String> params);
	int getTotalAttend(HashMap<String, String> params);
	int getRealAttend(HashMap<String, String> params);
	List<HashMap<String, String>> getQuesRealAttend(HashMap<String, String> params);

	List<HashMap<String, String>> userInfo(String empNo);

	void insertPoll(PreInputData temp, List<Question> questions);

	String insertAttendedServey(List<HashMap<String, String>> list);

	void deleteOne(String postCode);
	List<String> answerSearch(String postCode);
	void deleteMember(String postCode);
	void deleteAttender(List<String> answers);
	int deleteAnswer(String postCode);
	void deleteQuestion(String postCode);
	void deleteAll(PostCode postList);












}
