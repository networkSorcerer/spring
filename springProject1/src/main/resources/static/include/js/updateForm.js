$(function(){
	$("#boardUpdateBtn").on("click", function(){
		if(!chkData("#boardTitle","글제목을")) return;
		else if (!chkData("#boardContent", "글내용을")) return;
		else {
			$("#f_updateForm").attr({
				"method":"post",
				"action":"/board/boardUpdate"
			});
			$("#f_updateForm").submit();
		}
	});
	
	$("#boardCancelBtn").on("click", function(){
		$("#f_updateForm").each(function(){
			this.reset();
		});
	});
	
	$("#boardListBtn").on("click", function(){
		location.href="/board/boardList";
	});
});