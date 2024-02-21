$(function(){
	$("#boardInsertBtn").on("click", function(){
		if(!chkData("#boardName", "작성자를")) return;
		else if (!chkData("#boardTitle","글제목을")) return;
		else if(!chkData("#boardContent", "글내용을")) return;
		else if(!chkData("#boardPasswd","비밀번호를")) return;
		else {
			$("#f_writeForm").attr({
				"method":"post",
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