package com.kh.circle.project.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.repository.PostDao;
import com.kh.circle.project.entity.ProjFile;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;
import com.kh.circle.project.repository.ProjFileDao;
import com.kh.circle.project.repository.ProjSaveDao;
import com.kh.circle.project.repository.ProjectDao;



@Service
public class ProjectServiceImp implements ProjectService{

	@Autowired
	private ProjectDao projDao;
	
	@Autowired
	private ProjFileDao projFileDao;
	
	@Autowired
	private ProjSaveDao projSaveDao;
	
	@Autowired
	private PostDao postDao;

	@Override
	public List<Project> projIssMain(String pro_code) {
		return projDao.projIssMain(pro_code);
	}


	@Override
	public int countProject() {
		return projDao.countProject();
	}


	@Override
	public String projEmpNo(String emp_no) {
		return projDao.projEmpNo(emp_no);
	}


	@Override
	public List<Project> projMain(String emp_no) {
		return projDao.projMain(emp_no);
	} 




	@Override
	public List<Project> projMember() {
		return projDao.projMember();
	}


	@Override
	public void projInsert(Project project, String emp_no) {

		projDao.projInsert(project, emp_no);
	}


	@Override
	public List<Project> issMember() {
		return projDao.issMember();
	}


	@Override
	public void projInsertIss(Project project,  MultipartFile iss_file, String emp_no) throws IllegalStateException, IOException {
		
		
		String pro_code = projDao.projGetPro(project);
		
		project.setPro_code(pro_code);
		String iss_code = projDao.projInsertIss(project);
		
		
		
		
		if(!iss_file.isEmpty()) {
			
			ProjFile projFile = ProjFile.builder()
									.pro_files_oname(iss_file.getOriginalFilename())
									.pro_files_cname(iss_file.getContentType())
									.pro_files_size(iss_file.getSize())
									.pro_files_code(iss_code)
									.build();
			
		
			String file_code = projFileDao.insert(projFile, iss_code, pro_code, emp_no);
			
			//저장
			projSaveDao.save(iss_file, file_code);
			
			
		}
	}


	@Override
	public List<Project> issProg() {
		return projDao.issProg();
	}


	@Override
	public List<Project> issSitu() {
		return projDao.issSitu();
	}


	@Override
	public List<Project> selecetProject(ProjPaging projPaging) {
		
		return null;
	}


	@Override
	public List<Post> selecePost(PostPaging postPaging) {

		return postDao.selectPost(postPaging);
	}




	@Override
	public List<Project> projIssAll(String emp_no) {
		
		return projDao.projIssAll(emp_no);
	}


	@Override
	public List<Project> projDetail(String pro_code) {
		return projDao.projDetail(pro_code);
	}


	@Override
	public List<Project> projDetail2(String pro_code) {
		
		return projDao.projDetail2(pro_code);
	}


	@Override
	public List<Project> projMemberlist(String pro_code) {
		
		return projDao.projMemberlist(pro_code);
	}


	@Override
	public ResponseEntity<ByteArrayResource> download(String files_code) throws IOException {
		
		
		
		ProjFile file = projFileDao.find(files_code);
		
		
		
		if(file == null) {
			return ResponseEntity.notFound().build();
		}
		
		byte[] data = projSaveDao.load(file.getPro_files_code());
		
		
		ByteArrayResource resource = new ByteArrayResource(data);
		
		
		ResponseEntity<ByteArrayResource> entity =
				ResponseEntity.ok()
				.header("Content-Length", String.valueOf(file.getPro_files_size()))
				.header("Content-Type", "application/octet-stream; charset=UTF-8")
				.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(file.getPro_files_oname(), "UTF-8")+"\"")
				.body(resource);
		
		return entity;
	}


	@Override
	public List<ProjFile> projDetail3(String pro_code) {
		return projDao.projDetail3(pro_code);
	}


	@Override
	public List<Project>  projGetIss(String pro_code) {
		
		return projDao.projGetIss(pro_code);
	}


	@Override
	public List<ProjFile> projIssDetail(String iss_code) {
		return projDao.projIssDetail(iss_code);
	}


	@Override
	public List<Project> projKanban(String pro_code) {
		
		return projDao.projKanban(pro_code);
	}


	@Override
	public String projKanbanHead(String pro_code) {
		
		return projDao.projKanbanHead(pro_code);
	}


	@Override
	public List<ProjFile> projDetail4(String iss_code) {
		return projDao.projDetail4(iss_code);
	}










}
