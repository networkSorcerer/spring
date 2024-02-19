<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h3 class="text-center">&#x1F4DA;책 정보 등록&#x1F4DA;</h3>
            <form id="insertForm">
            <input type="hidden" name="bookId" id="bookId" value="0"/>
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
                <div class="text-end">
                <button type="button" class="btn btn-primary" id="insertBtn">등록</button>
                <button type="button" class="btn btn-primary" id="cancelBtn">다시입력</button>
                </div>
            </form>
        </div>
    </div>
</div>

