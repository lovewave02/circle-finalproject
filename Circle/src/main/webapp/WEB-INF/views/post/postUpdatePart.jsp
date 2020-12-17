<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<style>
.wrapper {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.wrapper .title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}

.wrapper .form {
	width: 100%;
	height: 600px;
}

.wrapper .form .inputfield {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.wrapper .form .inputfield label {
	width: 200px;
	color: #34495e;
	margin-right: 10px;
	font-size: 14px;
}

.wrapper .form .inputfield .input, .wrapper .form .inputfield .textarea
	{
	width: 100%;
	outline: none;
	border: 1px solid #d5dbd9;
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 3px;
	transition: all 0.3s ease;
}

.wrapper .form .inputfield .textarea {
	width: 100%;
	height: 400px;
	resize: none;
}

.wrapper .form .inputfield  .post_select {
	position: relative;
	width: 100%;
	height: 37px;
}

.wrapper .form .inputfield  .post_select:before {
	content: "";
	position: absolute;
	top: 12px;
	right: 10px;
	border: 8px solid;
	border-color: #d5dbd9 transparent transparent transparent;
	pointer-events: none;
}

.wrapper .form .inputfield  .post_select select {
position: absolute;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: none;
	width: 100%;
	height: 100%;
	border: 0px;
	padding: 8px 10px;
	font-size: 15px;
	border: 1px solid #d5dbd9;
	border-radius: 3px;
}

.wrapper .input:focus, .wrapper .form .inputfield .textarea:focus,
	.wrapper .form .inputfield  .post_select select:focus {
	border: 1px solid #34495e;
}

.wrapper  p {
	font-size: 14px;
	color: #34495e;
}




.wrapper .form .inputfield .btn1{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #fec107;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left: 44.7%
}

.wrapper .form .inputfield .btn1:hover{
  background: #ffd658;
}
.wrapper .form .inputfield .btn2{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #fec107;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:51.7%
}

.wrapper .form .inputfield .btn2:hover{
  background: #ffd658;
}
.wrapper .form .inputfield .btn3{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #fec107;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:58%
}

.wrapper .form .inputfield .btn3:hover{
  background: #ffd658;
}

.wrapper .form .inputfield:last-child{
  margin-bottom: 0;
}

}

</style>



<div class="wrapper" id="post">

	<div class="form" id="post">

		<div class="title">게시글 작성</div>
		<form name="postUpdate" id="postUpdate"
			action="${pageContext.request.contextPath}/post/postUpdate"
			method="POST">
			<div class="inputfield">
				<label for="post_title">제목</label> <input type="text" class="input"
					id="post_title" name="post_title" value="${postCheck.post_title }">
			</div>
			<!-- <div class="inputfield">
			<label for="post_file">파일</label> 
			<input name="post_file" id="post_file" type="file" class="input" accept="*.*" multiple="multiple">
		</div> -->
			<div class="inputfield"></div>
			<div class="inputfield">
				<label for="post_comt">본문</label>
				<textarea class="textarea" id="post_comt" name="post_comt">${postCheck.post_comt}</textarea>
			</div>
			<div class="inputfield">
				<label for="post_sec">공개</label>
				<div class="post_select">
					<label><input type="radio" id="post_sec" name="post_sec"
						value="Y" checked>공개</label> <label><input type="radio"
						id="post_sec" name="post_sec" value="N">비공개</label>
				</div>
			</div>

			<div class="inputfield">
				<input type="hidden" name="post_code"
					value="${postCheck.post_code }"> <input type="submit"
					value="글쓰기" class="btn1" name="submit" id="submit"> <input
					type="button" value="돌아가기" class="btn3" name="return" id="return">

			</div>
		</form>
	</div>
</div>
