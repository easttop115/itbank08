<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <body>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>재고 관리 사이트</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f4f4f4;
                    display: flex;
                    justify-content: center;
                    /* 중앙 정렬 */
                    align-items: center;
                    /* 세로 정렬 */
                    height: 389px;
                    /* 높이를 화면 전체로 설정 */
                }

                .container {
                    display: flex;
                    max-width: 1200px;
                    background-color: #fff;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    margin: 20px;
                    /* 원하는 간격을 여기에 추가하세요 */
                    margin-top: 20px;
                }


                .notice-section,
                .board-section {
                    flex: 1;
                    /* 확장 가능한 공간을 나타내기 위해 flex 속성 추가 */
                    padding: 20px;
                }

                h2 {
                    color: #333;
                }

                .notice-list,
                .board-list {
                    list-style: none;
                    padding: 0;
                }

                .notice-item,
                .board-item {
                    background-color: #e0e0e0;
                    margin-bottom: 10px;
                    padding: 10px;
                    border-radius: 8px;
                }

                .board-item {
                    background-color: #d2f4fc;
                }

                .board-section {
                    order: 2;
                    /* Flex 아이템의 순서를 변경하여 오른쪽으로 이동 */
                    margin-left: 12px;
                    /* 오른쪽으로 쏠림을 해결 */
                    margin-top: 1px;
                    /* 위로 조금 올림 */
                }

                .notice-list {
                    display: flex;
                    margin-top: 10px;
                    flex-wrap: wrap;
                    /* 여러 열에 걸쳐 표시되도록 설정 */
                }

                .notice-item {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                    /* 간격 조절 */
                }

                .title,
                .writeDate {
                    margin-right: 10px;
                    /* 간격 조절 */
                }
            </style>


            <div class="container">
                <div class="notice-section">
                    <h2>Notice</h2>
                    <div class="notice-list">
                        <div class="title">제목</div>
                        <div class="writeDate">작성시간</div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="board-section">
                    <h2>입출고 요청</h2>
                </div>
            </div>

        </body>