let buttonCheck = 0;
$(function(){
	$("#pwdChk").css("visibility","hidden");
	
	$("#updateFormBtn").on("click", ()=>{
		$("#f_data").attr({
			"method":"get",
			"action":"/board/updateForm"
		});
		$("#f_data").submit();
	});
	
	$("#boardDeleteBtn").on("click", ()=> {
		$("#f_data").attr({
			"method":"post",
			"action":"/board/boardDelete"
		});
		$("#f_data").submit();
	});
	
	$("#insertFormBtn").click(function(){
		location.href = "/board/writeForm";
	});
	
	$("#boardListBtn").click(function(){
		location.href="/board/boardList";
	});
})