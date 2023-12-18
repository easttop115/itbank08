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
            /* 스크롤바 감춤 */
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
            /* 패딩을 포함한 전체 크기를 유지 */
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
            width: 40px; /* 필요에 따라 조절 */
            height: auto; /* 종횡비 유지 */
            margin-right: 10px;
        }

        .brand p {
            margin: 0;
            font-size: 16px;
            font-weight: bold;
            color: #333; /* 필요에 따라 조절 */
        }

        .right {
            background-color: #ffffff;
        }

        /* 미디어 쿼리 추가 */
        @media (max-width: 600px) {
            .grid {
                flex-direction: row;
                /* 세로로 쌓이는 대신 다시 가로로 배치 */
            }

            .grid div {
                flex: 1;
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
            <p>추가적인 내용(필요시)</p>
        </div>
        <div class="right">Login</div>
    </div>
</body>

</html>
