<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
	<div class="container">
		<div class="text-center"><h3>게시판 상세화면</h3></div>
		
		<form name="f_data" id="f_data">
			<input type="hidden" name="boardNumber" value="${detail.boardNumber }"/>
		</form>
		
		<div class="row text-center mb_2">
			<div id="pwdChk" class="col-md-9 text-start">
			
			</div>
			<div class="col-md-3" text-end>
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
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<script src="/resources/include/js/boardDetail.js"></script>		
</body>
</html>