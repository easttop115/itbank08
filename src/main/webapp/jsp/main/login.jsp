<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login</title>
            <style>
                html,
                body {
                    height: 100%;
                    margin: 0;
                    overflow: hidden;
                }

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

                .left {
                    background-color: #2895F4;
                    position: relative;
                }

                .brand {
                    position: absolute;
                    top: 10px;
                    left: 10px;
                    display: flex;
                    align-items: center;
                }

                .brand img {
                    width: 80px;
                    height: auto;
                    margin-right: 10px;
                }

                .brand p {
                    margin: 0;
                    font-size: 30px;
                    font-weight: bold;
                    color: #ffffff;
                }

                .right {
                    background-color: #ffffff;
                }

                /* 로그인 폼을 위한 새로운 스타일 */
                .login-form {
                    text-align: center;
                }

                .login-input {
                    width: 50%;
                    padding: 10px;
                    margin: 10px;
                    border: 1px solid #ddd;
                    /* 테두리 추가 */
                    border-radius: 5px;
                    background-color: #fff;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    /* 그림자 추가 */
                }

                .login-button {
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
                    background-position: right;
                }

                .dynamic-text {
                    position: absolute;
                    bottom: 50%;
                    left: 50%;
                    transform: translate(-50%, 50%);
                    color: #fff;
                    font-size: 18px;
                    opacity: 1;
                    /* 초기 투명도를 1로 설정 */
                    animation: fadeIn 1s forwards;
                    /* 나타내기 효과를 위한 애니메이션 적용 */
                }

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
            <div class="grid">
                <div class="left">
                    <div class="brand">
                        <img src="/image/white.png" alt="브랜드 이미지">
                        <p>Stock City</p>
                    </div>
                    <!-- 수정된 동적 텍스트 위치 -->
                    <p id="dynamicText" class="dynamic-text"></p>
                </div>
                <div class="right">
                    <form class="login-form" action="#">
                        <input class="login-input" type="text" placeholder="아이디">
                        <input class="login-input" type="password" placeholder="패스워드"><br>
                        <input class="login-button" type="submit" value="로그인">
                    </form>
                </div>
            </div>

            <script>
                const dynamicText = document.getElementById('dynamicText');
                const texts = ["누구나 손쉽게 승인받고 이용할 수 있는 서비스", "무료로 제공되는 재고 관리 서비스를 경험해보세요", "KG IT BANK 502호에서 만든 재고 서비스 최상!!! 반응형 웹 브라우저까지!"];
                let index = 0;

                function changeText() {
                    dynamicText.style.animation = 'none'; // 애니메이션 초기화
                    void dynamicText.offsetWidth; // 리플로우 강제 발생
                    dynamicText.style.animation = null; // 애니메이션 다시 설정
                    dynamicText.textContent = texts[index];
                    dynamicText.style.animation = 'fadeIn 1s forwards'; // 애니메이션 적용
                    index = (index + 1) % texts.length;
                }

                // 매 3초마다 텍스트 변경
                setInterval(changeText, 2500);
            </script>
        </body>
        </html>