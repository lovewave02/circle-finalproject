<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signWrite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="../sign/signLeftBar.jsp" />
	</div>
	<div class="container">
		<form id="formArea" method="post" enctype="multipart/form-data">
			<div class="contentBar">
				<jsp:include page="../sign/signModifyBar.jsp" />
				<div class="signHomeListBar">
					<button class="signListBtn" type="submit">수정하기</button>
					<!-- <a>문서번호</a> -->
					<input type="text" class="sign_code" name="sign_code" value="${signModify.sign_code}" readonly> 
				</div>
				<div class="content">
					<div class="formBox">
						<table>
							<tr>
								<th class="formBox1">작성자</th>
								<th class="formBox2"><input type="text" class="formInput1" id="emp_info_name" value="${empInfo.emp_info_name}" readonly>
									<input type="text" class="formInput1" id="sign_emp_code" name="sign_emp_code" value="${empInfo.emp_info_emp_no}" readonly> 
									<input type="text" class="formInput1" id="sign_count" name="sign_count" readonly></th>
								<th class="formBox1">직급</th>
								<th class="formBox2"><input type="text" class="formInput1" id="job_info_name" value="${empInfo.job_info_name}" readonly></th>
							</tr>
							<tr>
								<th class="formBox1">보존 연한</th>
								<th class="formBox2">
									<select class="formSelect1" id="sign_keep" name="sign_keep">
											<option value="0">보존 연한을 선택하세요</option>
											<option value="365" <c:if test="${signModify.sign_keep eq '365'}">selected</c:if>>1 년</option>
											<option value="1095" <c:if test="${signModify.sign_keep eq '1095'}">selected</c:if>>3 년</option>
											<option value="1825" <c:if test="${signModify.sign_keep eq '1825'}">selected</c:if>>5 년</option>
											<option value="3650" <c:if test="${signModify.sign_keep eq '3650'}">selected</c:if>>10 년</option>
											<option value="NULL" <c:if test="${signModify.sign_keep eq NULL}">selected</c:if>>영구</option>
									</select>
								</th>
								<th class="formBox1">보안 등급</th>
								<th class="formBox2">
									<select class="formSelect1" id="sign_acc" name="sign_acc">
											<option value="0">보안 등급을 선택하세요</option>
											<option value="1" <c:if test="${signModify.sign_acc eq '1'}">selected</c:if>>S 등급</option>
											<option value="2" <c:if test="${signModify.sign_acc eq '2'}">selected</c:if>>A 등급</option>
											<option value="3" <c:if test="${signModify.sign_acc eq '3'}">selected</c:if>>B 등급</option>
											<option value="4" <c:if test="${signModify.sign_acc eq '4'}">selected</c:if>>C 등급</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="formBox1">문서 유형</th>
								<th class="formBox4" colspan="3">
									<select class="formSelect2" id="sign_type_code" name="sign_type_code">
											<option value="${signModify.sign_type_code}" selected>${signModify.sign_type_name}</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="formBox1">제목</th>
								<th class="formBox4" colspan="3"><input type="text" class="formInput2" id="sign_title" name="sign_title" value="${signModify.sign_title}"></th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
							<tr>
								<th class="formBox8">첨부 파일</th>
								<th class="formBox7" colspan="3">
									<div id="fileUpload" class="dragAndDropDiv">파일을 여기에 드래그해서 추가하세요</div>
											<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
									<c:forEach var="file" items="${list3}">
										<div class='statusbar'>
											<div class='filename' onclick="location.href='${pageContext.request.contextPath}/signResult/signFileDownload?fileCode=${file.files_code}'">${file.files_oname}</div>
											<div class='filesize'>${file.files_size}</div>
											<div class='filecode' style='display: none;'></div>
										</div>
									</c:forEach>
								</th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
						</table>
						<div class="formBox5" id="editor"></div>
						<textarea id="sign_note" name="sign_note">${signModify.sign_note}</textarea>
					</div>
					<div class="formRight">
						<div>
							<div class="formBtn1" id="signJoinerBtn" onclick="signJoiner();" style="color:grey;">결재자 등록</div>
							<div class="joinAlert">결재자가 저장되었습니다</div>
							<div class="joinForm1">
								<%-- <div>
									<img src="${pageContext.request.contextPath}/resources/img/sign/arrow2.png" class="joinArrow">
								</div> --%>
								<div class="joinForm2">
									<div class="joinForm3">
										<!-- <input type="text" class="joinerSearchBox" placeholder="&nbsp;사번/이름/직급/부서 검색"> -->
										<input type="text" class="searchTitle" value="결재자를 왼쪽으로 드래그해서 등록하세요" readonly>
									</div>
									<div class="joinForm4">
										<div class="joinForm5">
											<div class="joinForm7">
												<div class="joinForm8">
													<input type="text" class="joinInput1" value="구성원 목록" readonly>
												</div>
												<div class="joinForm9">
													<!-- 구성원 출력될 자리 -->
													<div id="resultBox1" class="connectedSortable">
														<c:forEach var="emp" items="${list2}">
															<ul class="resultBackground">
																<li class="result0"><img src="${pageContext.request.contextPath}/resources/img/test/user.png" class="resultImg"></li>
																<li class="result1"><c:out value="${emp.emp_info_emp_no}" /></li>
																<li class="result2"><c:out value="${emp.emp_info_name}" /></li>
																<li class="result3"><c:out value="${emp.job_info_name}" />/<c:out value="${emp.dept_info_name}" /></li>
															</ul>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										<div class="joinForm6">
											<!-- <div class="joinBtn1">>></div>
												<div class="joinBtn1"><<</div> -->
										</div>
										<div class="joinForm5">
											<div class="joinForm7">
												<div class="joinForm8">
													<input type="text" class="joinInput1" value="결재자 목록" readonly>
												</div>
												<div class="joinForm9">
													<!-- 구성원 출력될 자리 -->
													<div id="resultBox2" class="connectedSortable">
														<table>
															<tbody>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="formResult1">
							<table id="joiner">
								<tbody>
								</tbody>
							</table>
						</div>
						<div>
							<br>
						</div>
						<div>
							<div class="formBtn1" id="signWatcherBtn" onclick="signWatcher();" style="color:grey;">참조자 등록</div>
							<div class="watcherAlert">참조자가 저장되었습니다</div>
							<div class="watcherForm1">
								<div class="watcherForm2">
									<div class="watcherForm3">
										<input type="text" class="searchTitle" value="참조자를 왼쪽으로 드래그해서 등록하세요" readonly>
									</div>
									<div class="watcherForm4">
										<div class="watcherForm5">
											<div class="watcherForm7">
												<div class="watcherForm8">
													<input type="text" class="joinInput1" value="구성원 목록" readonly>
												</div>
												<div class="watcherForm9">
													<!-- 구성원 출력될 자리 -->
													<div id="resultBox3" class="connectedSortable">
														<c:forEach var="emp" items="${list2}">
															<ul class="resultBackground">
																<li class="result0"><img src="${pageContext.request.contextPath}/resources/img/test/user.png" class="resultImg"></li>
																<li class="result1"><c:out value="${emp.emp_info_emp_no}" /></li>
																<li class="result2"><c:out value="${emp.emp_info_name}" /></li>
																<li class="result3"><c:out value="${emp.job_info_name}" />/<c:out value="${emp.dept_info_name}" /></li>
															</ul>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										<div class="watcherForm6"></div>
										<div class="watcherForm5">
											<div class="watcherForm7">
												<div class="watcherForm8">
													<input type="text" class="joinInput1" value="참조자 목록" readonly>
												</div>
												<div class="watcherForm9">
													<!-- 구성원 출력될 자리 -->
													<div id="resultBox4" class="connectedSortable">
														<table>
															<tbody>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>	
							</div>							
						</div>
						<div class="formResult2">
							<table id="watcher">
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- SCRIPT 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 새로고침 감지 -->
	<script>
		window.onbeforeunload = function(e) {
	 	   var dialogText = 'Dialog text here';
		    e.returnValue = dialogText;
		    return dialogText;
		};
		
		window.onunload = function () {
		    sessionStorage.removeItem('joiner');
		    sessionStorage.removeItem('watcher');
		};
	</script>
	<script>
		$(document).submit(function(){
			onbeforeunload = false;
		});
	</script>	
	
