<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<div class="container">		
		<div class="alert alert-dark" role="alert">
			<h4 class="alert-heading">잘못된 URL을 요청하셨습니다.</h4><hr>
			<p>해당 URL은 존재하지 않습니다. 잠시 후 다시 접근해 주세요.~~<br />감사합니다</p>
		
			<p class="mb-0"><button type="button" class="btn btn-warning" id="main">홈으로</button></p>
		</div>
	</div>	
	<script>
		$("#main").click(function(){
			location.href = "/";
		});
	</script>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
		
	<div class="container">		
		<div class="alert alert-danger" role="alert">
			<h4 class="alert-heading">예상하지 못한 오류가 발생했습니다.</h4><hr>
			<p>
				일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요.<br />
				계속 발생하는 경우 홈페이지를 통해 문의해 주세요.<br />
				감사합니다<br />
			</p>
		
			<p class="mb-0"><button type="button" class="btn alert-danger" id="main">홈으로</button></p>
		</div>
	</div>	
	<script>
		$("#main").click(function(){
			location.href = "/";
		});
	</script>  
</body>
</html>
