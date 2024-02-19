<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>책정보 리스트</title>
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
         .custom-image {
            position: absolute;
            bottom: 0;
            left: 0;
        }
    </style>
	</head>
	<body>
		<div class="container">
			<div class="custom-image">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpng.pngtree.com%2Fpng-clipart%2F20220125%2Foriginal%2Fpngtree-a-stack-of-books-png-image_7205807.png&type=sc960_832" alt="Your Image" width="200" height="200">
        	</div>
			<div class =" text- center"><h3>&#x1F4D6;책정보 조회&#x1F4D6;</h3></div>
			<div class = "row">
				<div class="col-xs-6">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">책번호</th>
								<th scope="col">책제목</th>
								<th scope="col">출판사</th>
								<th scope="col">출간연도</th>
								<th scope="col">책가격</th>
								<th scope="col">삭제여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty bookList}">
									<c:forEach var = "book" items="${bookList}">
										<tr data-id="${book.bookId }">
											<th scope="row">${book.bookId }</th>
											<td>${book.title }</td>
											<td>${book.publisher }</td>
											<td>${book.year }</td>
											<td>${book.price }</td>
											<td><button type="button" class="updateBtn btn btn-primary">수정</button></td>
											<td><button class="deleteBtn btn btn-primary">삭제</button></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">등록된 책이 존재하지 않습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="col-xs-6">
					<%@ include file="insertForm.jsp" %>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    	<script src="/resources/js/jquery-3.7.1.min.js"></script>
    	<script src="/resources/js/common.js"></script>
    	<script src="/resources/js/book.js"></script>
	</body>
</html>