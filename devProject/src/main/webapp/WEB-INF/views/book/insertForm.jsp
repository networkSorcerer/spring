<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책 정보 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h3 class="text-center">책 정보 등록</h3>
            <form id="insertForm">
                <div class="mb-3 row">
                    <label for="title" class="form-label">책 제목</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="publisher" class="form-label">출판사</label>
                    <input type="text" class="form-control" id="publisher" name="publisher" required>
                </div>
                <div class="mb-3">
                    <label for="year" class="form-label">출간 연도</label>
                    <input type="number" class="form-control" id="year" name="year" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">책 가격</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <button type="button" class="btn btn-primary" id="insertBtn">등록</button>
                <button type="button" class="btn btn-primary" id="cancelBtn">다시입력</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="resources/js/book.js"></script>
</body>
</html>
