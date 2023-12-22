<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <!-- 문서 정보 설정 -->
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>로그인</title>

            <!-- 스타일 설정 -->
            <style>
                /* 전체 페이지 설정 */
                html,
                body {
                    height: 100%;
                    margin: 0;
                    overflow: hidden;
                }

                /* 그리드 레이아웃 설정 */
                .grid {
                    display: flex;
                    height: 100vh;
                }

                .grid div {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    text-align: center;
                    padding: 20px;
                    box-sizing: border-box;
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

                /* 오른쪽 영역 설정 */
                .right {
                    background-color: #ffffff;
                    position: relative;
                }

                /* 로그인 폼 설정 */
                .login-form {
                    text-align: center;
                }

                .login-input {
                    width: 50%;
                    padding: 10px;
                    margin: 10px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    background-color: #fff;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                .login-button {
                    /* 로그인 버튼 스타일 설정 */
                    position: relative;
                    margin-top: 20px;
                    margin-bottom: 40px;
                    width: 55%;
                    height: 40px;
                    background: linear-gradient(125deg, #79c1ff, #2895F4, #79c1ff);
                    background-position: left;
                    background-size: 200%;
                    color: white;
                    font-weight: bold;
                    border: none;
                    cursor: pointer;
                    transition: 0.4s;
                    display: inline;
                    border-radius: 6px;
                }

                .login-button:hover {
                    /* 로그인 버튼 호버 효과 설정 */
                    background-position: right;
                }

                .signup-button {
                    /* 회원가입 버튼 스타일 설정 */
                    color: rgb(155, 155, 155);
                    font-weight: bold;
                    cursor: pointer;
                    text-decoration: none;
                    transition: color 0.4s;
                }

                .signup-button:hover {
                    /* 회원가입 버튼 호버 효과 설정 */
                    color: #2895F4;
                }

                /* 하단 브랜드 로고 설정 */
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

                /* 동적 텍스트 설정 */
                .dynamic-text {
                    position: absolute;
                    width: 100%;
                    bottom: 50%;
                    left: 50%;
                    transform: translate(-50%, 50%);
                    color: #fff;
                    font-size: 18px;
                    opacity: 1;
                    animation: fadeIn 1s forwards;
                }

                /* 페이드인 애니메이션 설정 */
                @keyframes fadeIn {
                    from {
                        opacity: 0;
                    }

                    to {
                        opacity: 1;
                    }
                }
            </style>
        </head>

        <body>
            <!-- 그리드 레이아웃 구성 -->
            <div class="grid">
                <!-- 왼쪽 영역 -->
                <div class="left">
                    <!-- 브랜드 로고 -->
                    <div class="brand">
                        <p>Stock City</p>
                    </div>
                    <!-- 동적 텍스트 -->
                    <p id="dynamicText" class="dynamic-text">Stock City</p>
                </div>

                <!-- 오른쪽 영역 -->
                <div class="right">
                    <!-- 로그인 폼 -->
                    <form class="login-form" action="/loginProc" method="post">
                        <input class="login-input" type="text" placeholder="아이디">
                        <input class="login-input" type="password" placeholder="패스워드"><br>
                        <input class="login-button" type="submit" value="로그인"><br>
                        <a href="/join/regist" class="signup-button">회원가입</a>
                    </form>

                    <!-- 하단 브랜드 로고 -->
                    <div class="brand-bottom">
                        <img src="/image/sc.png" alt="브랜드 로고">
                    </div>
                </div>
            </div>

            <!-- 동적 텍스트 변경 스크립트 -->
            <script>
                const dynamicText = document.getElementById('dynamicText');
                const texts = ["누구나 손쉽게 승인받고 이용할 수 있는 서비스", "무료로 제공되는 재고 관리 서비스를 경험해보세요", "KG IT BANK 502호에서 만든 재고 서비스!!! 반응형 웹 브라우저까지!"];
                let index = 0;

                function changeText() {
                    dynamicText.style.animation = 'none';
                    void dynamicText.offsetWidth;
                    dynamicText.style.animation = null;
                    dynamicText.textContent = texts[index];
                    dynamicText.style.animation = 'fadeIn 1s forwards';
                    index = (index + 1) % texts.length;
                }

                setInterval(changeText, 2500);
            </script>
        </body>

        </html>