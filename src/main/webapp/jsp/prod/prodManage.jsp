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
            <form id="searchForm" action="/prodList" method="post">
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
                    <select name="colorCode" id="colorCode" class="searchOption">
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
                    <input type="text" id="prodNo" name="prodNo" placeholder="상품코드 입력를 입력하세요" value="${prodNo}"
                      class="txtProductNO">
                    <input type="submit" class="search-button" value="검색">

                    <!-- <input type="button" class="search-button" value="검색" onclick="searchProducts()"> -->
                  </td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div class="class">
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

            </tbody>
          </table>
        </div>
      </div>

      <script>
        document.addEventListener("DOMContentLoaded", function () {
          document.getElementById("searchForm").addEventListener("submit", function (event) {
            event.preventDefault(); // 기본 폼 제출 방지

            // 제품을 검색하고 테이블을 업데이트하는 함수 호출
            searchProducts();
          });
        });

        function searchProducts() {
          // 폼 데이터 가져오기
          var formData = new FormData(document.getElementById("searchForm"));

          // XMLHttpRequest 객체 생성
          var xhr = new XMLHttpRequest();

          // 비동기적으로 서버에 요청 보내기
          xhr.open("POST", "/prodList", true);

          // 요청 완료 후 처리할 함수 설정
          xhr.onload = function () {
            if (xhr.status === 200) {
              // 받은 데이터로 테이블 업데이트
              document.getElementById("tbody").innerHTML = xhr.responseText;
            } else {
              console.error("데이터를 가져오는 중 에러 발생:", xhr.statusText);
            }
          };

          // 오류 처리
          xhr.onerror = function () {
            console.error("요청 중에 에러 발생");
          };

          // 요청 보내기
          xhr.send(formData);
        }
      </script>
    </body>

    </html>