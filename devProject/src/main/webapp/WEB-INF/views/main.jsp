<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
			<div class = "text-center"><h3>웹 MVC 관련 예제</h3></div>
			<h5>매개변수 처리 예제</h5>
			<form id="exam01Form" class="form-inline">
				<div class="form-group">
					<label class="sr-only">이름</label>
					<input type="text" class = "form-control" name="name" id="name" placeholder="이름 입력" />
				</div>
				<div class = "form-group">
					<label class = "sr-only">나이</label>
					<input type="text" class = "form-control" name="age" id="age" placeholder="나이 입력" />
				</div>
				<button type="button" id="exam01Btn" class="btn btn-success">exam01 예제 확인</button>
				<button type="button" id="exam02Btn" class="btn btn-success">exam02 예제 확인</button>
			</form>
			<br/>
			<h3>매개변수 값을 배열(Array) 처리 예제 - name=hobby</h3>
			<form id="exam02ArrayForm">
				<label class="checkbox-inline">
    				<input type="checkbox" name="hobby" value="여행"> 여행
				</label >
				<label class="checkbox-inline">
    				<input type="checkbox" name="hobby" value="영화드라마감상"> 영화드라마감상
				</label>
				<label class="checkbox-inline">
    				<input type="checkbox" name="hobby" value="운동"> 운동
				</label>
				<label class="checkbox-inline">
   					<input type="checkbox" name="hobby" value="독서"> 독서
				</label>
				<label class="checkbox-inline">
    				<input type="checkbox" name="hobby" value="맛집 탐방"> 맛집 탐방
				</label>
				<button type="button" id="exam02ArrayBtn" class="btn btn-success">exam02Array 예제 확인</button>
			</form>
			<br/>
			<h3>매수변수 값을 List 타입에 대입 예제 -name="language"</h3>
			<form id="exam02ListForm">
    			<label class="checkbox-inline">
        			<input type="checkbox" name="language" value="Java"> Java
    			</label>
    			<label class="checkbox-inline">
        			<input type="checkbox" name="language" value="JSP"> JSP
    			</label>
    			<label class="checkbox-inline">
        			<input type="checkbox" name="language" value="Oracle"> Oracle
    			</label>
    			<label class="checkbox-inline">
        			<input type="checkbox" name="language" value="Spring"> Spring
    			</label>
   		 		<label class="checkbox-inline">
        			<input type="checkbox" name="language" value="jQuery"> jQuery
    			</label>
    			<button type="button" id="exam02ListBtn" class="btn btn-success">exam02List 예제 확인</button>
			</form>
			<br/>
			<h5> SampleDTOList 값 처리 예제 </h5>
			
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/js/jquery-3.7.1.min.js"></script>
		<script src="/resources/js/main.js"></script>
	</body>
</html>