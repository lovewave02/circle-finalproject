/*********************************  함수 정의 영역  ****************************/

/* 문항 전역변수 초기화 */
questions = [];			 			//전체 문항 
seq = 0;							//순번
title = "";								//제목
necessary = "";							//필수 체크
selectType = "";							//선택형
selectNumberType = "";					//선택 개수
checkType = "";							//radio - checkbox 종류 선택
selectContent = new Array();//문항 내용
subSeq = 0;							//문항순번
etcSelectContent = "";					//기타 문항 내용
etcContent = "";
score = 0;
pluralMaximum = 0;

/* 문항추가 입력폼 추가 */
function addQuestionEditFrom(){
	$("#question-form-template").tmpl().insertBefore("li.action");
}
/* 문항추가 입력폼 제거 */
function removeQuestionEditForm(){
	$(".question-item-edit").remove();
}
/* 문항 추가 폼 존재확인 */
function confirmAddQuestionFromExist(){
	if($('.question-item-edit').length > 0) {
		return true;
	} else {
		return false;
	}
}

/* 문항추가폼 미입력 부분 확인/ 확인후 후속 추가동작 */
function confirmAddQuestion(){
	/* 질문 입력창 입력 확인 - 경고메세지 출력*/
	
	console.log($("input[name=question]").val().length);
	
	if($("input[name=question]").val().length < 2 || $("input[name=question]").val() == ""){
		($("input[name=question]").siblings(".desc-top-wrap").css("display","block")
		,$("input[name=question]").css({"border-color": "red","color": "red"})
		.focus());
	} else {
		
		/* 선택형, 텍스트형, 점수형 입력폼검사/폼추가 */
		switch(extractQuestionType()){
			case 'select' : {	($(".desc-top-wrap").css("display","none")
								,$("input[name=question]").css({"border-color": "#ddd","color": "#333"}));
								/* 보기 입력창 존재 확인 - 경고창 출력 */
								if(confirmAddQuestionFromSelectExist() == false){
									alert("등록된 문항이 없습니다");
								} else {
									/* 보기 입력창 미입력 확인 - 경고메세지 출력 */
									var inputCheck = 0;
									$(".question-form").find("input[name=option-2]").each(function(index,item) {
										if($(item).val().length < 1){
											($(item).siblings(".desc-top-wrap").css("display","block")
											, $(item).css({"border-color": "red","color": "red"}));
											inputCheck += 1;
										} else {
											($(item).siblings(".desc-top-wrap").css("display","none"), $(item)
											.css({"border-color": "#ddd","color": "#333"}));
										}
									});
									if(inputCheck == 0){
										/* 확인완료/추가창 제거/완성태그 추가 */
										addPreview();
										removeQuestionEditForm();
										
										return true;
									}
								}
							};break;
			case 'text' :	{addPreview();
							removeQuestionEditForm();
							return true;
							}break;
			case 'score': 	{addPreview();
							removeQuestionEditForm();
							return true;
							}break;
		}
	}
}

/* 문항 완료 미리보기 통합 추가 */
function addPreview(){
	seq += 1;
	title = extractTitle();
	necessary = extractNecessary();
	
	//문항 공통데이터 변수화
	var data = {"seq":seq, "title":title, "necessary":necessary};
	
	//문항 공통데이터 출력
	$("#optionable-preview").tmpl(data).insertBefore('.action');
	
	switch(extractQuestionType()){
	case 'select'	: addPreviewSelectOptionable();break;
	case 'text'		: addPreviewTextType();break;
	case 'score'	: addPreviewScore();break;
	}
}
/* 문항 제목 변수화 */
function extractTitle(){
	title = $('.question-form input[name=question]').val();
	return title;
}
/* 문항 타입 체크 (select, text, score)*/
function extractQuestionType(){
	return $("select[name=question-type]").val();
}
/* 문항 필수 체크 */
function extractNecessary(){
	var temp;
	$('#checkbox-required').prop('checked') ? temp = "[필수]" : temp = "";
	return temp;
}


/*******************************
텍스트형 문항 추가 관련 함수 
********************************/
	/* 텍스트형 - 문항 완료 미리보기 - 추가 */
	function addPreviewTextType(){
		/* 단문 장문 확인 */
		switch(textLowerType()){
		case 'text': $('#text-short-type-preview').tmpl().appendTo(".question-item:last .answer-wrap");break;
		case 'textarea'	: $('#text-long-type-preview').tmpl().appendTo(".question-item:last .answer-wrap");break;
		}
		
		/* 결과 변수에 저장 */
		questions.push({"seq":seq,"title":title,"necessary":necessary,"type":"text","selectContent":0,"etcContent":0,"pluralMaximum":0
						,"selectNumberType":0,"score":0,"checkLowerType":textLowerType()});
		console.log(questions);
		
	}
	/* 텍스트형 - 서브타입 단문/장문 선택 - 확인 */
	function textLowerType(){
		return $('.question-form select[name=question-sub-type] option:selected').val();
	}
	
	
