<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <link rel="icon" href="/image/sc.png">
            <title>Stock City</title>
            <link rel="stylesheet" href="/css/header.css">
            <link rel="stylesheet" href="css/sider.css">
            <script>

                var sidebar;
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

                document.addEventListener("DOMContentLoaded", function () {
                    var navbars = document.querySelectorAll('.navbar > li');
                    var allSubLists = document.querySelectorAll('.subList');
                    var sidebar = document.querySelector('.sidebar');

                    // 이전 스크롤 위치를 저장할 변수
                    var prevScrollPos = window.scrollY;

                    // 스크롤 이벤트 리스너
                    window.addEventListener('scroll', function () {
                        var currentScrollPos = window.scrollY;

                        if (currentScrollPos > prevScrollPos) {
                            // 스크롤이 내려갈 때
                            sidebar.classList.add('hidden');
                        } else {
                            // 스크롤이 올라갈 때
                            sidebar.classList.remove('hidden');
                        }

                        prevScrollPos = currentScrollPos;
                    });

                    navbars.forEach(function (navbar) {
                        navbar.addEventListener('mouseover', function () {
                            allSubLists.forEach(function (subList) {
                                var height = subList.scrollHeight;
                                subList.style.height = height + 'px';
                            });
                        });

                        navbar.addEventListener('mouseout', function () {
                            allSubLists.forEach(function (subList) {
                                subList.style.height = '0';
                                sidebar.classList.add('hidden');
                            });
                        });
                    });
                });
            </script>
        </head>

        <body>
            <!-- 네비게이션 바 및 하위 메뉴 구조 -->
            <ul class="navbar">
                <div>
                    <a href="/main/mainform"><img src="/image/white_logo.png"
                            style="margin-left: -100%; width: 80px; height: auto;"></a>
                </div>
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
                    <a href="#">게시판</a>
                    <ul class="subList">
                        <li><a href="/notice/noticecontent">공지사항</a></li>
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
                <div>
                    <a href="${context}/userInfo" style="margin-left: 110%; font-size: 12px;">MYPAGE</a>
                </div>
                <div>
                    <a href="${context}/logout" style="margin-left: 150%; font-size: 12px;">LOGOUT</a>
                </div>
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