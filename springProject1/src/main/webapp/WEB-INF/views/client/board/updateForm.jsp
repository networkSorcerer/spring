<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
  <div class="container">
    <div class = "text-center"><h1>게시판 수정 화면</h1></div>
    <form action="/update" method="post" id="f_updateForm">
    	<input type="hidden" name="boardNumber" value="${updateData.boardNumber }" id="boardNumber">
      		<div class ="text-center">
      		<table class="table table-striped">
      			<thead>
        		<tr>
          			<td class="col-3">글번호</td>
          			<td class="col-3">${updateData.boardNumber }<span>(조회수: ${updateData.readcnt })</span></td>
          			<th >작성일</th>
          			<td >${updateData.boardDate }</td>
        		</tr>
        		</thead>
        		<tbody>
        		<tr>
        			<td colspan="4">
        			<table class="table mb-0">
		        <tr>
		          	<td class="col-3">작성자</td>
		          	<td class="text-start">${updateData.boardName}</td>
		        </tr>
		        <tr>
		          	<th class="col-md-1">글제목</th>
		          	<td class="text-start">
		          	<input type="text" name="boardTitle" id="boardTitle" value="${updateData.boardTitle }" class="form-control"></td>
		        </tr>
		        <tr>
		          	<th>글내용</th>
		          	<td class="text-start">
		            <textarea name="boardContent" id="boardContent" rows="8" class="form-control">
		            ${updateData.boardContent }
		            </textarea>
		          	</td>
		        </tr>
		        <tr>
		          	<th>비밀번호</th>
		          	<td class="text-start">
		          	<input type="password" name="boardPasswd" id="boardPasswd"
		          	class="form-control" placeholder="기존의 비밀번호가 아니라 수정할 비밀번호를 입력해 주세요"></td>
		      	
		        </tr>
		        
		      </table>
		   </td>
		   </tr>
		</tbody>
		</table>
		</div>
    </form>
    <div class="text-end">
    	<button type="button" id="boardUpdateBtn" class="btn btn-success btn-sm">수정</button>
    	<button type="button" id="boardCancelBtn" class="btn btn-success btn-sm">취소</button>
    	<button type="button" id="boardListBtn" class="btn btn-success btn-sm">목록</button>
    </div>
  </div>
  <script src="/resources/include/js/updateForm.js"></script>
</body>
</html>