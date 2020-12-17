package com.kh.circle.sign.service;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.circle.sign.vo.SignReplyInsert;
import com.kh.circle.sign.vo.SignType;
import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignService {
	
	// 결재 등록
	void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException;

	// 결재 첨부 파일 등록
	void insertFile(String files_oname, long files_size, String files_type, String files_cname, String files_route);	

	//결재 댓글 등록
	void insertReply(SignReplyInsert signReplyInsert);

	//결재 서명 파일 등록
	void insertFilesSignature(String files_oname, long files_size, String files_type, String files_cname, String files_route, String iempCode);

	//결재 동의 댓글 등록
	void insertReplyAgree(String empCode, String signCode, String fileCode);

	
	
	// 결재 첨부 파일 다운로드
	ResponseEntity<ByteArrayResource> download(String fileCode) throws IOException;

	//결재 서명 파일 다운로드
	ResponseEntity<ByteArrayResource> sfsdownload(String fileCode) throws IOException;
	
	
	
	//결재 서명 파일 삭제 업데이트
	void update(String fileCode);

	//결재 댓글 삭제
	void deleteSignReply(String replyCode);

	//결재 문서 양식 등록
	void insert(SignType signType);

	//결재 타입 삭제
	void deleteSignType(String typeCode);
}
	