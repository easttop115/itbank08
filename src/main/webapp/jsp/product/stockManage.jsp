<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        /* ----- 공통 style -----  */
        table {
          border-collapse: collapse;
          width: calc(100% - 40px);
          margin: auto;
          border-spacing: 0;
        }

        td {
          border: 1px solid black;
          padding: 4px;
          text-align: center;
        }

        select {
          width: 100%;
          height: 30px;
        }

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2895F4;
          text-align: left;
          margin: 20px;
        }

        /* ------  표1 ----- */
        .first-table-subject {
          width: 10%;
          background-color: #2895F4;
          color: white;
          text-align: center;
        }

        .first-table-content {
          width: 40%;
          text-align: left;
        }

        .first-table-content .input-width {
          width: calc(80% - 5px);
          height: 30px;
        }

        .seacrch-button {
          background-color: #2895F4;
          color: white;
          padding: 4px 8px;
          border: 1px solid #D3D3D3;
          cursor: pointer;
          border-radius: 4px;
        }

        .first-table-content .half-width {
          width: 40%;
          height: 30px;
          text-align: left;
          margin-right: 8px;
        }

        .first-table-content .input-width {
          width: 80%;
          height: 30px;
          text-align: left;
        }

        .searchDropdown {
          display: none;
        }

        /* .half-width {
width: 30%;
text-align: left;
height: 30px;
} */



        /* ------  표2 ----- */
        /* 표2 헤더 */
        .second-table-header {
          background-color: #2895F4;
          color: white;
        }

        /* 첫 번째 행 */
        .second-table-content tr:first-child {
          background-color: #2895F4;
          color: white;
        }

        /* 두 번째 행 */
        .second-table-content tr:nth-child(2) {
          background-color: white;
          color: black;
        }
      </style>

      <!--검색 드롭다운  -->
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

      <script>
        $(document).ready(function () {
          $("#searchInput").on("input", function () {
            var searchText = $(this).val();

            $.ajax({
              type: "GET",
              url: "search.jsp", // 서버 측 파일의 경로
              data: { searchText: searchText },
              dataType: "json",
              success: function (data) {
                updateDropdown(data);
              },
              error: function () {
                console.log("데이터 가져오기 실패");
              }
            });
          });
        });

        function updateDropdown(data) {
          var dropdown = $("#searchDropdown");

          // 드롭다운 비우기
          dropdown.empty();

          // 가져온 데이터로 드롭다운 채우기
          for (var i = 0; i < data.length; i++) {
            dropdown.append("<option value='" + data[i] + "'>" + data[i] + "</option>");
          }

          // 드롭다운 보이기
          dropdown.show();
        }
      </script>

    </head>

    <body>
      <c:import url="/header" />
      <div class="inventory-title">매장별 재고 현황</div>
      <table>
        <tbody>
          <tr>
            <!-- 스타일 따로 빼-->
            <td class="first-table-subject">매장</td>
            <td class="first-table-content">
              <select>
                <c:forEach var="storeName" items="${storeNames}">
                  <option value="${storeName}">${storeName}</option>
                </c:forEach>
              </select>
            </td>
            <td class="first-table-subject">등록일</td>
            <td class="first-table-content">
              <select id="dateSelect"></select>
            </td>
          </tr>

          <tr>
            <td class="first-table-subject">상품코드</td>
            <td colspan="3" class="first-table-content">
              <input type="text" id="searchInput" class="input-width" placeholder="상품코드를 입력하세요">
              <select id="searchDropdown" class="searchDropdown"></select>
            </td>
            </td>
          </tr>

          <tr>
            <td class="first-table-subject">상세검색</td>
            <td colspan="3" class="first-table-content">
              <select class="half-width">
                <c:forEach var="color" items="${colors}">
                  <option value="${color}">${color}</option>
                </c:forEach>
              </select>
              <select class="half-width">
                <c:forEach var="cate" items="${cates}">
                  <option value="${cate}">${cate}</option>
                </c:forEach>
              </select>
              <button class="seacrch-button">검색</button>
            </td>
          </tr>
        </tbody>
      </table>
      <br>

      <table>
        <tbody>
          <tr class="second-table-header">
            <td>상품코드</td>
            <td>품목명</td>
            <td>색상</td>
            <td>판매가</td>
            <td>S</td>
            <td>M</td>
            <td>L</td>
            <td>XL</td>
          </tr>

          <!-- 데이터 유무 확인 -->
          <c:choose>
            <c:when test="${empty DataList}">
              <!-- 데이터 없을 때 -->
              <tr class="second-table-content">
                <td colspan="8">조회된 정보가 없습니다.</td>
              </tr>
            </c:when>
            <!-- 데이터 있을 때 -->
            <c:otherwise>
              <c:forEach var="item" items="${DataList}">
                <tr class="second-table-content">
                  <td>${item.prodCode}</td>
                  <td>${item.prodName}</td>
                  <td>${item.color}</td>
                  <td>${item.price}</td>
                  <td>${item.sizeS}</td>
                  <td>${item.sizeM}</td>
                  <td>${item.sizeL}</td>
                  <td>${item.sizeXL}</td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>

    </body>

    </html>