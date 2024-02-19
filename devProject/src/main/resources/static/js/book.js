$(function(){
	$("#insertBtn").click(() => {
	if (!chkData("#title", "책제목을")) return;
		else if (!chkData("#publisher" , "출판사를")) return;
		else if (!chkData("#year","출간연도를")) return;
		else if(!chkData("#price","책가격을")) return;
		else {
			$("#insertForm").attr("method", "post");
			$("#insetForm").attr("action", "/book/bookInsert");
			$("#insertForm").submit();
		}
	});
	$("#cancelBtn").click(function(){
		$("#insertForm").each(function(){
			this.reset();
		});
	});
});
