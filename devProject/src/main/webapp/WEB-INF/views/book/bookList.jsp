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
	</head>
	<body>
		<div class="container">
			<div class =" text- center"><h3>책정보 조회</h3></div>
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
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	</body>
</html>