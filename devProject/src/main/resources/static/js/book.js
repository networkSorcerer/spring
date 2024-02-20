// 문서가 로드되면 실행되는 함수
$(function(){
    // 등록 버튼이 클릭되었을 때 실행되는 이벤트 핸들러
    $("#insertBtn").click(() => {
        // 책 제목 확인 및 유효성 검사
        if (!chkData("#title", "책제목을")) return;
        // 출판사 확인 및 유효성 검사
        else if (!chkData("#publisher" , "출판사를")) return;
        // 출간 연도 확인 및 유효성 검사
        else if (!chkData("#year","출간연도를")) return;
        // 책 가격 확인 및 유효성 검사
        else if(!chkData("#price","책가격을")) return;
        // 모든 데이터가 유효하면 폼을 서버로 제출
        else {
            // 폼의 전송 방식을 POST로 설정
            $("#insertForm").attr("method", "post");
            // 폼의 액션을 "/book/bookInsert"으로 설정
            if($("#bookId").val()==="0"){
				$("#insertForm").attr("action", "/book/bookInsert");
			} else {
				$("#insertForm").attr("action","/book/bookUpdate");
			}
			$("#insertForm").submit();
        }
    });

	// 취소 버튼이 클릭되었을 때 실행되는 이벤트 핸들러
	$("#cancelBtn").click(function(){
    	// 등록 버튼의 텍스트를 "책정보등록"으로 변경
   		$("#insertBtn").html("책정보등록");

    	// 숨겨진 입력 필드에 있는 책 ID 값을 0으로 설정 (신규 등록 모드로 초기화)
    	$("#bookId").val(0);

    	// insertForm 폼 안에 있는 모든 입력 필드를 초기화
    	$("#insertForm").each(function(){
        this.reset();
    	});
	});
	
		// 수정 버튼이 클릭되었을 때 실행되는 이벤트 핸들러
	$(".updateBtn").click(function(){
    	// "책정보수정"으로 버튼의 텍스트 변경
    	$("#insertBtn").html("책정보수정");

    	// 선택된 행의 데이터 ID 가져오기
    	let bookId = $(this).parents("tr").attr("data-id");
    	// 가져온 ID를 숨겨진 입력 필드에 설정
    	$("#bookId").val(bookId);

    	// 선택된 행의 도서 제목 가져오기
    	let title = $(this).parents("tr").children().eq(1).html();
    	// 가져온 도서 제목을 입력 필드에 설정
    	$("#title").val(title);

    	// 선택된 행의 출판사 정보 가져오기
    	let publisher = $(this).parents("tr").children().eq(2).html();
    	// 가져온 출판사 정보를 입력 필드에 설정
    	$("#publisher").val(publisher); // 수정: #publisher로 변경

    	// 선택된 행의 출판년도 가져오기
    	let year = $(this).parents("tr").children().eq(3).html();
    	// 가져온 출판년도를 입력 필드에 설정
    	$("#year").val(year);

    	// 선택된 행의 가격 정보 가져오기
    	let price = $(this).parents("tr").children().eq(4).html();
    	// 가져온 가격 정보를 입력 필드에 설정
   	 	$("#price").val(price);
	});

	
	$(".deleteBtn").on("click", function(){
		let bookId = $(this).parents("tr").attr("data-id");
		if(confirm("선택하신 책 삭제하시겠습니까?")) {
			location.href = "/book/bookDelete?bookId="+bookId;
		}
	});
});
