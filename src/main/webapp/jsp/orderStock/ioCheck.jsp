<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>입고</title>
                <link rel="stylesheet" href="/css/prodManage.css">
            </head>

            <body>
                <c:import url="/header" />
                <c:import url="/sider" />
                <div class="content-container">
                    <h2 class="inventory-title">상품 입출고 조회</h2>

                    <!-- 라디오 버튼 폼 추가 -->
                    <form action="/ioCheck" method="get">
                        <label>
                            <input type="radio" name="radioButton" value="selectRequest"
                                ${fn:startsWith(param.radioButton, 'selectRequest' ) ? 'checked' : '' }> 입고
                        </label>
                        <label>
                            <input type="radio" name="radioButton" value="selectResponse"
                                ${fn:startsWith(param.radioButton, 'selectResponse' ) ? 'checked' : '' }> 출고
                        </label>
                        <input type="submit" value="조회">
                        <p style="color: red; font-weight: bold;">${msg}</p>
                    </form>

                    <div class="class">
                        <table class="prodList-table">
                            <tr>
                                <td>매장명</td>
                                <td>상품코드</td>
                                <td>신청 수량</td>
                                <td>신청 날짜</td>
                                <td>입출고 상태</td>
                            </tr>
                            <c:choose>
                                <c:when test="${not empty stocks}">
                                    <c:forEach var="stock" items="${stocks}">
                                        <tr>
                                            <c:choose>
                                                <c:when test="${(stock.orderStatus == 'reqApprove' or stock.orderStatus == 'request' or stock.orderStatus == 'denied') and radioButton == 'selectRequest'}">
                                                    <td>${stock.reqStore}</td>
                                                    <td>${stock.prodNo}</td>
                                                    <td>${stock.reqQuan}</td>
                                                    <td>${stock.reqDate}</td>
                                                    <c:choose>
                                                        <c:when test="${stock.orderStatus == 'request' and sessionScope.accountId == 'root'}">
                                                            <td>
                                                                <a href="/storingApprove?reqStore=${stock.reqStore}&prodNo=${stock.prodNo}&reqDate=${stock.reqDate}" style="text-decoration: none; margin-right: 10px;">승인</a>
                                                                <a href="/storingDenied?reqStore=${stock.reqStore}&prodNo=${stock.prodNo}&reqDate=${stock.reqDate}" style="text-decoration: none;">거절</a>
                                                            </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>${stock.orderStatus}</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${stock.orderStatus == 'response' and radioButton == 'selectResponse'}">
                                                    <td>본사</td>
                                                    <td>${stock.prodNo}</td>
                                                    <td>${stock.respQuan}</td>
                                                    <td>${stock.respDate}</td>
                                                    <td>${stock.orderStatus}</td>
                                                </c:when>
                                            </c:choose>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </table>
                    </div>
                </div>
            </body>

            </html>