<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:import url="/header" />
        <c:import url="/sider" />
        <link rel="stylesheet" href="/css/deletestyle.css">
        <style>
            .header-section {
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .page-name-box {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .page-name {
                font-size: 32px;
                font-weight: 900;
                align-self: flex-end;
            }
        </style>
        <div class="content-container">
            <div class="header-section">
                <div class="page-name-box">
                    <div class="page-name">매장 삭제</div>
                </div>
            </div>
            <div class="center">
                <div class="container">
                    <h1 class="error-msg">정말 삭제하시겠습니까?</h1>
                    <h4 class="error-msg">${msg}</h4>
                    <table class="form-container">
                        <tr>
                            <td>
                                <form action="storeDeleteProc" method="post">
                                    <input class="input-field" type="text" name="id" value="${param.id}"
                                        readonly="readonly"><br>
                                    <input class="button" type="submit" value="매장 삭제"
                                        style="border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;">
                                    <input class="cancel-button" type="button" value="취소"
                                        style="border-top-width: 0px; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px;"
                                        onclick="location.href='/manageInfo?id=${sessionScope.id}'">
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>