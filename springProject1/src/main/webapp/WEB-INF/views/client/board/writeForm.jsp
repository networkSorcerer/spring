<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<body>
    <div class="container">
        <div class="text-center">
            <h3>게시판 입력화면</h3>
        </div>
        <form id="f_writeForm">
            <div class="mb-3 row">
                <label for="boardName" class="col-sm-2 col-form-label">작성자</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="boardName"
                        name="boardName" placeholder="작성자 이름을 입력하세요."
                        data-type="CDATA">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="boardTitle" class="col-sm-2 col-form-label">글 제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="boardTitle"
                        name="boardTitle" placeholder="글 제목을 입력하세요.">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="boardContent" class="col-sm-2 col-form-label">글 내용</label>
                <div class="col-sm-10">
                    <textarea name="boardContent" id="boardContent"
                        class="form-control" rows="5"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="boardPasswd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="boardPasswd"
                        name="boardPasswd" placeholder="비밀번호를 입력하세요." maxlength="16">
                </div>
            </div>
            
        </form>
        <div class="text-end">
                <button type="button" class="btn btn-primary" id="boardInsertBtn">저장</button>
                <button type="button" class="btn btn-secondary" id="boardCancelBtn">취소</button>
                <button type="button" class="btn btn-success" id="boardListBtn">목록</button>
        </div>
    </div>
    <script src="/resources/include/js/writeForm.js"></script>
    <script>
    $(function(){
    	let errorMsg = "${errorMsg}";
    	if(errrorMsg != "") {
    		alert(errorMsg);
    		errorMsg ="";
    	}
    });
    </script>
</body>
