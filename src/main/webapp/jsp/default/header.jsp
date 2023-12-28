<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <script>
                // DOMContentLoaded 이벤트가 발생하면 실행되는 함수
                document.addEventListener("DOMContentLoaded", function () {
                    // navbar의 li 요소들을 모두 선택
                    var navbars = document.querySelectorAll('.navbar > li');

                    // 각 navbar에 대해 이벤트 리스너 추가
                    navbars.forEach(function (navbar) {
                        // 현재 navbar의 subList를 선택
                        var subList = navbar.querySelector('.subList');

                        // 마우스 오버 이벤트에 대한 처리
                        navbar.addEventListener('mouseover', function () {
                            // subList의 높이를 가져와서 적용
                            var height = subList.scrollHeight;
                            subList.style.height = height + 'px';
                        });

                        // 마우스 아웃 이벤트에 대한 처리
                        navbar.addEventListener('mouseout', function () {
                            // subList의 높이를 0으로 설정하여 감춤
                            subList.style.height = '0';
                        });
                    });
                });
            </script>

            <style>
                /* 전체 초기화 스타일 */
                * {
                    padding: 0;
                    margin: 0;
                }

                /* 리스트 스타일 제거 */
                li {
                    list-style: none;
                }

                /* 링크 스타일 설정 */
                a {
                    text-decoration: none;
                    font-size: 14px;
                }

                /* 네비게이션 바 스타일 */
                .navbar {
                    width: 100%;
                    overflow: hidden;
                    margin: 0;
                    background-color: #2895F4;
                    top: 0;
                    z-index: 1000;
                }

                /* 각 navbar의 스타일 */
                .navbar>li {
                    width: 20%;
                    float: left;
                    text-align: center;
                    line-height: 40px;
                    background-color: #2895F4;
                    position: relative;
                }

                /* navbar 내부 링크의 색상 설정 */
                .navbar a {
                    color: #fff;
                }

                /* navbar hover 시 배경색 변경 */
                .navbar>li:hover {
                    background-color: #79c1ff;
                    transition-duration: 0.5s;
                }

                /* subList 내부 각 요소의 스타일 */
                .subList>li {
                    line-height: 50px;
                    background-color: #79c1ff;
                }

                /* subList 초기 상태 설정 */
                .subList {
                    height: 0;
                    overflow: hidden;
                }

                /* navbar hover 시 subList 펼치기 애니메이션 설정 */
                .navbar>li:hover .subList {
                    height: 250px;
                    transition-duration: 1s;
                }

                /* subList 내부 링크 hover 시 색상 변경 */
                .navbar>li>.subList a:hover {
                    color: black;
                }
            </style>
        </head>

        <body>
            <!-- 네비게이션 바 및 하위 메뉴 구조 -->
            <ul class="navbar">
                <li>
                    <a href="#">HOME</a>
                    <!-- HOME 하위 메뉴 -->
                    <ul class="subList">
                        <li><a href="#">sub01</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">NEWS</a>
                    <!-- NEWS 하위 메뉴 -->
                    <ul class="subList">
                        <li><a href="#">sub01</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">DROPDOWN</a>
                    <!-- DROPDOWN 하위 메뉴 -->
                    <ul class="subList">
                        <li><a href="#">sub01</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">NAVBAR</a>
                    <!-- NAVBAR 하위 메뉴 -->
                    <ul class="subList">
                        <li><a href="#">sub01</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">SC</a>
                    <!-- SC 하위 메뉴 -->
                    <ul class="subList">
                        <li><a href="#">sub01</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
            </ul>
        </body>

        </html>