<!-- 왼쪽바 고정 추가 옵션 시작 -->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
		});
	</script>

<!-- TUI EDITOR -->
	<script>
		var editor = new toastui.Editor({
			el : document.querySelector("#editor"),
			height : "630px",
			initialEditType : "wysiwyg",
		});
	</script>

<!-- 수정 폼 로드 시 가져올 일부 본문 값 -->
	<script>
		$(document).ready(function(){
			var note = $('#sign_note').val();
			editor.setHtml(note);
		});
	</script>
	
	<script>
		$(document).ready(function(){
				var base = "${pageContext.request.contextPath}";
				var signCode = document.location.href.split("=");
					
				$.ajax({
					url: base + "/signResult/signListJoiner",
					type: "get",
					data: {signCode : signCode[1]},
					success: function(data) {
						var $joiner = $("#joiner tbody");
						$joiner.html('');
						
							for (var key in data) {
							var $tr = $("<tr class='resultList'>");
							var $jCode = $("<td class='jCode'>").text(data[key].emp_info_emp_no);
							var $jName = $("<td class='jName'>").text(data[key].emp_info_name);
							var $jJob = $("<td class='jJob'>").text(data[key].job_info_name);

							/* $tr.append($jCode);*/
							$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
							$tr.append($jName);
							$tr.append($jJob);
	
							$joiner.append($tr);					
						}		
						sessionStorage.setItem('joiner', JSON.stringify(data));
					}
				});
			});
	</script>
	<script>
	 	$(document).ready(function(){
				var base = "${pageContext.request.contextPath}";
				var signCode = document.location.href.split("=");
				
				$.ajax({
					url: base + "/signResult/signListWatcher",
					type: "get",
					data: {signCode : signCode[1]},
					success: function(data) {
						var $watcher = $("#watcher tbody");
						$watcher.html('');

						for (var key in data) {
							var $tr = $("<tr class='resultList'>");
							var $wCode = $("<td class='wCode'>").text(data[key].emp_info_emp_no);
							var $wName = $("<td class='wName'>").text(data[key].emp_info_name);
							var $wJob = $("<td class='wJob'>").text(data[key].job_info_name);

							/* $tr.append($jCode); */
							$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
							$tr.append($wName);
							$tr.append($wJob);

							$watcher.append($tr);
						}
						sessionStorage.setItem('watcher', JSON.stringify(data));
				}
			});
	 	});
	</script>