/*******************************
점수형 문항 추가 관련 함수 
********************************/
	/* 점수형 - 문항완료 미리보기 - 추가 */
	function addPreviewScore(){
		$('.question-item .answer-wrap:last').addClass('rank');//점수문항 css변경용 rank클래스 추가
		
		var score = checkScore();
		
		var scoreContent =new Array();
		for(var i = 1; i <= score; i++){
			scoreContent.push({"seq":seq, "subSeq":i});
		}
		
		$('#score-preview').tmpl(scoreContent).appendTo(".question-item:last .answer-wrap");
		
		/* 결과 변수에 저장 */
		questions.push({"seq":seq,"title":title,"necessary":necessary,"type":"score","selectContent":0,"etcContent":0,"pluralMaximum":0
						,"selectNumberType":0,"score":score,"checkLowerType":0});
		console.log(questions);
	}

	/* 점수형 - 점수선택 - 확인 */
	function checkScore(){
		return $('.question-form select[name=question-sub-type] option:selected').val();
	}

	
/*******************************
	선택형 문항 추가 관련 함수 
********************************/

	/* 문항 추가 폼 -선택형- 보기 존재 확인 */
	function confirmAddQuestionFromSelectExist(){
		if(selectionExist() || etcSelectionExist()){
			return true
		} else {
			return false
		}
	}

	/* 문항 완료 미리보기 - 선택형 - 추가 */
	function addPreviewSelectOptionable() {
		/* 일반 보기 존재 확인 */
		if(selectionExist()) {
			checkType = extractCheckType();
			selectContent = extractContent(seq, checkType);
			//선택형 보기(기타 제외) 출력
			$('#optionable-preview-content').tmpl(selectContent).appendTo(".question-item:last .answer-wrap");
		}
		/* 기타 보기 존재 확인 */
		if(etcSelectionExist()) {
			checkType = extractEtcCheckType();
			etcContent = extractEtcContent(seq, checkType);
			//선택형 보기(기타) 출력
			$('#optionable-preview-etc-content').tmpl(etcContent).appendTo(".question-item:last .answer-wrap");
		}
		/* 하나만/복수선택 확인 */
		if(checkType == 'checkbox'){
			pluralMaximum = extractMaximum();
		}
		
		/* 결과 변수에 저장 */
		questions.push({"seq":seq,"title":title,"necessary":necessary,"type":"select","selectContent":selectContent,"etcContent":etcContent,"pluralMaximum":pluralMaximum
						,"selectNumberType":0,"score":0,"checkLowerType":textLowerType()});
		console.log(questions);
		
	}
	
	/* 선택형에서 하나만, 복수형 선택시 radio <---> checkbox button 변경 */
	function buttonChange() {
		switch($("select[name=question-sub-type]").val()){
			case "single" :	$(".plural-only").css("display", "none");
							$(".question-form ul.answer-wrap li span input:checkbox").prop('type','radio');
							break;
			case "plural" :	$(".plural-only").css("display", "table-row");
							$(".question-form ul.answer-wrap li span input:radio").prop('type','checkbox');
							break;
		}
	}
	
	/* 복수형 선택시 최대선택 개수 선택지 추가 */
	function addPluralNum() {
		$("#question-option-plural-only").tmpl().insertBefore(".question-answer-row");
	}
	/* 최대선택 개수 선택지 제거 */
	function removePluralNum() {
		$(".plural-only").remove();
	}
	/* 일반 선택형 보기 존재 확인 */
	function selectionExist(){
		if($('.question-option-item').length > 0){
			return true;
		}
	}
	
	/* 기타 선택형 보기 존재 확인 */
	function etcSelectionExist(){
		if($('.question-option-item-etc').length > 0) {
			return true;
		}
	}
	/* 일반 보기 radio-checkbox (하나만/복수형)선택 변수화 */
	function extractCheckType(){
		return $('.question-form .question-option-item .txt-wrap input:first').prop("type");
	}
	/* 기타 보기 radio-checkbox (하나만/복수형)선택 변수화 */
	function extractEtcCheckType(){
		return $('.question-form .question-option-item-etc .txt-wrap input:first').prop("type");
	}
	/* 복수형 선택시 최대갯수 리턴 */
	function extractMaximum(){
		return $('.question-form .plural-only option:selected').val();
	}
	
	/* 선택 보기 내용 변수화(기타 제외) */
	function extractContent(seq, checkType){
		var contents = new Array();
		subSeq = 1;
		$(".question-form").find(".question-option-item input[name=option-2]").each(function(index,item) {
			contents.push({"seq":seq, "checkType":checkType, "subSeq": subSeq, "content":$(item).val()});
			subSeq+=1;
		});
		return contents;
	}
	/* 선택 보기 내용 변수화(기타) */
	function extractEtcContent(seq, checkType){
		var contents;
		var content = $(".question-form").find(".question-option-item-etc input[name=option-2]").val();
		var contents = {"seq":seq, "checkType":checkType, "content":content};
		return contents;
	}



