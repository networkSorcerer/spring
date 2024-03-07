<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
	<div class="container">
		<div class="text-center"><h3>게시판 상세화면</h3></div>
		
		<form name="f_data" id="f_data">
			<input type="hidden" name="boardNumber" value="${detail.boardNumber }"/>
			<input type="hidden" name="boardFile" id="boardFile" value="${detail.boardFile}"/>
		</form>
		
		
		<div class="row text-center mb_2">
			<div id="pwdChk" class="col-md-9 text-start">	
				<form name="f_passwdCheck" id="f_passwdCheck" class="row g-3">
					<input type="hidden" name="boardNumber" id="boardNumber" value="${detail.boardNumber }"/>
					<div class="col-auto">
						<label for="boardPasswd" class="visually-hidden">비밀번호</label>
						<input type="password" class="form-control" name="boardPasswd" id="boardPasswd" placeholder="비밀번호 입력" />
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary btn-sm" id="passwdBtn">확인</button>
						<button type="button" class="btn btn-secondary btn-sm" id="passwdCancelBtn">취소</button>
					</div>
					<div class="col-auto">
						<span id="message" class="align-middle"></span>
					</div>
				</form>				
			</div>
			

			<div class="col-md-3 text-end">
				<button type="button" id="updateFormBtn" class="btn btn-success btn-sm">글수정</button>
				<button type="button" id="boardDeleteBtn" class="btn btn-success btn-sm">글삭제</button>
				<button type="button" id="insertFormBtn" class="btn btn-success btn-sm">글쓰기</button>
				<button type="button" id="boardListBtn" class="btn btn-success btn-sm">목록</button>
			</div>
		</div>
		
		<div class="text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="col_3">글번호</td>
						<td>${detail.boardNumber }(조회수 : ${detail.readcnt })</td>
						<td>작성일</td>
						<td>${detail.boardDate}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
							<table class="table mb-0">
								<tr>
									<td class="col-3">작성자</td>
									<td class="text-start">${detail.boardName }</td>
								</tr>
								<tr>
									<td>글제목</td>
									<td class="text-start">${detail.boardTitle }</td>
								</tr>
								<tr>
									<td>글내용</td>
									<td class="text-start">${detail.boardContent }</td>
								</tr>
								<c:if test="${not empty detail.boardFile }">
									<tr>
										<td class="align-middle">이미지</td>
										<td class="text-start">
											<img src="/uploadStorage/board/${detail.boardFile }" class="rounded" width="500px"/>
										</td>
									</tr>
								</c:if>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="reply.jsp" />	
	</div>
	<script src="/resources/include/js/boardDetail.js"></script>		
</body>
</html>