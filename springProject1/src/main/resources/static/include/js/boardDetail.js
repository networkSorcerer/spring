let buttonCheck = 0;
$(function(){
	$("#pwdChk").css("visibility","hidden");
	
	let btnInit = function() {
		$("#message").removeClass("text-danger");
		$("#message").addClass("text-primary");
		$("#message").text("작성시 입력한 비밀번호를 입력해 주세요");
	}
	$("#updateFormBtn").on("click", ()=>{
		/*$("#f_data").attr({
			"method":"get",
			"action":"/board/updateForm"
		});
		$("#f_data").submit();*/
		$("#pwdChk").css("visibility", "visible");
		btnInit();
		buttonCheck ="updateButton";
	});
	
	$("#boardDeleteBtn").on("click", ()=> {
		/*$("#f_data").attr({
			"method":"post",
			"action":"/board/boardDelete"
		});
		$("#f_data").submit();*/
		
		$("#pwdChk").css("visibility", "visible");
		btnInit();
		buttonCheck = "deleteButton";
	});
	
	$("#boardPasswd").bind("keydown", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
		}
	});
	
	$("#boardPasswd").on("keyup", ()=>{
		btnInit();
	});
	
	$("#passwdCancelBtn").on("click", function(){
		$("#boardPasswd").val("");
		$("#pwdChk").css("visibility", "hidden");
		buttonCheck = "";
	});

	
	$("#passwdBtn").on("click", function(){
		$.ajax({
			url : "/board/pwdConfirm",
			type : "post",
			data : $("#f_passwdCheck").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다 . 관리자에게 문의 하세요');
			},
			beforeSend: function(){
				if(!dataCheck("#boardPasswd", "#message", "비밀번호를")) return false;
			},
			success : function(resultData) {
				if(resultData == "불일치") {
					$("#message").addClass("text-danger");
					$("#message").text("작성시 입력한 비밀번호가 일치하지 않습니다");
					$("#boardPasswd").select();
				}else if (resultData == "일치") {
					$("#message").text("");
					if(buttonCheck=="updateButton") {
						actionProcess("get", "/board/updateForm");
					}else if (buttonCheck=="deleteButton") {
						if(confirm("정말 삭제하시겠습니까?")) {
							actionProcess("post", "/board/boardDelete");
						}
					}
				}
			}
		});
	});
	
	$("#insertFormBtn").click(function(){
		location.href = "/board/writeForm";
	});
	
	$("#boardListBtn").click(function(){
		location.href="/board/boardList";
	});
})

function actionProcess(method, goUrl) {
	$("#f_data").attr({
		"method":method,
		"action":goUrl
	});
	$("#f_data").submit();
}