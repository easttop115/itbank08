<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:import url="/header" />
        <link rel="stylesheet" href="/css/userInfo.css">

        <body>
            <div class="center">
                <div class="container">
                    <h1 class="title">매장 정보</h1>
                    <div class="info">
                        <p class="info-item">아이디 : ${sessionScope.id}</p>
                        <p class="info-item">회사명 : ${sessionScope.company}</p>
                        <p class="info-item">이메일 : ${sessionScope.email}</p>
                        <p class="info-item">전화번호 : ${sessionScope.tel}</p>
                    </div>
                    <div class="button-group">
                        <button class="editBtn" type="button" onclick="location.href='/update'">수정</button>
                    </div>
                </div>
            </div>
        </body>