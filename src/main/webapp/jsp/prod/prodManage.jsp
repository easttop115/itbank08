<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>상품 등록 조회</title>

      <link rel="stylesheet" href="/css/prodManage.css">

    </head>


    <body>
      <c:import url="/header" />
      <c:import url="/sider" />
      <div class="content-container class">

        <!-- <div class="left"> -->
        <h2 class="inventory-title">상품 조회</h2>
        <div class="center class">
          <div class="search-container class">
            <form id="searchForm" action="/prod/prodList" method="post">
              <table class="search-table">
                <tr>
                  <td>
                    <select name="cateGroup" id="cateGroup" class="searchOption">
                      <option value="">카테고리그룹</option> <!-- 초기값으로 null 추가 -->
                      <c:forEach var="cateGroup" items="${cateGroups}">
                        <option value="${cateGroup.cateGroup}">${cateGroup.cateGroup}</option>
                      </c:forEach>
                    </select>
                    <select name="cateCode" id="cateCode" class="searchOption">
                      <option value="">카테고리코드</option>
                      <c:forEach var="cateCode" items="${cateCodes}">
                        <option value="${cateCode.cateCode}">${cateCode.cateCode}</option>
                      </c:forEach>
                    </select>
                    <select name="colorCode" id="colorCode" class="searchOption">
                      <option value="">색상코드</option>
                      <c:forEach var="colorCode" items="${colorCodes}">
                        <option value="${colorCode.colorCode}">${colorCode.colorCode}</option>
                      </c:forEach>
                    </select>
                    <select class="searchOption" id="size" name="size">
                      <option value="">사이즈</option>
                      <option value="S">S</option>
                      <option value="M">M</option>
                      <option value="L">L</option>
                      <option value="XL">XL</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>
                    <input type="text" id="prodNo" name="prodNo" placeholder="상품코드 입력를 입력하세요" value="${prodNo}"
                      class="txtProductNO">
                    <!-- <button type="button" onclick="searchProducts()">검색</button> -->
                    <input type="submit" class="search-button" value="검색">
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div class="class">
          <table id="prodListTable" class="prodList-table">
            <tr>
              <td class="prodNo">상품코드</td>
              <td class="prodName">상품명</td>
              <td class="size">사이즈</td>
              <td class="colorCode">색상코드</td>
              <td class="quan">총수량</td>
            </tr>
            <c:choose>
              <c:when test="${not empty prods}">
                <c:forEach var="product" items="${prods}">
                  <tr>
                    <td class="prodNo">${product.prodNo}</td>
                    <td class="prodName">${product.prodName}</td>
                    <td class="size">${product.size}</td>
                    <td class="colorCode">${product.colorCode}</td>
                    <td class="quan">${product.quan}</td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <!-- prod가 비어있는 경우 (검색 결과가 없는 경우) -->
                <tr>
                  <td colspan="5">조회된 정보가 없습니다.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </table>
        </div>
      </div>

      <!-- <script>
        document.addEventListener("DOMContentLoaded", function () {
          document.getElementById("searchForm").addEventListener("submit", function (event) {
            event.preventDefault(); // 기본 폼 제출 방지

            // 제품을 검색하고 테이블을 업데이트하는 함수 호출
            searchProducts();
          });
        });

        var xhr;

        function searchProducts() {
          // 폼 데이터 가져오기
          var cg = document.getElementById('cateGroup').value;
          var cCode = document.getElementById('cateCode').value;
          var cColor = document.getElementById('colorCode').value;
          var sz = document.getElementById('size').value;
          xhr = new XMLHttpRequest();
          // 비동기적으로 서버에 요청 보내기
          xhr.open("POST", "/prodList", true);
          xhr.setRequestHeader("Content-Type", "application/json");

          console.log("cg:", cg);
          console.log("cCode:", cCode);
          console.log("cColor:", cColor);
          console.log("sz:", sz);
          var data = { cateCode: cg + "(" + cCode + ")", colorCode: cColor, size: sz };
          console.log(data);

          xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
              // 받은 데이터를 이용하여 테이블 업데이트
              console.log(xhr.responseText)
              var resData = JSON.parse(xhr.responseText);
              console.log(resData);
              updateTable(resData);
            } else {
              console.error("데이터를 가져오는 중 에러 발생:", xhr.statusText);
            }

          };

          xhr.send(JSON.stringify(data));
        }


        function updateTable(data) {
          // 테이블의 tbody를 찾아서 비우기
          var tbody = document.getElementById("tbody");
          tbody.innerHTML = "";
          console.log(data);
          // 받은 데이터가 있는지 확인
          if (data != null) {
            // 받은 데이터를 이용하여 테이블 업데이트
            for (var i = 0; i < data.length; i++) {
              var row = "<tr>";
              row += "<td>" + data[i].prodNo + "</td>";
              row += "<td>" + data[i].prodName + "</td>";
              row += "<td>" + data[i].size + "</td>";
              row += "<td>" + data[i].colorCode + "</td>";
              row += "<td>" + data[i].quan + "</td>";
              row += "</tr>";

              tbody.innerHTML += row;
            }

          } else {
            // 데이터가 없는 경우 메시지를 표시
            var row = "<tr><td colspan='5'>조회된 정보가 없습니다.</td></tr>";
            tbody.innerHTML = row;
          }
        }
      </script> -->


    </body>

    </html>