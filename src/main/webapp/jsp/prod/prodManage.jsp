<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>상품 등록 조회</title>

      <!-- ------------------------------------------------------------------------ -->

      <style>
        .class {
          width: 100%;
        }

        .content-container {
          display: flex;
          align-items: flex-start;
          flex-wrap: wrap;
          /* 화면 크기에 따라 나란히 놓이도록 설정 */
        }

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
          padding: 4px 10px;
          border: none;
          background-color: #2895F4;
          color: white;
          border-radius: 4px;
          cursor: pointer;
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
          background-color: #edf6ff;
          border: 1px solid #626161;
          border-radius: 4px;
        }

        .prodList-table .second-table-content {
          height: 60vh;
          overflow: auto;
          background-color: white !important;
        }

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
      </style>

    </head>


    <body>
      <c:import url="/header" />
      <c:import url="/sider" />
      <div class="content-container class">

        <!-- <div class="left"> -->
        <h2 class="inventory-title">상품 조회</h2>
        <div class="center class">
          <div class="search-container class">
            <form id="searchForm" action="/prodList" method="post" onsubmit="event.preventDefault(); searchProducts();">
              <!--엔터 눌러도 form제출 x, searchProduct() 호출-->
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
                    <input type="text" id="prodNo" placeholder="상품코드 입력를 입력하세요" class="txtProductNO">
                    <input type="button" class="search-button" value="검색" onclick="searchProducts()">
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div class="class">
          <!-- <form action="/prodList" method="post"> -->
          <table id="prodListTable" class="prodList-table">
            <tr>
              <!-- <td class="No">No</td> -->
              <td class="prodNo">상품코드</td>
              <td class="prodName">상품명</td>
              <td class="size">사이즈</td>
              <td class="colorCode">색상코드</td>
              <td class="Quan">총수량</td>
            </tr>
            <tr class="second-table-content">
              <td colspan="5">조회된 정보가 없습니다.</td>
            </tr>
          </table>
        </div>
      </div>

    </body>

    <script>

      function updateTable(data) {
        var table = document.getElementById('prodListTable');
        var secondTableContentRow = table.querySelector('.second-table-content');
        var noDataMessageCell = secondTableContentRow.querySelector('td');

        // Clear existing rows in the table body
        noDataMessageCell.innerHTML = "";

        if (data.length > 0) {
          secondTableContentRow.style.display = 'none';

          for (var i = 0; i < data.length; i++) {
            var item = data[i];
            var row = table.insertRow();

            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);

            cell1.innerHTML = '<a href="javascript:void(0);" onclick="prodManage(\'' + item.prodNo + '\')">' + item.prodNo + '</a>';
            cell2.textContent = item.prodName;
            cell3.textContent = item.size;
            cell4.textContent = item.colorCode;
            cell5.textContent = item.quan;
          }
        } else {
          // If no data is available, display the "No data" message
          secondTableContentRow.style.display = 'table-row';
          noDataMessageCell.colSpan = 5;
          noDataMessageCell.textContent = '조회된 정보가 없습니다.';
        }
      }
    </script>

    </html>