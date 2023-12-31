<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <link rel="icon" href="/image/sc.png">
            <title>Stock City</title>
            <link rel="stylesheet" href="/css/header.css">
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
        </head>

        <body>
            <!-- 네비게이션 바 및 하위 메뉴 구조 -->
            <ul class="navbar">
                <div>
                    <a href="/main/mainform"><img src="/image/white_logo.png"
                            style="margin-right: 250px; width: 80px; height: auto;"></a>
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
                    <a href="/userInfo?id=${sessionScope.id}" style="margin-left: 250px; font-size: 12px;">MYPAGE</a>
                    <a href="${context}/logout" style="margin-left: 10px; font-size: 12px;">LOGOUT</a>
                </div>
            </ul>
        </body>

        </html>