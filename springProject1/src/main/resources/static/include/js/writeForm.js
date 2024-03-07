$(function(){
	$("#boardInsertBtn").on("click", function(){
		if(!chkData("#boardName", "작성자를")) return;
		else if (!chkData("#boardTitle","글제목을")) return;
		else if(!chkData("#boardContent", "글내용을")) return;
		else if(!chkData("#boardPasswd","비밀번호를")) return;
		else {
			if($("#file").val()!=""){//업로드할 이미지 파일이 존재한다면
				//확장자가 png, jpg, gif 외 파일을 업로드할 수 없습니다 또는 gif, png, jpg 파일만 업로드 할수 있습니다
				if(!chkFile($("#file"))) return;// 이미지 파일만 업로드 가능 
			}
			//enctype 속성의 기본 값은 "appication/x-www-form-urlencoded". POST방식 폼 전송에 기본 값으로 사용
			$("#f_writeForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/board/boardInsert"
			});
			$("#f_writeForm").submit();
		}
	});
	
	$("#boardCancelBtn").on("click", function(){
		$("#f_writeForm").each(function(){
			this.reset();
		})
	});
	
	$("#boardListBtn").on("click", function(){
		location.href="/board/boardList";
	})
})