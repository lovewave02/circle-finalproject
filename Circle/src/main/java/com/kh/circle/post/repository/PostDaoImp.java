package com.kh.circle.post.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;

import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

@Repository
public class PostDaoImp implements PostDao {

	@Autowired
	private SqlSession sqlSession;

	int noOfRecords;

// postMain page 진입 : 전체 게시판 : 공지 + 전사
	@Override
	public List<Post> postMain(Model model) {

		List<Post> postMain = sqlSession.selectList("postMain");
		model.addAttribute("postMain", postMain);

		return postMain;
	}

//post  종류별 게시판 list
	@Override
	public List<Post> postParts(String post_type) {

		List<Post> postParts = sqlSession.selectList("post.postParts", post_type);

		return postParts;
	}

	@Override
	public int countPost() {

		int num = sqlSession.selectOne("post.postCount");
		return num;
	}

	@Override
	public List<Post> selectPost(PostPaging postPaging) {

		System.out.println("dao : " + postPaging);

		List<Post> paging = sqlSession.selectList("post.postSelect", postPaging);

		System.out.println("pppppp " + paging);
		return paging;
	}

	// 작성하기
	@Override
	public List<Post> insertType() {

		List<Post> post_type = sqlSession.selectList("post.postType");
		return post_type;
	}

	@Override
	public String postEmpInfo(String emp_no) {

		String emp_name = sqlSession.selectOne("post.empInfo", emp_no);

		return emp_name;
	}

	@Override
	public void postInsert(Post post) {

		sqlSession.insert("post.postInsert", post);

	}
	
	//상세보기

	@Override
	public List<Post> viewDetail(String post_code) {

		List<Post> post = sqlSession.selectList("post.postView", post_code);

		return post;
	}

	
	@Override
	public void CountDetail(String post_code) {

		sqlSession.update("CountDetail", post_code);

	}
	//수정하기

	@Override
	public void postUpdate(Post post) {
		
		System.out.println("ppppppppppppppdao" + post);
		sqlSession.update("postUpdate", post);
		
	}

	@Override
	public List<Post> postCheck(String post_code) {

		List<Post> post = sqlSession.selectList("post.postCheck", post_code);
		
		return post;
	}

}