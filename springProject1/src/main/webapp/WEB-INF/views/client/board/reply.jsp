<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<body>
		
			<%--댓글 입력 화면 --%>
			
			<%--리스트 영역 --%>
		<div id="reviewList">
			<div class="card mb-2" id="item-template">
 				<div class="card-header">
 					<span class="reNum"></span>
	   				<span class="name"></span>
	   				<span class="content"></span>
	   				<span class="date"></span>
	   				<button type="button" data-btn="upBtn" class="btn btn-primary btn-sm">수정하기</button>
	   				<button type="button" data-btn="delBtn" class="btn btn-primary btn-sm">삭제하기</button>
 				</div>
 				<div class="card-body">
   					<p class="card-text"></p>
 				</div>
			</div>
		</div>
		<script>
			let message = "작성시 입력한 비밀번호를 입력해 주세요", btnKind="delBtn", replyTotal=0;
			
			$(function(){
				let boardNumber = ${detail.boardNumber};
				listAll(boardNumber);
			});
			
			function listAll(boardNumber) {
				$(".reply").detach();
				let url = "/replies/all/" + boardNumber;
				$.getJSON(url, function(data) {
					$(data).each(function(index){
						let replyNumber = this.replyNumber;
						let replyName = this.replyName;
						let replyContent = this.replyContent;
						let replyDate = this.replyDate;
						replyContent =replyContent.replace(/(\r\n|\r|\n)/g, "<br/>");
						
						$('#reviewList').append(replyNumber + replyName + replyContent + replyDate + "<br/>")
					});
				}).fail(function(){
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요");
				});
			}
			
			function template(replyNumber, replyName, replyContent, replyDate) {
				let $div = $('#reviewList');
				
				let $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", replyNumber);
				$element.addClass("reply");
				$element.find('.card-header .name').html(replyName);
				$element.find('.card-header .date').html(" / " + replyDate);
				$element.find('.card-body .card-text').html(replyContent);
				
				$div.append($element);
			}
		</script>
	</body>
</html>