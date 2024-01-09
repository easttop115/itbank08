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

        /* div.left {
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

        /*} */

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: left;
          margin: 20px 20px;
        }

        .inventory-title2 {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: center;
          margin: 20px auto;
        }

        /* 검색창 */
        .search-container {
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
          background-color: #edf6ff;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* 검색창 내부 입력창 */
        .txtProductNo {
          width: 416px;
          height: 30px;
          margin-top: 5px;
        }

        .searchOption {
          width: 100px;
          height: 30px;
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
        .prodList-table {
          border: 1px solid rgb(168, 168, 168);
          border-radius: 20px;
          border-collapse: collapse;
          width: 96%;
          margin: 10px auto;
          text-align: center;
        }

        .prodList-table td {
          border: 1px solid #626161;
          padding: 4px;
          text-align: center;
          height: 10px;
        }

        .prodList-table tr:first-child {
          background-color: edf6ff;
          border: 1px solid #626161;
          border-radius: 4px;
        }

        .prodList-table .second-table-content {
          height: 60vh;
          overflow: auto;
          /* 스크롤바 추가 */
        }

        /* .No {
          width: 10%;
        } */

        .prodNo {
          width: 48%;
        }

        .dataProdNo {
          cursor: pointer;
        }

        .prodName {
          width: 24%;
        }

        .size {
          width: 8%;
        }

        .colorCode {
          width: 12%;
        }

        .totalQuan {
          width: 8%;
        }



        /* div.right .container {
          margin: 12% auto;
          width: 90%;
          border: 2px solid #2895F4;
          border-radius: 20px;
          background-color: white;
        }

        /* 새로운 테이블 스타일 */
        /*div.right .container .newTable {
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
        /* resize: vertical;*/
        /* 세로 리사이즈 활성화 (선택사항) */
        /* }

        .button {
          padding: 10px;
          border: none;
          background-color: #cadae7;
          border-radius: 4px;
          margin: 0 auto 16px 0;
        }

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
        } */
      </style>

    </head>


    <body>
      <c:import url="/sider" />
      <div class="content-container">

        <!-- <div class="left"> -->
        <h2 class="inventory-title">상품 조회</h2>
        <div class="center">
          <div class="search-container">
            <form id="searchForm" action="/prodManageProc" method="post">
              <table class="search-table">
                <tr>
                  <td>
                    <select name="cateGroup" id="cateGroup" class="searchOption">
                      <option value="null">카테고리그룹</option> <!-- 초기값으로 null 추가 -->
                      <c:choose>
                        <c:when test="${empty cateGroups}">
                          <option value="noCateGroup">카테고리그룹</option>
                        </c:when>
                        <c:otherwise>
                          <c:forEach var="cateGroup" items="${cateGroups}">
                            <option value="${cateGroup.cateGroup}">${cateGroup.cateGroup}</option>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </select>
                    <select name="cateCode" id="cateCode" class="searchOption">
                      <option value="null">카테고리코드</option>
                      <c:choose>
                        <c:when test="${empty cateCodes}">
                          <option value="noCateCode">카테고리코드</option>
                        </c:when>
                        <c:otherwise>
                          <c:forEach var="cateCode" items="${cateCodes}">
                            <option value="${cateCode.cateCode}">${cateCode.cateCode}</option>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </select>
                    <select name="color" id="color" class="searchOption">
                      <option value="null">색상코드</option>
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
                    <select class="searchOption" id="size" name="size" required>
                      <option value="null">사이즈</option>
                      <option value="S">S</option>
                      <option value="M">M</option>
                      <option value="L">L</option>
                      <option value="XL">XL</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>
                    <input type="text" id="prodNo" placeholder="상품코드 입력를 입력하세요" class="txtProductNO"
                      onchange="searchProducts()">
                    <!-- <input type="button" class="search-button" value="검색"> -->
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div>
          <!-- <form action="/prodList" method="post"> -->
          <table id="prodListTable" class="prodList-table">
            <thead>
              <tr>
                <!-- <td class="No">No</td> -->
                <td class="prodNo">상품코드</td>
                <td class="prodName">상품명</td>
                <td class="size">사이즈</td>
                <td class="colorCode">색상코드</td>
                <td class="Quan">총수량</td>
              </tr>
            </thead>
            <tbody id="tbody">
              <c:choose>
                <c:when test="${empty DataList}">
                  <tr class="second-table-content">
                    <td colspan="5">조회된 정보가 없습니다.</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="item" items="${DataList}">
                    <tr>
                      <td class='dataProdNo'><a href='javascript:void(0);'
                          onclick='prodManage("${item.prodNo}")'>${item.prodNo}</a></td>
                      <td>${item.prodName}</td>
                      <td>${item.size}</td>
                      <td>${item.colorCode}</td>
                      <td>${item.quan}</td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
      </div>

    </body>

    <!-- <script>
      function searchProducts() {
        var pN = document.getElementById('prodNo').value.trim(); // prodNo 값 가져오기 + 검색어 공백제거
        if (prodNo !== "") {
          xhr = new XMLHttpRequest();
          xhr.open('post', '/prodList')
          xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
          xhr.send(JSON.stringify({ prodNo: pN }));
          xhr.onreadystatechange = resProc;
        } else {
          // 검색어가 비어있을 경우의 처리
          document.getElementById('tbody').innerHTML = "<tr class='second-table-content'><td colspan='5'>조회된 정보가 없습니다.</td></tr>";
        }
      }
      function resProc() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var resData = JSON.parse(xhr.responseText);
          var printData = "";
          for (i = 0; i < resData.length; i++) {
            printData += "<tr>";
            printData += "<td class='dataProdNo'><a href='javascript:void(0);' onclick='prodManage(\"" + resData[i].prodNo + "\")'>" + resData[i].prodNo + "</a></td>";
            printData += "<td>" + resData[i].prodName + "</td>";
            printData += "<td>" + resData[i].size + "</td>";
            printData += "<td>" + resData[i].colorCode + "</td>";
            printData += "<td>" + resData[i].quan + "</td>";
            printData += "</tr>";
          }
          document.getElementById('tbody').innerHTML = printData;
        }
      }

      function prodManage(prodNo) {
        // 상품 관리 페이지로 이동하는 URL을 설정
        var prodManageURL = "/prodManage?prodNo=" + prodNo;

        // 실제로는 아래의 window.location.href 대신에 페이지 이동 로직을 사용하세요.
        // window.location.href = manageProductURL;

        // 예제로 경고창을 띄워보겠습니다.
        alert("상품 관리 페이지로 이동합니다. (URL: " + prodManageURL + ")");
      }

      // 나머지 JavaScript 코드는 이전과 동일하게 유지됩니다.

    </script> -->
    <script>
      function searchProducts() {
        var prodNo = document.getElementById('prodNo').value.trim();
        console.log(prodNo);
        // if (prodNo !== "") {
        xhr = new XMLHttpRequest();
        xhr.open('post', '/prodList');
        xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
        xhr.send(document.getElementById('prodNo').value.trim());
        xhr.onreadystatechange = resProc;
        // } else {

        // }
      }
      function resProc() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var resDataString = xhr.responseText;
          console.log(resDataString); // 문자열 데이터를 로그에 출력
        }
        console.log(resDataString);
      }
      function prodManage(prodNo) {
        // 상품 관리 페이지로 이동하는 URL을 설정
        var prodManageURL = "/prodManage?prodNo=" + prodNo;

        // 실제로는 아래의 window.location.href 대신에 페이지 이동 로직을 사용하세요.
        // window.location.href = manageProductURL;

        // 예제로 경고창을 띄워보겠습니다.
        alert("상품 관리 페이지로 이동합니다. (URL: " + prodManageURL + ")");
      }

      // 나머지 JavaScript 코드는 이전과 동일하게 유지됩니다.

    </script>

    </html>