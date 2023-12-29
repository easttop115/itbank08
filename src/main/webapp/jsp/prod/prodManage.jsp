<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>상품 등록 조회</title>

      <!-- ------------------------------------------------------------------------ -->

      <style>
        div {
          width: 100%;
        }

        div.left {
          width: 60%;
          float: left;
          box-sizing: border-box;
        }

        div.right {
          width: 40%;
          float: right;
          box-sizing: border-box;

        }

        /* ------ title ------ */
        div.left .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: left;
          margin: 20px 20px;
        }

        div.right .inventory-title2 {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: center;
          margin: 20px auto;
        }

        /* 검색창 */
        div.left .search-container {
          width: 90%;
          display: flex;
          justify-content: center;
          align-items: center;
          margin-bottom: 20px;
          border: 2px solid #2895F4;
          border-radius: 8px;
          padding: 20px;
          /* 상하좌우 내부 여백 동일하게 조정 */
          background-color: #cadae7;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          margin: 10px 30px auto 16px;
        }

        /* 검색창 내부 입력창 */
        .txtProductName {
          width: 360px;
        }

        .searchOption {
          width: 100px;
        }

        .search-table {
          width: 500px;
        }

        .search-button {
          padding: 0 10px;
          border: #626161;
          border-radius: 4px;
        }

        /* 등록된 상품 조회 리스트 */
        div.left .prodList-table {
          border: 1px solid rgb(168, 168, 168);
          border-radius: 20px;
          border-collapse: collapse;
          width: 96%;
          margin: 10px auto;
          text-align: center;
        }

        div.left .prodList-table td {
          border: 1px solid #626161;
          padding: 4px;
          text-align: center;
          height: 10px;
        }

        div.left .prodList-table tr:first-child {
          background-color: #cadae7;
          border: 1px solid #626161;
          border-radius: 4px;
        }

        div.left .prodList-table .second-table-content {
          height: 400px;
          overflow: auto;
          /* 스크롤바 추가 */
        }

        .prodNo {
          width: 10%;
        }

        .prodCode {
          width: 35%;
        }

        .prodName {
          width: 25%;
        }

        .totalQuan {
          width: 15%;
        }

        .prodManage {
          width: 15%;
        }


        div.right .container {
          margin: 12% auto;
          width: 90%;
          border: 2px solid #2895F4;
          border-radius: 20px;
          background-color: white;
        }

        /* 새로운 테이블 스타일 */
        div.right .container .newTable {
          width: 90%;
          margin: 4px auto 20px auto;
          height: 60%;
        }

        div.right .container .newTable td {
          border: 1px solid black;
          text-align: center;
        }

        div.right .container .newTable td:first-child {
          background-color: #cadae7;
        }

        div.right .container .newTable td:second-child {
          background-color: white;
        }

        div.right .container .newTable td:second-child .prodContent {
          width: 96%;
        }

        /* 미디어 쿼리 추가 */
        @media (min-width: 768px) {

          .search-container,
          .prodList-table,
          .newTable {
            width: 48%;
            margin: 8px;
            /* 간격을 주기 위해 추가 */
          }
        }
      </style>

      <!-- ------------------------------------------------------------------------ -->
      <script>

      </script>

      <!-- ------------------------------------------------------------------------ -->
    </head>


    <body>
      <c:import url="/header" />
      <div>

        <div class="left">
          <h2 class="inventory-title">상품 조회</h2>
          <div class="center">
            <div class="search-container">
              <table class="search-table">
                <tbody>
                  <tr>
                    <td>
                      <select id="searchOption" class="searchOption">
                        <option value="cateGroup">카테그룹</option>
                      </select>
                      <select id="searchOption" class="searchOption">
                        <option value="cateCode">카테코드</option>
                      </select>
                      <select id="searchOption" class="searchOption">
                        <option value="color">색 상</option>
                      </select>
                      <select id="searchOption" class="searchOption">
                        <option value="size">사이즈</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <input type="text" id="txtProductName" placeholder="상품 검색어 입력" class="txtProductName">
                      <button class="search-button" onclick="searchProducts()">검색</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div>
            <form action="" method="">
              <table class="prodList-table">
                <tr>
                  <td class="prodNo">No</td>
                  <td class="prodCode">상품코드</td>
                  <td class="prodName">상품명</td>
                  <td class="totalQuan">재고량</td>
                  <td class="prodManage">상품관리</td>
                </tr>
                <c:choose>
                  <c:when test="${empty DataList}">
                    <tr class="second-table-content">
                      <td colspan="5">조회된 정보가 없습니다.</td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="item" items="${DataList}">
                      <tr>
                        <td class="prodNo">No</td>
                        <td class="prodCode">상품코드</td>
                        <td class="prodName">상품명</td>
                        <td class="totalQuan">재고량</td>
                        <td class="prodManage">상품관리</td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>

                </c:choose>
                </tr>
              </table>
          </div>
        </div>

        <div class="right">

          <div class="container">
            <h2 class="inventory-title2">{상품코드}</h2>
            <table class="newTable">
              <tr>
                <td>상품명</td>
                <td>{상품명}</td>
              </tr>
              <tr>
                <td>카테고리</td>
                <td>{cateGroup}/{cateCode}</td>
              </tr>
              <tr>
                <td>입고가격</td>
                <td>{입고가격}</td>
              </tr>
              <tr>
                <td>판매가격</td>
                <td>{판매가격}</td>
              </tr>
              <tr>
                <td>prod</td>
                <td>{판매가격}</td>
              </tr>
              <tr>
                <td>비고</td>
                <td><textarea name="prodContent" class="prodContent" rows="15"></textarea></td>
              </tr>
            </table>
            <input type="submit" value="등록">
            <input type="submit" value="상품 삭제">
          </div>
        </div>
      </div>
    </body>

    </html>