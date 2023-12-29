<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>상품 개별 등록</title>

      <!-- <style>
        table {
          border-collapse: separate;
          border-spacing: 0;
          width: calc(100% - 40px);
          margin: auto;
          overflow: hidden;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          border-radius: 10px;
          /* 외부 모서리만 둥글게 */
          border-top: 2px solid #2895F4;
          /* 위 선 굵게 */
          border-bottom: 2px solid #2895F4;
          /* 아래 선 굵게 */
        }

        th,
        td {
          border: 1px solid rgb(168, 168, 168);
          /* 내부 셀 테두리 색상 검은색으로 변경 */
          padding: 6px;
          /* 패딩 줄임 */
          text-align: center;
          border-radius: 0;
          /* 내부 셀의 모서리는 직각으로 유지 */
        }

        th {
          background-color: #cadae7;
          color: black;
        }

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: left;
          margin: 20px;
        }

        .white-bg {
          background-color: white;
          border-radius: 4px;
        }

        /* Input styles */
        input[type="text"],
        input[type="number"],
        textarea {
          width: calc(100% - 16px);
          padding: 6px;
          /* 패딩 줄임 */
          margin: 8px 0;
          border: 1px solid rgb(168, 168, 168);
          border-radius: 4px;
          box-sizing: border-box;
        }

        input[type="submit"] {
          background-color: #cadae7;
          color: black;
          padding: 10px;
          padding-left: 30px;
          padding-right: 30px;
          border: 2px rgb(168, 168, 168);
          border-radius: 4px;
          cursor: pointer;
          margin: 10px 10px 10px 1360px;
        }

        input[type="submit"]:hover {
          background-color: #2895F4;
        }

        /* Center align text in the first column */
        td:first-child {
          text-align: center;
        }

        select {
          text-align: left;
          margin: 0 10px;
        }
      </style> -->
      <style>
        table {
          border-collapse: separate;
          border-spacing: 0;
          width: 96%;
          margin: auto;
          overflow: hidden;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          border-radius: 10px;
        }

        th,
        td {
          border: 1px solid rgb(168, 168, 168);
          padding: 6px;
          text-align: center;
          border-radius: 0;
        }

        th {
          background-color: #cadae7;
          color: black;
        }

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: left;
          margin: 20px;
        }

        .white-bg {
          background-color: white;
          border-radius: 4px;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select {
          width: calc(100% - 16px);
          padding: 6px;
          margin: 8px 0;
          border: 1px solid rgb(168, 168, 168);
          border-radius: 4px;
          box-sizing: border-box;
          margin: 0 10px;
          /* 통일된 margin 값 추가 */
        }

        input[type="submit"] {
          background-color: #cadae7;
          color: black;
          padding: 10px;
          padding-left: 30px;
          padding-right: 30px;
          border: 2px rgb(168, 168, 168);
          border-radius: 4px;
          cursor: pointer;
          margin: 10px 10px 10px 1360px;
        }

        input[type="submit"]:hover {
          background-color: #2895F4;
        }

        td:first-child {
          text-align: center;
        }
      </style>


    </head>

    <body>
      <c:import url="/header" />
      <h2 class="inventory-title">상품 등록</h2>
      <form action="" method="">
        <table class="white-bg">
          <tr>
            <th>상품명</th>
            <td><input type="text" name="prodName" required></td>
          </tr>
          <tr>
            <th>브랜드 코드</th>
            <td><select id="brandCode" required>
                <c:choose>
                  <c:when test="${empty brandCodes}">
                    <option value="nobrandCode">등록된 브랜드코드가 없습니다</option>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="brandCode" items="${brandCodes}">
                      <option value="${brandCode}">${brandCode}</option>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </select>
            </td>
          </tr>
          <tr>
            <th>카테고리</th>
            <td>
              <select id="cateGroup" required>
                <c:choose>
                  <c:when test="${empty cateGroups}">
                    <option value="nocateGroup">등록된 카테고리 그룹이 없습니다</option>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="cateGroup" items="${cateGroups}">
                      <option value="${cateGroup}">${cateGroup}</option>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </select>
              <select id="cateCode" required>
                <c:choose>
                  <c:when test="${empty cateCodes}">
                    <option value="nocateCode">등록된 카테고리 코드가 없습니다</option>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="cateCode" items="${cateCodes}">
                      <option value="${cateCode}">${cateCode}</option>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </select>
            </td>
          </tr>
          <tr>
            <th>색상</th>
            <td><select id="color" required>
                <c:choose>
                  <c:when test="${empty colors}">
                    <option value="nocolor">등록된 색상코드가 없습니다</option>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="color" items="${colors}">
                      <option value="${color}">${color}</option>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </select>
            </td>
          </tr>
          <tr>
            <th>사이즈</th>
            <td><select id="size" required>
                <option value="sizeS">S</option>
                <option value="sizeM">M</option>
                <option value="sizeL">L</option>
                <option value="sizeXL">XL</option>
            </td>
          </tr>



          <!-- <td colspan="3" class="first-table-content">
            <select class="half-width">
              <c:choose>
                <c:when test="${empty colors}">
                  <option value="noColor">등록된 색상이 없습니다</option>
                </c:when>
                <c:otherwise>
                  <c:forEach var="color" items="${colors}">
                    <option value="${color}">${color}</option>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </select> -->
          <!-- <tr>
            <th>매장 지정</th>
            <td>
              <select name="supplier" required>
                <option value="supplier1">거래처1</option>

                
                <option value="supplier2">거래처2</option> -->
          <!-- 다른 거래처 옵션들 추가 -->
          <!-- </select>
            </td>
          </tr> -->
          <tr>
            <th>입고가격</th>
            <td><input type="number" name="incomePrice" required></td>
          </tr>
          <tr>
            <th>판매가격</th>
            <td><input type="number" name="sellPrice" required></td>
          </tr>
          <tr>
            <th>입고수량</th>
            <td><input type="number" name="incomeQuan" required></td>
          </tr>
          <tr>
            <th>상세설명</th>
            <td><textarea name="prodCon" rows="10" cols="100" required></textarea></td>
          </tr>
        </table>
        <input type="submit" value="등록">

      </form>
    </body>

    </html>