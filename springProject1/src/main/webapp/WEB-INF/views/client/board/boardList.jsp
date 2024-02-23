<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<body>
	<div class ="container">
		<div class="text-center"><h3>게시판 리스트</h3></div>
		
		<form id="detailForm">
			<input type="hidden" id="boardNumber" name="boardNumber"/>
		</form>
		
		<div id="boardSearch">
		    <form id="f_search" name="f_search">
		        <div class="row g-2 align-items-center">
		            <label for="search">검색조건</label>
		        </div>
		        <div class="col-auto">
		            <select id="search" name="search" class="form-select form-select-sm">
		                <option value="all">전체 목록 조회</option>
		                <option value="b_title">글제목</option>
		                <option value="b_content">글내용</option>
		                <option value="b_name">작성자</option>
		            </select>
		        </div>
		        <div class="col-auto">
		            <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm"/>
		        </div>
		        <div class="col-auto">
		            <button type="button" id="searchData" class="btn btn-success btn-sm">검색</button>
		        </div>
		    </form>
		</div>

		
		<div id="boardSearch" class="text-right"></div>
		
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
								<tr class = "text-center" data-num="${ board.boardNumber}">
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
	<script>
		$(function(){
			/* 검색 후 검색 대상과 검색 단어 출력 */
			let word="<c:out value='${boardVO.keyword}' />";
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${boardVO.keyword}' />");
				$("#search").val("<c:out value='${boardVO.search}' />");
			
				if($("#search").val()!='b_content'){
					//:contains()는 특정 텍스트를 포함한 요소반환 	
					if($("#search").val()=='b_title') value = "#list tr td.goDetail";
					else if($("#search").val()=='b_name') value="#list tr td.name";
					console.log($(value+":contains('"+word+"')").html());
					//$("#list tr td.goDetail:contains('노력')").html()  => <span class='required'>노력</span>에 대한 명언
			    	$(value+":contains('"+word+"')").each(function () {
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			    	});
				}
			}
		});	
</script>
</body>
