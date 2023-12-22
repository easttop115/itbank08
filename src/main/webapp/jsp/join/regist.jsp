<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>회원가입</title>

            <link rel="stylesheet"
                href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
            <style>
                /* 전체 페이지 설정 */
                html,
                body {
                    height: 100%;
                    margin: 0;
                    overflow: hidden;
                    font-family: 'Noto Sans KR', sans-serif;
                }

                /* 그리드 레이아웃 설정 */
                .grid {
                    display: flex;
                    height: 100vh;
                }

                .grid div {
                    flex: 1;
                    display: grid;
                    align-items: center;
                    justify-content: center;
                    padding: 20px;
                }

                /* 왼쪽 영역 설정 */
                .left {
                    background-color: #2895F4;
                    position: relative;
                }

                /* 브랜드 로고 설정 */
                .brand {
                    position: absolute;
                    top: 10px;
                    left: 10px;
                    display: flex;
                    align-items: center;
                }

                .brand p {
                    margin: 0;
                    font-size: 30px;
                    font-weight: bold;
                    color: #ffffff;
                }

                h1.regist-text {
                    font-size: 30px;
                    font-weight: bold;
                    color: #ffffff;
                }

                p.regist-text {
                    font-size: 20px;
                    color: #ffffff;
                    margin-top: -150%;
                }

                /* 오른쪽 영역 설정 */
                .right {
                    background-color: #ffffff;
                    position: relative;
                }

                /* form-container 스타일 수정 */
                .form-container {
                    display: grid;
                    grid-template-columns: max-content auto;
                    gap: 10px;
                    text-align: center;
                    margin-right: 100px;
                    max-width: 100%;
                }

                .form-label {
                    text-align: right;
                    white-space: nowrap;
                    margin-top: 5%;
                }

                /* input 태그 스타일 추가 */
                .form-input {
                    padding: 8px;
                    margin-bottom: 16px;
                    box-sizing: border-box;
                    border-radius: 10px;
                    /* 둥글게 */
                    border: 1px solid #ccc;
                    /* 테두리 추가 */
                }

                .form-submit {
                    padding: 10px;
                    width: 80%;
                    margin-left: 90%;
                    cursor: pointer;
                    border: none;
                    border-radius: 20px;
                    color: #000000;
                }

                .form-cancel {
                    padding: 10px;
                    width: 50%;
                    margin-left: 50%;
                    cursor: pointer;
                    border: none;
                    border-radius: 20px;
                    color: #000000;
                }

                .form-submit:hover,
                .form-cancel:hover {
                    background-color: #2895F4;
                    color: #ffffff;
                }

                .brand-bottom {
                    position: absolute;
                    bottom: 20px;
                    left: 50%;
                    transform: translateX(-50%);
                }

                .brand-bottom img {
                    width: 80px;
                    height: auto;
                }
            </style>
        </head>

        <body>
            <div class="grid">
                <!-- 왼쪽 영역 -->
                <div class="left">
                    <!-- 브랜드 로고 -->
                    <div class="brand">
                        <p>Stock City</p>
                    </div>
                    <h1 class="regist-text">회원가입 유의사항</h1>
                    <p class="regist-text">블라블라블라<br>계약 위반 시, 철회 블라블라블라<br>미리 메리 크리스마스~!</p>
                </div>

                <!-- 오른쪽 영역 -->
                <div class="right">
                    <form class="form-container" action="/registProc" method="post">
                        <input type="hidden" name="no" value="">
                        <input type="hidden" name="regDate" value="<%= java.time.LocalDateTime.now() %>">

                        <label class="form-label" for="id">ID</label>
                        <input class="form-input" type="text" id="id" name="id" required>

                        <label class="form-label" for="pw">Password</label>
                        <input class="form-input" type="password" id="pw" name="pw" required>

                        <label class="form-label" for="company">회사명</label>
                        <input class="form-input" type="text" id="company" name="company" required>

                        <label class="form-label" for="businessNo">사업자등록번호</label>
                        <input class="form-input" type="text" id="businessNo" name="businessNo" required>

                        <label class="form-label" for="email">이메일</label>
                        <input class="form-input" type="email" id="email" name="email" required>

                        <label class="form-label" for="tel">전화번호</label>
                        <input class="form-input" type="tel" id="tel" name="tel" required>

                        <input class="form-submit" type="submit" value="가입">
                        <button class="form-cancel" type="button" onclick="history.back()">취소</button>
                    </form>
                    <!-- 하단 브랜드 로고 -->
                    <div class="brand-bottom">
                        <img src="/image/sc.png" alt="브랜드 로고">
                    </div>
                </div>
            </div>
        </body>

        </html>