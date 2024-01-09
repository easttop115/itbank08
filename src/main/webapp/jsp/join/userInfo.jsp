<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:import url="/header" />

        <div class="center">
            <div class="container">
                <h1 class="title">정보</h1>
                <div class="info">
                    <p class="info-item">아이디 : ${sessionScope.id}</p>
                    <p class="info-item">비밀번호 : ********</p>
                    <p class="info-item">이메일 : ${sessionScope.email}</p>
                    <p class="info-item">전화번호 : ${sessionScope.tel}</p>
                </div>
                <div class="button-group">
                    <button class="searchBtn" type="button" onclick="location.href='update'">수정</button>
                </div>
            </div>
        </div>