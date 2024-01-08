<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>카테고리 등록</title>
            <style>
                /* 기본 설정 */
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }

                /* 각 폼 컨테이너 스타일 */
                .container {
                    display: flex;
                    gap: 20px;
                    /* Add a 20px gap between the containers */
                    margin: 20px auto;
                }

                .form-container {
                    flex: 1;
                    max-width: 400px;
                    padding: 20px;
                    border: 1px solid #3498db;
                    border-radius: 10px;
                    background-color: #fff;

                }

                /* 각 폼 정렬 */
                form {
                    text-align: center;
                }

                /* 둥근 테두리 스타일 추가 */
                input,
                textarea,
                button {
                    border-radius: 5px;
                    border: 1px solid #3498db;
                }

                /* 라벨 스타일 */
                label {
                    display: block;
                    margin-bottom: 8px;
                }

                /* 입력 필드 스타일 */
                input,
                textarea {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 16px;
                    box-sizing: border-box;
                }

                /* 버튼 스타일 */
                button {
                    background-color: #3498db;
                    color: #fff;
                    padding: 10px 15px;
                    border: none;
                    cursor: pointer;
                }

                /* 오류 메시지 스타일 */
                .error {
                    border: 1px solid red;
                }
            </style>
        </head>

        <body>
            <c:import url="/header" />
            <div class="container">
                <!-- Left Form: Category Registration -->
                <div class="form-container">
                    <h2 style="text-align: center;">카테고리 등록</h2>
                    <form id="categoryForm" action="/category/registerProc" method="post"
                        onsubmit="return validateCategoryForm()">
                        <!-- 카테고리 그룹 입력 -->
                        <label for="cateGroup">카테고리 그룹</label>
                        <input type="text" id="cateGroup" name="cateGroup">

                        <!-- 카테고리 코드 입력 -->
                        <label for="cateCode">카테고리 코드</label>
                        <input type="text" id="cateCode" name="cateCode">

                        <!-- 카테고리 이름 입력 -->
                        <label for="cateName">카테고리 이름</label>
                        <input type="text" id="cateName" name="cateName">

                        <!-- 카테고리 설명 입력 -->
                        <label for="categoryDescription">카테고리 설명</label>
                        <textarea id="categoryDescription" name="categoryDescription" rows="4"
                            placeholder="카테고리에 대한 설명을 입력하세요"></textarea>

                        <!-- 등록 버튼 -->
                        <button type="submit">등록</button>
                    </form>
                </div>

                <!-- Right Form: Size Registration -->
                <div class="form-container">
                    <h2 style="text-align: center;">사이즈 등록</h2>
                    <form id="sizeForm" action="/size/registerProc" method="post" onsubmit="return validateSizeForm()">
                        <!-- 사이즈 코드 입력 -->
                        <label for="sizeCode">사이즈 코드</label>
                        <input type="text" id="sizeCode" name="sizeCode">

                        <!-- 사이즈 이름 입력 -->
                        <label for="sizeName">사이즈 이름</label>
                        <input type="text" id="sizeName" name="sizeName">

                        <!-- 사이즈 설명 입력 -->
                        <label for="sizeDescription">사이즈 설명</label>
                        <textarea id="sizeDescription" name="sizeDescription" rows="4"
                            placeholder="사이즈에 대한 설명을 입력하세요"></textarea>

                        <!-- 등록 버튼 -->
                        <button type="submit">등록</button>
                    </form>
                </div>

                <!-- Right Form: Color Registration -->
                <div class="form-container">
                    <h2 style="text-align: center;">색상 코드 등록</h2>
                    <form id="colorForm" action="/color/registerProc" method="post"
                        onsubmit="return validateColorForm()">
                        <!-- 색상 코드 입력 -->
                        <label for="colorCode">색상 코드</label>
                        <input type="text" id="colorCode" name="colorCode">

                        <!-- 색상 이름 입력 -->
                        <label for="colorName">색상 이름</label>
                        <input type="text" id="colorName" name="colorName">

                        <!-- 등록 버튼 -->
                        <button type="submit">등록</button>
                    </form>
                </div>
            </div>

            <!-- 스크립트 시작 -->
            <script>
                // 카테고리 폼 유효성 검사 함수
                function validateCategoryForm() {
                    // 이전 오류 표시 제거
                    resetCategoryBorders();

                    // 필수 필드 검사
                    var categoryName = document.getElementById('cateName').value.trim();
                    var categoryDescription = document.getElementById('categoryDescription').value.trim();

                    if (categoryName === "") {
                        markAsCategoryError('cateName');
                        return false;
                    }

                    // 추가적인 유효성 검사 규칙을 여기에 추가할 수 있습니다.

                    // 폼이 유효하면 제출
                    return true;
                }

                // Size 폼 유효성 검사 함수
                function validateSizeForm() {
                    // 이전 오류 표시 제거
                    resetSizeBorders();

                    // 필수 필드 검사
                    var sizeName = document.getElementById('sizeName').value.trim();
                    var sizeDescription = document.getElementById('sizeDescription').value.trim();

                    if (sizeName === "") {
                        markAsSizeError('sizeName');
                        return false;
                    }

                    // 추가적인 유효성 검사 규칙을 여기에 추가할 수 있습니다.

                    // 폼이 유효하면 제출
                    return true;
                }

                // Color 폼 유효성 검사 함수
                function validateColorForm() {
                    // 이전 오류 표시 제거
                    resetColorBorders();

                    // 필수 필드 검사
                    var colorName = document.getElementById('colorName').value.trim();

                    if (colorName === "") {
                        markAsColorError('colorName');
                        return false;
                    }

                    // 추가적인 유효성 검사 규칙을 여기에 추가할 수 있습니다.

                    // 폼이 유효하면 제출
                    return true;
                }

                // Category 오류 표시 제거 함수
                function resetCategoryBorders() {
                    var inputs = document.getElementById('categoryForm').getElementsByTagName('input');
                    for (var i = 0; i < inputs.length; i++) {
                        inputs[i].classList.remove('error');
                    }

                    var textarea = document.getElementById('categoryDescription');
                    textarea.classList.remove('error');
                }

                // Category 오류 표시 함수
                function markAsCategoryError(elementId) {
                    document.getElementById(elementId).classList.add('error');
                }

                // Size 오류 표시 제거 함수
                function resetSizeBorders() {
                    var inputs = document.getElementById('sizeForm').getElementsByTagName('input');
                    for (var i = 0; i < inputs.length; i++) {
                        inputs[i].classList.remove('error');
                    }

                    var textarea = document.getElementById('sizeDescription');
                    textarea.classList.remove('error');
                }

                // Size 오류 표시 함수
                function markAsSizeError(elementId) {
                    document.getElementById(elementId).classList.add('error');
                }

                // Color 오류 표시 제거 함수
                function resetColorBorders() {
                    var inputs = document.getElementById('colorForm').getElementsByTagName('input');
                    for (var i = 0; i < inputs.length; i++) {
                        inputs[i].classList.remove('error');
                    }
                }

                // Color 오류 표시 함수
                function markAsColorError(elementId) {
                    document.getElementById(elementId).classList.add('error');
                }

            </script>
            <!-- 스크립트 종료 -->
        </body>

        </html>