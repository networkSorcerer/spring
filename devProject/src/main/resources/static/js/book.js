$(function(){
	$("#insertBtn").click(() => {
	if (!chkData("#title", "책제목을")) return;
		else if (!chkData("#publisher" , "출판사를")) return;
		else if (!chkData("#year","출간연도를")) return;
		else if(!chkData("#price","책가격을")) return;
		else {
			$("#insertForm").attr("method", "post");
			$("#insertForm").attr("action", "/book/bookInsert");
			$("#insertForm").submit();
		}
	});
	$("#cancelBtn").click(function(){
		$("#insertForm").each(function(){
			this.reset();
		});
	});
	
	$(".deleteBtn").on("click", function(){
		let bookId = $(this).parents("tr").attr("data-id");
		if(confirm("선택하신 책 삭제하시겠습니까?")) {
			location.href = "/book/bookDelete?bookId="+bookId;
		}
	});
});
