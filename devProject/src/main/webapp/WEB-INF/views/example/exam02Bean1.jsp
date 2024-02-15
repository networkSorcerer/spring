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
			<h3>SampleeDTOList 필드의 list 값 출력 </h3>
			<ul>
				<c:forEach var="list" items="${sampleDTOList.list}" >
					${list.name}
					${list.age }<br />
				</c:forEach>
			</ul>
		</div>
	</body>
</html>