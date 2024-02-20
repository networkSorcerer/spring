<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<body>
	<div class ="container">
		<div class="text-center"><h3>게시판 리스트</h3></div>
		<div id="boardList">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-md-1">글번호</th>
						<th class="col-md-4">글제목</th>
						<th class="col-md-2">작성자</th>
						<th class="col-md-1">작성일</th>
						<th class="col-md-1">조회수</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty boardList }">
							<c:forEach var="board" items="${boardList }" varStatus="status">
								<tr class = "text-center" data-num="$[board.boardNumber]">
									<td>${board.boardNumber }</td>
									<td class="goDetail text-start">${board.boardTitle} </td>
									<td class="name">${board.boardName }</td>
									<td class="text-start">${board.boardDate }</td>
									<td class ="text-center">${board.readcnt }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="5" class ="text-center">등록된 게시물이 존재하지 않습니다</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>
		</div>
		
		<div class = "text-end">
			<button type="button" id="insertFormBtn" class ="btn btn-success btn-sm">글쓰기</button>
		</div>		
	</div>
	<script src="/resources/include/js/boardList.js"></script>
</body>
