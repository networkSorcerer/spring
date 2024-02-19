<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학과 정보 리스트</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<!-- Bootstrap CSS -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    	 <style>
        body {
            background-color: #f8f9fa;
        }

        h3 {
            color: #007bff;
        }

        .table {
            margin-top: 20px;
        }

        .container {
            margin-top: 50px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
	</head>
	<body>
		<div class="container">
			<div class =" text- center"><h3>학과 정보 조회</h3></div>
			<div class = "row">
				<div class="col-xs-6">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">학과번호</th>
								<th scope="col">학과이름</th>
								<th scope="col">수정여부</th>
								<th scope="col">삭제여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty subjectList}">
									<c:forEach var = "subject" items="${subjectList}">
										<tr data-no="${subject.no }">
											<td>${subject.no }</td>
											<td>${subject.s_num }</td>
											<td>${subject.s_name }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">등록된 학과가 존재하지 않습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	</body>
</html>