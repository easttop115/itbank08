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

        .content-container {
          display: flex;
          align-items: flex-start;
          flex-wrap: wrap;
          /* 화면 크기에 따라 나란히 놓이도록 설정 */
        }

        div.left {
          width: 60%;
          float: left;
          box-sizing: border-box;
          text-align: center;
        }

        div.right {
          width: 40%;
          float: right;
          box-sizing: border-box;
          text-align: center;
          /* div.left 내부의 요소를 가운데 정렬 */

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
          width: 92%;
          display: flex;
          justify-content: center;
          align-items: center;
          margin: 0 auto;
          /* 가로 중앙 정렬을 위해 margin 추가 */
          margin-bottom: 20px;
          border: 2px solid #2895F4;
          border-radius: 8px;
          padding: 20px;
          /* 상하좌우 내부 여백 동일하게 조정 */
          background-color: #cadae7;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

        .No {
          width: 10%;
        }

        .prodNo {
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
          width: 100%;
          /* 원하는 너비로 조절할 수 있습니다. */
          resize: vertical;
          /* 세로 리사이즈 활성화 (선택사항) */
        }

        /* 미디어 쿼리 추가 */
        /* @media (min-width: 768px) {

          .search-container,
          .prodList-table,
          .newTable {
            width: 48%;
            margin: 8px; */
        /* 간격을 주기 위해 추가 */
        /* }
        } */

        @media (max-width: 768px) {

          div.left,
          div.right {
            width: 100%;
            float: none;
          }

          .search-container,
          .prodList-table,
          .newTable {
            width: 100%;
            margin: 8px;
          }
        }

        textarea {
          width: 100%;
          box-sizing: border-box;
        }
      </style>

    </head>


    <body>
      <c:import url="/header" />
      <div class="content-container">

        <div class="left">
          <h2 class="inventory-title">상품 조회</h2>
          <div class="center">
            <div class="search-container">
              <form id="searchForm" action="/prodManageProc" method="post">
                <table class="search-table">
                  <tbody>
                    <tr>
                      <td>
                        <select name="cateGroup" id="cateGroup" class="searchOption">
                          <c:choose>
                            <c:when test="${empty cateGroups}">
                              <option value="noCateGroup">카테고리 그룹</option>
                            </c:when>
                            <c:otherwise>
                              <c:forEach var="cateGroup" items="${cateGroups}">
                                <option value="${cateGroup.cateGroup}">${cateGroup.cateGroup}</option>
                              </c:forEach>
                            </c:otherwise>
                          </c:choose>
                        </select>
                        <select name="cateCode" id="cateCode" class="searchOption">
                          <c:choose>
                            <c:when test="${empty cateCodes}">
                              <option value="noCateCode">카테고리 코드</option>
                            </c:when>
                            <c:otherwise>
                              <c:forEach var="cateCode" items="${cateCodes}">
                                <option value="${cateCode.cateCode}">${cateCode.cateCode}</option>
                              </c:forEach>
                            </c:otherwise>
                          </c:choose>
                        </select>
                        <select name="color" id="color" class="searchOption">
                          <c:choose>
                            <c:when test="${empty colorCodes}">
                              <option value="noColor">색상코드</option>
                            </c:when>
                            <c:otherwise>
                              <c:forEach var="colorCode" items="${colorCodes}">
                                <option value="${colorCode.colorCode}">${colorCode.colorCode}</option>
                              </c:forEach>
                            </c:otherwise>
                          </c:choose>
                        </select>
                        <select id="size" name="size" required>
                          <option value="S">S</option>
                          <option value="M">M</option>
                          <option value="L">L</option>
                          <option value="XL">XL</option>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <input type="text" id="txtProductName" placeholder="상품 검색어 입력" class="txtProductName">
                        <input type="button" class="search-button" value="검색" onclick="searchProducts()">
                      </td>
                    </tr>
                  </tbody>
                </table>
              </form>
            </div>
          </div>
          <div>
            <!-- <form action="/prodList" method="post"> -->
            <table id="prodListTable" class="prodList-table">
              <tr>
                <td class="No">No</td>
                <td class="prodNo">상품코드</td>
                <td class="prodName">상품명</td>
                <td class="Quan">총수량</td>
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
                      <td class="No">${loop.index + 1}</td>
                      <td class="prodNo">${item.prodNo}</td>
                      <td class="prodName">${item.prodName}</td>
                      <td class="Quan">${item.quan}</td>
                      <td class="prodManage">
                        <button type="button"
                          onclick="manageProduct('${item.prodNo}', '${item.prodName}')">상품관리</button>
                      </td>
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
            <h2 class="inventory-title2">상품 관리</h2>
            <table class="newTable">
              <tr>
                <td>상품코드</td>
                <td>${prodNo}</td>
              </tr>
              <tr>
                <td>상품명</td>
                <td>${prodName}</td>
              </tr>
              <tr>
                <td>카테고리</td>
                <td>${cateGroup}/${cateCode}</td>
              </tr>
              <tr>
                <td>입고가격</td>
                <td>${incomPrice}</td>
              </tr>
              <tr>
                <td>판매가격</td>
                <td>${sellPrice}</td>
              </tr>

              <tr>
                <td>비고</td>
                <td><textarea name="prodCon" value="${param.prodCon}" rows="10" cols="50" required></textarea>
                </td>
              </tr>
            </table>
            <input type="submit" value="등록">
            <input type="submit" value="상품 삭제">
          </div>
        </div>
      </div>
      </div>
    </body>

    <script>
      function searchProducts() {
        // JavaScript 코드는 필요에 따라 추가
        // 서버로 폼을 제출하도록 변경
        document.getElementById("searchForm").submit();
      }
      // function searchProducts() {
      //   // Get the data manually
      //   var cGroup = document.getElementById("searchOption-cateGroup").value;
      //   var cCode = document.getElementById("searchOption-cateCode").value;
      //   var c = document.getElementById("searchOption-color").value;
      //   var s = document.getElementById("searchOption-size").value;
      //   var txtP = document.getElementById("txtProductName").value;

      //   // Construct the data payload
      //   var data = {
      //     cateGroup: cGroup,
      //     cateCode: cCode,
      //     color: c,
      //     size: s,
      //     txtProductName: txtP
      //   }

      //   // Make an AJAX request to fetch search results
      //   var xhr = new XMLHttpRequest();
      //   xhr.open("POST", "/prodManageProc", true);
      //   xhr.setRequestHeader("Content-Type", "application/json");
      //   xhr.onreadystatechange = function () {
      //     if (xhr.readyState == 4 && xhr.status == 200) {
      //       // Update the prodListTable with the new data
      //       document.getElementById("prodListTable").innerHTML = xhr.responseText;
      //     }
      //   };
      //   xhr.send(JSON.stringify(data));
      // }
      // document.getElementById("searchForm").addEventListener("submit", searchProducts);

      // // function manageProduct(prodNo, prodName) {
      // //   // 상품 관리 동작 정의
      // //   console.log('상품 관리:', prodNo, prodName);
      // //   // 추가적인 로직을 여기에 구현
      // // }
    </script>

    </html>