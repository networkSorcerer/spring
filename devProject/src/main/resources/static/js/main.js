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
	
	$("#exam02ArrayBtn").on("click", ()=>{
		$("#exam02ArrayForm").attr({
			method:"get",
			action:"/sample/exam02Array"
		});
		$("#exam02ArrayForm").submit();
	});
	
	$("#exam02ListBtn").on("click", ()=>{
		$("#exam02ListForm").attr({
			method:"get",
			action:"/sample/exam02List"
		});
		$("#exam02ListForm").submit();
	});
	
	$("#exam02BeanBtn").on("click", ()=> {
		$("#exam02BeanForm").attr({
			method:"get",
			action:"/sample/exam02Bean"
		});
		$("#exam02BeanForm").submit();
	});
	$("#exam02BeanBtn1").on("click", ()=> {
		$("#exam02BeanForm1").attr({
			method:"get",
			action:"/sample/exam02Bean1"
		});
		$("#exam02BeanForm1").submit();
	});
	
	
	$("#exam03Btn").on("click", ()=> {
		$("#exam03Form").attr({
			method:"get",
			action:"/sample/exam03"
		});
		$("#exam03Form").submit();
	});
	
	
	$("#jsonBtn").on("click", ()=> {
		$("#dataArea").html("");
		$.ajax({
			url : "/example/getExample",
			type : "get",
			dataType : "json",
			error : function(xhr, textStatus) {
				alert(textStatus + "(HTTP-" + xhr.status + ")");
				//alert("잠시후에 다시 접근해주세요");
			},
			success : function(resultData)  {
				let no = resultData.no;
				let name = resultData.name;
				let phone = resultData.phone;
				
				let noLi = $("<li>").html(no);
				let nameLi = $("<li>").html(name);
				let phoneLi = $("<li>").html(phone);
				
				$("#dataArea").append(noLi).append(nameLi).append(phoneLi);
			}
		});
	});
	
	$("#jsonListBtn").on("click", function(){
		$("#list").css("display", "block");
		$("#listData").empty();
		
		$.getJSON('/example/getList', function(data){
			$(data).each(function(){
				let no = this.no;
				let name = this.name;
				let phone = this.phone;
				
				let noTd = $("<td>").html(no);
				let nameTd = $("<td>").html(name);
				let phoneTd = $("<td>").html(phone);
				
				let tr = $("<tr>").append(noTd).append(nameTd).append(phoneTd);
				$("#listData").append(tr);
			});
		}).fail(function(xhr, textStatus) {
			alert(textStatus + " (HTTP-" + xhr.status + ")");
		});
	});
});