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

                .right p {
                    text-align: center;
                    font-weight: bold;
                    color: red;
                }

                /* form-container 스타일 수정 */
                .form-container {
                    display: grid;
                    grid-template-columns: max-content auto;
                    gap: 10px;
                    text-align: center;
                    margin-right: 100px;
                    max-width: 100%;
                    margin-top: -30%;
                    margin-bottom: 15%;
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
                    <p id="errorMsg">${msg}</p>
                    <form class="form-container" action="/registProc" method="post">
                        <label class="form-label" for="id">아이디</label>
                        <input class="form-input" type="text" name="id" value="${param.id}">

                        <label class="form-label" for="pw">비밀번호</label>
                        <input class="form-input" type="password" name="pw" value="${param.pw}">

                        <label class="form-label" for="confirm">비밀번호 확인</label>
                        <input class="form-input" type="password" name="confirm" value="${param.confirm}">

                        <label class="form-label" for="company">회사명</label>
                        <input class="form-input" type="text" name="company" value="${param.company}">

                        <label class="form-label" for="businessNo">사업자등록번호</label>
                        <input class="form-input" type="text" name="businessNo" value="${param.businessNo}">

                        <label class="form-label" for="email">이메일</label>
                        <input class="form-input" type="email" name="email" value="${param.email}">

                        <label class="form-label" for="tel">전화번호</label>
                        <input class="form-input" type="tel" name="tel" value="${param.tel}">

                        <input class="form-submit" type="submit" value="가입">
                        <button class="form-cancel" type="button" onclick="window.location.href='/'">취소</button>
                    </form>
                    <!-- 하단 브랜드 로고 -->
                    <div class="brand-bottom">
                        <img src="/image/sc.png" alt="브랜드 로고">
                    </div>
                </div>
            </div>
            <script>
                // 에러 메시지를 표시하는 요소
                var errorMsg = document.getElementById('errorMsg');
                var idInput = document.getElementsByName('id')[0];
                var pwInput = document.getElementsByName('pw')[0];
                var confirmInput = document.getElementsByName('confirm')[0];
                var companyInput = document.getElementsByName('company')[0];
                var businessNoInput = document.getElementsByName('businessNo')[0];
                var emailInput = document.getElementsByName('email')[0];
                var telInput = document.getElementsByName('tel')[0];

                // ${msg}의 값에 따라 스타일을 동적으로 변경
                if (errorMsg.innerText === '아이디를 입력해주세요.') {
                    idInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '비밀번호를 입력해주세요.') {
                    pwInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '두 비밀번호가 다릅니다.') {
                    pwInput.style.border = '2px solid red';
                    confirmInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '회사명을 입력해주세요.') {
                    companyInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '사업자등록번호를 입력해주세요.') {
                    businessNoInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '이메일을 입력해주세요.') {
                    emailInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '전화번호를 입력해주세요.') {
                    telInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '아이디는 영문, 숫자, 4~20자 입력 가능합니다.') {
                    idInput.style.border = '2px solid red';
                } else if (errorMsg.innerText === '비밀번호는 영문, 숫자, !@#$%^&*, 6~20자 입력 가능합니다.') {
                    pwInput.style.border = '2px solid red';
                    confirmInput.style.border = '2px solid red';
                }
            </script>
        </body>

        </html>