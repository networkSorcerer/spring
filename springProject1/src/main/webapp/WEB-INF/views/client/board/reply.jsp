<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<body>
		
			<%--댓글 입력 화면 --%>
		<div>
			<form id="" name="">
				<div class="row mb-3">
					<label for="" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="replyName" id="replyName" maxlength="5" class="form-control" />
					</div>
					<label for="" class="col-sm-1 col-form-label">비밀 번호</label>
					<div class="col-sm-3">
						<input type="password" name="replyPasswd" id="replyPasswd" maxlength="18" class="form-control" />
					</div>
					<button type="button" id="replyInsertBtn" class="btn btn-primary col-sm-1 sendBtn">저장</button>
				</div>
				<div class="row mb-3">
					<label for="replyContent" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="replyContent" id="replyContent" class="form-control" rows="3"></textarea>
					</div>
				</div>
			</form>
		</div>	
			<%--리스트 영역 --%>
		<div id="reviewList">
			<div class="card mb-2" id="item-template">
 				<div class="card-header">
	   				<span class="name"></span>
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
			let message = "작성시 입력한 비밀번호를 입력해 주세요", btnKind="", replyTotal=0;
			
			$(function(){
				let boardNumber = ${detail.boardNumber};
				listAll(boardNumber);
				/*글 입력을 위한 Ajax 연동 처리 */
				$(document).on("click", "#replyInsertBtn", function(){
					let insertUrl = "/replies/replyInsert";
					
					let value = JSON.stringify({
						boardNumber:boardNumber,
						replyName:$("#replyName").val(),
						replyPasswd:$("#replyPasswd").val(),
						replyContent:$("#replyContent").val()
					});
					
					$.ajax({
						url : insertUrl,
						type : "post",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType:"text",
						data : value,
						error: function(xhr, textStatus, errorThrown) {
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown +")");
						},
						beforeSend: function(){
							if(!checkForm("#replyName", "작성자를"))  return false;
							else if (!checkForm("#replyPasswd", "비밀번호를")) return false;
							else if (!checkForm("#replyContent", "댓글내용을")) return false;
						},
						success : function(result) {
							if(result=="SUCCESS"){
								alert("댓글 등록이 완료되었습니다");
								dataReset();
								listAll(boardNumber);
							}
						}
					});
				});
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
						
						//$('#reviewList').append(replyNumber + replyName + replyContent + replyDate + "<br/>")
						template(replyNumber, replyName, replyContent, replyDate)
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