$(function() {
	$("#exam01Btn").on("click", ()=> {
		$("#exam01Form").attr({
			method:"get",
			action:"/sample/exam01"
		});
		$("#exam01Form").submit();
	});
	$("#exam02Btn").on("click", ()=> {
		$("#exam01Form").attr({
			method:"get",
			action:"/sample/exam02"
		});
		$("#exam01Form").submit();
	});
	
});