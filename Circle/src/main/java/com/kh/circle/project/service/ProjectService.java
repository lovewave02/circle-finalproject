package com.kh.circle.project.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.ProjFile;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;

public interface ProjectService {


	List<Project> projIssMain(String pro_code);

	List<Project> projMain(String emp_no);

	int countProject();

	String projEmpNo(String emp_no);


	List<Project> projMember();

	void projInsert(Project project, String emp_no);

	List<Project> issMember();

	void projInsertIss(Project project, MultipartFile iss_file, String emp_no) throws IllegalStateException, IOException;

	List<Project> issProg();
 
	List<Project> issSitu();

	List<Project> selecetProject(ProjPaging projPaging);

	List<Post> selecePost(PostPaging postPaging);


	List<Project> projIssAll(String emp_no);

	List<Project> projDetail(String pro_code);

	List<Project> projDetail2(String pro_code);


	List<Project> projMemberlist(String pro_code);



	List<ProjFile> projDetail3(String pro_code);

	List<Project> projGetIss(String pro_code);

	ResponseEntity<ByteArrayResource> download(String files_code) throws UnsupportedEncodingException, IOException;

	List<ProjFile> projIssDetail(String iss_code);

	List<Project> projKanban(String pro_code);

	String projKanbanHead(String pro_code);

	List<ProjFile> projDetail4(String iss_code);


}
