$(function(){
	
	$(".goDetail").on("click", function(){
		//let boardNumber = $(this).parents("tr").attr("data-num");
		//console.log("글번호 : " + boardNumber);
		//location.href = "/board/boardDetail?boardNumber=" +boardNumber;
		let boardNumber = $(this).parents("tr").attr("data-num");
		$("#boardNumber").val(boardNumber);
		$("#detailForm").attr({
			"method":"get",
			"action":"/board/boardDetail"
		});
		$("#detailForm").submit();
	});
	
	
	$("#insertFormBtn").on("click", ()=>{
		location.href = "/board/writeForm";
	});
	
	
});