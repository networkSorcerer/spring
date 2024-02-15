<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<h3>나의 취미</h3>
			<ul>
				<c:forEach var="hobby" items="${hobby}" varStatus="status">
					<li>${status.count }. ${hobby}</li>
				</c:forEach>
			</ul>
		</div>
	</body>
</html>