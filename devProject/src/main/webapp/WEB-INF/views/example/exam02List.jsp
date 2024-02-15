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
			<h3>내가 배운 언어들 </h3>
			<ul>
				<c:forEach var="lang" items="${language}" >
					<li>${lang}</li>
				</c:forEach>
			</ul>
		</div>
	</body>
</html>