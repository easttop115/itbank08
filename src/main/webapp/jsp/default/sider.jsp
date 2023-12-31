<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <link rel="icon" href="/image/sc.png">
            <title>Stock City</title>
            <script>
                // DOMContentLoaded 이벤트가 발생하면 실행되는 함수
                document.addEventListener("DOMContentLoaded", function () {
                    // navbar의 li 요소들을 모두 선택
                    var navbars = document.querySelectorAll('.navbar > li');
                    // 모든 subList 요소를 선택
                    var allSubLists = document.querySelectorAll('.subList');

                    // 각 navbar에 대해 이벤트 리스너 추가
                    navbars.forEach(function (navbar) {
                        // 마우스 오버 이벤트에 대한 처리
                        navbar.addEventListener('mouseover', function () {
                            allSubLists.forEach(function (subList) {
                                // subList의 높이를 가져와서 적용
                                var height = subList.scrollHeight;
                                subList.style.height = height + 'px';
                            });
                        });

                        // 마우스 아웃 이벤트에 대한 처리
                        navbar.addEventListener('mouseout', function () {
                            // 모든 subList를 감추도록 설정
                            allSubLists.forEach(function (subList) {
                                // subList의 높이를 0으로 설정하여 감춤
                                subList.style.height = '0';
                            });
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
                .navbar a {
                    text-decoration: none;
                    font-size: 20px;
                }

                .subList a {
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
                    position: fixed;
                    /* 헤더를 고정 */
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
                .navbar>li:hover,
                .navbar>li:hover li {
                    background-color: #0059ff;
                    transition-duration: 0.5s;
                }

                /* subList 내부 각 요소의 스타일 */
                .subList>li {
                    line-height: 50px;
                    background-color: #2895F4;
                }

                /* subList 초기 상태 설정 */
                .subList {
                    height: 0;
                    overflow: hidden;
                }

                .navbar:hover .subList {
                    height: 250px;
                    transition-duration: 1s;
                }

                /* subList 박스 색 변경 */
                .navbar>li>.subList li:hover {
                    background-color: #2895F4;
                }

                /* 사이드바 스타일 */
                .sidebar {
                    width: 20%;
                    /* 필요에 따라 너비 조정 */
                    height: 100vh;
                    /* 뷰포트 높이에 맞춤 */
                    background-color: #cadae7;
                    /* 사이드바 배경색 */
                    position: fixed;
                    top: 0;
                    right: 0;
                    z-index: 999;
                    margin-top: 30px;
                    /* 항상 위에 유지 */
                }

                /* 사이드바 내용 스타일 */
                .sidebar-content {
                    padding: 20px;
                    color: #2895F4;
                }

                /* 컨텐츠 컨테이너 스타일 */
                .content-container {
                    margin: 20px auto 20% 0;
                    width: 78%;
                    /* 사이드바 너비에 따라 여백 조정 */
                    padding: 20px;
                    /* 내용에 여백 추가 */
                    transition: margin-left 0.5s;
                    /* 전환 효과 추가 */
                }
            </style>
        </head>

        <body>
            <!-- 네비게이션 바 및 하위 메뉴 구조 -->
            <ul class="navbar">
                <li>
                    <a href="#">상품관리</a>
                    <ul class="subList">
                        <li><a href="/prodInsert">상품등록</a></li>
                        <li><a href="/prodManage">등록상품관리</a></li>
                        <li><a href="/stockStatus">매장별 재고 현황</a></li>

                    </ul>
                </li>
                <li>
                    <a href="#">입출고등록</a>
                    <ul class="subList">
                        <li><a href="#">입출고개별등록</a></li>
                        <li><a href="#">입출고내역조회</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">판매통계</a>
                    <ul class="subList">
                        <li><a href="#">판매통계</a></li>
                        <li><a href="#">일일통계</a></li>
                        <li><a href="#">월별통계</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">블라블라</a>
                    <ul class="subList">
                        <li><a href="#">블라블라</a></li>
                        <li><a href="#">sub02</a></li>
                        <li><a href="#">sub03</a></li>
                        <li><a href="#">sub04</a></li>
                        <li><a href="#">sub05</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">SC</a>
                    <ul class="subList">
                        <li><a href="#">수아</a></li>
                        <li><a href="#">연지</a></li>
                        <li><a href="#">동현</a></li>
                        <li><a href="#">동운</a></li>
                        <li><a href="#">상원</a></li>
                    </ul>
                </li>
            </ul>

            <!-- 사이드바 -->
            <div class="sidebar">
                <!-- 사이드바 내용 -->
                <div class="sidebar-content">
                    <h3>Sidebar Content</h3>
                    <p>Some text or icons can go here.</p>
                </div>
            </div>
        </body>

        </html>