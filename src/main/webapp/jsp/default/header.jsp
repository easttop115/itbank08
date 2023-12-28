<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var navbars = document.querySelectorAll('.navbar > li');

        navbars.forEach(function (navbar) {
            var subList = navbar.querySelector('.subList');

            navbar.addEventListener('mouseover', function () {
                var height = subList.scrollHeight;
                subList.style.height = height + 'px';
            });

            navbar.addEventListener('mouseout', function () {
                subList.style.height = '0';
            });
        });
    });
</script>

<style>
    * {
        padding: 0;
        margin: 0;
    }

    li {
        list-style: none;
    }

    a {
        text-decoration: none;
        font-size: 14px;
    }

    .navbar {
        width: 100%;
        overflow: hidden;
        margin: 0;
        background-color: #2895F4;
        top: 0;
        z-index: 1000;
    }

    .navbar > li {
        width: 20%;
        float: left;
        text-align: center;
        line-height: 40px;
        background-color: #2895F4;
        position: relative;
    }

    .navbar a {
        color: #fff;
    }

    .navbar > li:hover {
        background-color: #79c1ff;
        transition-duration: 0.5s;
    }

    .subList > li {
        line-height: 50px;
        background-color: #79c1ff;
    }

    .subList {
        height: 0;
        overflow: hidden;
    }

    .navbar > li:hover .subList {
        height: 250px;
        transition-duration: 1s;
    }

    .navbar > li > .subList a:hover {
        color: black;
    }

    .push-content {
        transition: height 1s;
        overflow: hidden;
        height: 80px;
    }
</style>
</head>

<body>
    <ul class="navbar">
        <li>
            <a href="#">HOME</a>
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
            <ul class="subList">
                <li><a href="#">sub01</a></li>
                <li><a href="#">sub02</a></li>
                <li><a href="#">sub03</a></li>
                <li><a href="#">sub04</a></li>
                <li><a href="#">sub05</a></li>
            </ul>
        </li>
    </ul>
    <div class="push-content">
        <h3>Content goes here</h3>
        <p>Some text..</p>
    </div>
</body>

</html>