<!-- 첨부파일 시작 -->
        <script>
            $(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                /* //drag 영역 클릭시 파일 선택창
                objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
                }); */
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.targezst.files;
                    handleFileUpload(files,objDragAndDrop);
                });
                
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                   }
                }
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                    
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                
                function sendFileToServer(formData,status)
                {
        			var base = "${pageContext.request.contextPath}";
                    var uploadURL = base + "/sign/signFiles";
                    var extraData ={};
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                 
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });
    </script>

<!-- 결재자 추가 후 표시 리스트 -->
	<script>
		function showList() {
			var jsonData = sessionStorage.getItem("joiner");
			var data = JSON.parse(jsonData);
			var $joiner = $("#joiner tbody");
			$joiner.html('');

			for ( var key in data) {
				var $tr = $("<tr class='resultList'>");
				var $jCode = $("<td class='jCode'>").text(data[key].jCode);
				var $jName = $("<td class='jName'>").text(data[key].jName);
				var $jJob = $("<td class='jJob'>").text(data[key].jJob);

				/* $tr.append($jCode); */
				$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
				$tr.append($jName);
				$tr.append($jJob);

				$joiner.append($tr);
			}
		}
	</script>
	
	<!-- 참조자 추가 후 표시 리스트 -->
	<script>
		function showWList() {
			var jsonData = sessionStorage.getItem("watcher");
			var data = JSON.parse(jsonData);
			var $watcher = $("#watcher tbody");
			$watcher.html('');

			for ( var key in data) {
				var $tr = $("<tr class='resultList'>");
				var $wCode = $("<td class='wCode'>").text(data[key].wCode);
				var $wName = $("<td class='wName'>").text(data[key].wName);
				var $wJob = $("<td class='wJob'>").text(data[key].wJob);

				/* $tr.append($jCode); */
				$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
				$tr.append($wName);
				$tr.append($wJob);

				$watcher.append($tr);
			}
		}
	</script>
	
	<!-- FORM 전송 시작 전 체크 -->
	<script>
		$("#formArea").submit(function(e) {
			var base = "${pageContext.request.contextPath}";
			e.preventDefault();

			/*Include field data*/
			var isSubmit = false;
			var editorValue = editor.getHtml();
			$("#sign_note").val(editorValue);
		
			/*Check empty field*/
			if($("#sign_keep").val() != '0') {
				
				if($("#sign_acc").val() != '0') {
					
					if($("#sign_type_code").val() != '0') {
					
						if($("#sign_title").val() != '') {
							
							if(editorValue != "") {
								isSubmit = true;
								
							} else {
								alert('문서 내용을 입력해주세요');
								return false;
							}
							
						} else {
							alert('문서 제목을 입력해주세요');
							$("#sign_title").focus();
							return false;
						}
						
					} else {
						alert('문서 유형을 선택해주세요');
						$("#sign_type_code").focus();
						return false;
					}
					
				} else {
					alert('보안 등급을 선택해주세요');
					$("#sign_acc").focus();
					return false;
				}
				
			} else {
				alert('보존 연한을 선택해주세요');
				$("#sign_keep").focus();
				return false;
			}

 			if(isSubmit) this.submit();
		});
	</script>	
</body>
</html>