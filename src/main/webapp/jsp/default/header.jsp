<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dropdowns = document.querySelectorAll('.dropdown');

                dropdowns.forEach(function (dropdown) {
                    var dropdownContent = dropdown.querySelector('.dropdown-content');

                    dropdown.addEventListener('mouseover', function () {
                        var height = dropdownContent.scrollHeight;
                        dropdownContent.style.height = height + 'px';
                    });

                    dropdown.addEventListener('mouseout', function () {
                        dropdownContent.style.height = '0';
                    });
                });
            });
        </script>

        <style>
            /* 스타일링 */
            .navbar {
                overflow: hidden;
                background-color: #333;
                margin: 0;
                padding: 0;
            }

            .navbar .dropdown:hover {
                height: 102px;
                /* Adjust based on how much you want to push the navbar */
            }

            .navbar a {
                float: left;
                font-size: 16px;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                margin-right: -6px;
                transition: background-color 0.5s;
            }

            .dropdown {
                float: left;
                overflow: hidden;
            }

            .navbar .dropdown {
                height: 50px;
                /* 기본 높이, 필요에 따라 조절 */
                transition: height 0.5s;
                /* 높이 전환을 위한 애니메이션 속성 추가 */
            }

            .dropdown .dropbtn {
                font-size: 16px;
                border: none;
                outline: none;
                color: white;
                padding: 14px 30px;
                background-color: inherit;
                font-family: inherit;
                margin-left: 7px;
            }

            .navbar a,
            .dropdown:hover .dropbtn {
                background-color: orangered;

            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                overflow: hidden;
                height: 0;
                /* 초기 높이를 0으로 설정 */
                transition: height 0.5s, left 0.5s;
                left: 15px;
                /* 초기 위치를 0으로 설정 */
            }

            .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
                display: inline-block;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                opacity: 1;
                /* 호버 시 투명도를 1로 설정하여 서서히 나타나게 함 */
            }
        </style>
        </head>

        <body>

            <div class="navbar">
                <div class="dropdown">
                    <button class="dropbtn">Home
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">News
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">Dropdown
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
            </div>
           