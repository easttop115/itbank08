<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>

            <link rel="stylesheet" href="/css/sider.css">
            <script>

                var sidebar;
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
            <div class="sidebar">
                <!-- 사이드바 내용 -->
                <div class="sidebar-content">
                    <h3>Sidebar Content</h3>
                    <p>Some text or icons can go here.</p>
                </div>
            </div>
        </body>

        </html>