/*********************************  실행 영역  **************************************************************************/
$(document).ready(function(){
	
	/************************
	**					   **
	** 문항 추가 관련 기능 ** 
	**                     **
	************************/
	
		/* 문항 추가 버튼 클릭기능 */
		$("#add-question-btn").on("click", function(){
			if(confirmAddQuestionFromExist() == true){
				confirmAddQuestion();
				if(confirmAddQuestion()) addQuestionEditFrom();
				
			} else {
				addQuestionEditFrom();
			}
		});
		
		/* 문항 타입 선택 */
		$(document).on("change","select[name=question-type]",function(){
			switch($("select[name=question-type]").val()){
			/* 선택형 선택시 */
			case "select" : $("select[name=question-sub-type]").html("<option value='single'>하나만 선택</option><option value='plural'>복수 선택</option>");
							$(".question-answer-row").css("display","table-row");
							$(function(){
								buttonChange();
							});
							break;
			
			/* 텍스트형 선택시 */
			case "text" :   $(".question-answer-row").css("display","none");
							$("select[name=question-sub-type]").html("<option value='text'>단문 입력</option><option value='textarea'>장문 입력</option>");
							$(function(){
								removePluralNum();
							});
							break;
			
			/* 점수형 선택시 */
			case "score" : $(".question-answer-row").css("display","none");
							$("select[name=question-sub-type]").html("<option value='3'>3 점</option><option value='5'>5 점</option><option value='7'>7 점</option><option value='10'>10 점</option>");
							$(function(){
								removePluralNum();
							});
							break;
			}
		});

		/*********************************
		** 선택형 문항 내부 기능 ** 
		**********************************/		
		/* 복수선택 select 선택시 */
		$(document).on("change", "select[name=question-sub-type]", function(){
			buttonChange();
			switch($(this).val()){
				case 'single' : $(function(){
									removePluralNum();
								});
								break;	
				case 'plural' : $(function(){addPluralNum();});break;	
			}
			
		});
		
		/* 최대 개수 제한 숫자 자동변경 */
		$(document).on("click", ".question-form li", function(){
			$("#maxSelectCase").children("option:not(:first)").remove();
			/* 보기 숫자 카운팅 변수 */
			var count = (($(".question-answer-row .answer-wrap li").length) - 2);
			
			for(var i = 1;  i <= count; i++){
				$("<option value=" + i + ">" + i + "</option>").appendTo("#maxSelectCase");
			}
		});
		
		/* 선택형 보기 입력창 클릭시 기능 */
		$(document).on("click", ".add-question-btn input[type='text']", function(){
			switch($("select[name=question-sub-type]").val()){
				case 'single' : $("#question-option-template-radio").tmpl().insertBefore($(".question-form ul.answer-wrap li span.add-question-btn").parent());break;
				case 'plural' : $("#question-option-template-checkbox").tmpl().insertBefore($(".question-form ul.answer-wrap li span.add-question-btn").parent());break;
			}
		});
		/* 선택형 보기 입력창 제거 아이콘 클릭 */
		$(document).on("click", "span.icon-del", function(){
			$(this).closest(".question-option-item").remove();
		});
		/* 기타 추가 클릭 */
		$(document).on("click", ".add-etc-question-btn", function(){
			$(this).css("display","none");
			switch($("select[name=question-sub-type]").val()){
				case 'single' : $("#question-etc-option-template-radio").tmpl().appendTo(".question-form ul.answer-wrap");break;
				case 'plural' : $("#question-etc-option-template-checkbox").tmpl().appendTo(".question-form ul.answer-wrap");break;
			}
		});
		/* 기타 제거 아이콘 클릭*/
		$(document).on("click", "span.del-etc", function(){
			$(this).closest(".question-option-item-etc").remove();
			$(".add-etc-question-btn").css("display","block");
		});
		/*************************/
		
		/*********************************
		** 문항추가 완료/취소 버튼 기능 ** 
		**********************************/
		/* 완료버튼 클릭 */
		$(document).on("click", ".poll-action span:contains('완료')", function(){
			confirmAddQuestion();
			
		});
		/* 취소버튼 클릭 */
		$(document).on("click", ".poll-action span:contains('취소')", removeQuestionEditForm);
		/*********************************/
		/* 문항 개별삭제 아이콘 클릭 */
		$(document).on("click", ".remove-question-btn", function(){
			
			/* 클릭한 문항 미리보기 번호 추출 */
			var here = $(this).parent().parent().find('.seq').text();
			here = here - 0;
			
			/* 추출된 번호에 맞는 객체 찾기 */
			var findArray = questions.findIndex(x => x.seq == here);
			
			/* 객체 삭제 */
			questions.splice(findArray, 1);
			
			/* 태그 삭제 */
			$(this).closest('.question-item').remove();

			console.log(questions);
			
		});
		
		
		
	/*********************************
	*********************************/
});