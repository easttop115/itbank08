<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">

      <title>상품 개별 등록</title>

      <style>
        table {
          border-collapse: separate;
          border-spacing: 0;
          border-color: #2e363d;
          width: 96%;
          margin: auto;
          overflow: hidden;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          border-radius: 10px;
          height: 76vh;
          /* 테이블의 높이를 뷰포트 높이의 100%로 설정합니다. */
        }

        th,
        td {
          font-weight: normal;
          padding: 6px;
          text-align: center;
          border-radius: 0;
        }

        th {
          background-color: #cadae7;
          color: black;
        }

        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2e363d;
          text-align: left;
          margin: 20px 20px;
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
        }

        .button-container {
          text-align: center;
        }

        input[type="submit"] {
          background-color: #cadae7;
          color: black;
          padding: 10px 30px;
          border: 2px rgb(168, 168, 168);
          border-radius: 4px;
          cursor: pointer;
          margin: 10px;
          display: inline-block;
        }

        .cancel {
          background-color: #cadae7;
          color: black;
          padding: 10px 30px;
          border: 2px rgb(168, 168, 168);
          border-radius: 4px;
          cursor: pointer;
          margin: 10px;
          display: inline-block;
        }

        input[type="submit"]:hover {
          background-color: #2895F4;
        }

        td:first-child {
          text-align: center;
        }

        .insert-button {
          background-color: #cadae7;
          border-radius: 4px;
          border: none;
          padding: 4px;
          width: 13%;
        }

        .container {
          display: flex;
          align-items: center;
          text-align: left;
        }

        select#brandCode,
        select#cateGroup,
        select#color {
          width: 40%;
        }

        select#cateCode {
          width: 40%;
          margin-top: 10px;
        }

        /* 모달생성 */
        .modal {
          display: none;
          border-radius: 8px;
          position: fixed;
          z-index: 1;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          max-width: 600px;
          /* 최대 너비 지정 */
          height: auto;
          overflow: auto;
          padding: 20px;
          background-color: #e6f4ff;
          border: none;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-content {
          width: 100%
        }

        .form-container {
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        .button-container {
          display: flex;
          justify-content: space-around;
          width: 100%;
        }

        .form-container button {
          margin-top: 10px;
          /* Add some top margin for spacing */
          padding: 10px 10px;
          border: 2px rgb(168, 168, 168);
          border-radius: 4px;
          cursor: pointer;
          display: inline-block;
        }

        .close {
          color: #aaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }

        .close:hover,
        .close:focus {
          color: black;
          text-decoration: none;
          cursor: pointer;
        }
      </style>

      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    </head>

    <body>
      <c:import url="/header" />
      <c:import url="/sider" />
      <div class="content-container">
        <h2 class="inventory-title">상품 등록</h2>
        <form action="/prodInsertProc" method="post">
          <table class="white-bg">
            <tr>
              <th>상품명</th>
              <td colspan="2"><input type="text" name="prodName" value="${prodName}" required></td>
            </tr>
            <tr>
              <th>브랜드 코드</th>
              <td class="baranCode">
                <div class="container">
                  <select name="brandCode" id="brandCode" required>
                    <option value="null"></option> <!-- 초기값으로 null 추가 -->
                    <c:choose>
                      <c:when test="${empty brandCodes}">
                        <option value="nobrandCode">등록된 브랜드코드가 없습니다</option>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="brandCode" items="${brandCodes}">
                          <option value="${brandCode.brandCode}">${brandCode.brandCode}</option>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </select>
                  <button class="insert-button" type="button" onclick="openBrandModal()">브랜드코드
                    등록</button>
            <tr>
              <th>카테고리</th>
              <td>
                <div class="container">
                  <select name="cateGroup" id="cateGroup" required>
                    <option value="null"></option> <!-- 초기값으로 null 추가 -->
                    <c:choose>
                      <c:when test="${empty cateGroups}">
                        <option value="nocateGroup">등록된 카테고리 그룹이 없습니다</option>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="cateGroup" items="${cateGroups}">
                          <option value="${cateGroup.cateGroup}">${cateGroup.cateGroup}</option>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </select>
                  <button class="insert-button" type="button" onclick="openCateModal()">카테고리
                    등록</button>
                </div>

                <div class="container">
                  <select name="cateCode" id="cateCode" required>
                    <option value="null"></option> <!-- 초기값으로 null 추가 -->
                    <c:choose>
                      <c:when test="${empty cateCodes}">
                        <option value="nocateCode">등록된 카테고리 코드가 없습니다</option>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="cateCode" items="${cateCodes}">
                          <option value="${cateCode.cateCode}">${cateCode.cateCode}</option>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </select>
                  <!-- <button class="insert-button" type="submit" onclick="window.location.href='/cateCode-insert'">코드
                    등록</button> -->
                </div>
              </td>
            </tr>
            <tr>
              <th>색상</th>
              <td class="colorCode" colspan="2">
                <div class="container">
                  <select name="colorCode" id="colorCode" required>
                    <option value="null"></option> <!-- 초기값으로 null 추가 -->
                    <c:choose>
                      <c:when test="${empty colorCodes}">
                        <option value="nocolor">등록된 색상코드가 없습니다</option>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="colorCode" items="${colorCodes}">
                          <option value="${colorCode.colorCode}">${colorCode.colorCode}</option>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </select>
                  <button class="insert-button" type="button" onclick="openColorModal()">색상코드
                    등록</button>
                </div>
              </td>
            </tr>
            <tr>
              <th>사이즈</th>
              <td><select id="size" name="size" required>
                  <option value="null"></option> <!-- 초기값으로 null 추가 -->
                  <option value="S">S</option>
                  <option value="M">M</option>
                  <option value="L">L</option>
                  <option value="XL">XL</option>
              </td>
            </tr>
            <tr>
              <th>입고가격</th>
              <td><input type="number" name="incomePrice" value="${incomePrice}" required></td>
            </tr>
            <tr>
              <th>판매가격</th>
              <td><input type="number" name="sellPrice" value="${sellPrice}" required></td>
            </tr>
            <tr>
              <th>입고수량</th>
              <td><input type="number" name="quan" value="${quan}" required></td>
            </tr>
            <tr>
              <th>상세설명</th>
              <td><textarea name="prodCon" value="${prodCon}" rows="10" cols="100" required></textarea>
              </td>
            </tr>
          </table>
          <div class="button-container">
            <input type="submit" value="등록">
            <button class="cancel" type="button" onclick="window.location.href='/'">취소</button>
          </div>
        </form>
      </div>

      <!-- 브랜드코드  모달 창 -->
      <div id="brandModal" class="modal">
        <div class="modal-content">
          <!-- <span class="close" onclick="closeBrandModal()">&times;</span> -->
          <!-- Left Form: Category Registration -->
          <div class="form-container">
            <h2 style="text-align: center;">브랜드코드 등록</h2><br>
            <form id="modalForm" action="/brandInsert" method="post">
              <!-- 브랜드 코드 입력 -->
              <label for="addBrandCode"></label>
              <input type="text" id="addBrandCode" name="brandCode" value="${brandCode}" placeholder="브랜드코드명을 입력하세요."
                required>
              <!-- 브랜드 설명 입력 -->
              <label for="brandDescription"></label>
              <textarea id="brandDescription" name="brandDescription" rows="4" value="${brandDescription}"
                placeholder="브랜드에 대한 설명을 입력하세요"></textarea>
              <div class="button-container">
                <input type="submit" class="form-container button" value="등록"></input>
                <button type="button" class="form-container button" onclick="closeBrandModal()">취소</button>
              </div>
              <!-- 등록 버튼 -->
            </form>

          </div>
        </div>
      </div>


      <!-- 카테고리  모달 창 -->
      <div id="cateModal" class="modal">
        <div class="modal-content">
          <div class="form-container">
            <h2 style="text-align: center;">카테고리 등록</h2><br>
            <form id="modalForm" action="/cateInsert" method="post">
              <!-- 카테고리 그룹 입력 -->
              <label for="addCateGroup"></label>
              <input type="text" id="addCateGroup" name="cateGroup" value="${cateGroup}" placeholder="카테고리그룹명을 입력하세요."
                required>
              <!-- 카테고리 코드 입력 -->
              <label for="addCateCode"></label>
              <input type="text" id="addCateCode" name="cateCode" value="${cateCode}" placeholder="카테고리코드명을 입력하세요."
                required>
              <!-- 카테고리 네임 입력 -->
              <label for="addCateName"></label>
              <input type="text" id="addCateName" name="cateName" value="${cateName}" placeholder="카테고리명을 입력하세요."
                required>
              <input type="submit" class="form-container button" value="등록"></input>
              <button type="button" class="form-container button" onclick="closeCateModal()">취소</button>
          </div>
          <!-- 등록 버튼 -->
          </form>

        </div>
      </div>
      </div>


      <!-- 컬러코드 모달 창 -->
      <div id="colorModal" class="modal">
        <div class="modal-content">
          <!-- <span class="close" onclick="closeBrandModal()">&times;</span> -->
          <!-- Left Form: Category Registration -->
          <div class="form-container">
            <h2 style="text-align: center;">컬러코드 등록</h2><br>
            <form id="modalForm" action="/colorInsert" method="post">
              <!-- 컬러 코드 입력 -->
              <label for="addColorCode"></label>
              <input type="text" id="addColorCode" name="ColorCode" value="${colorCode}" placeholder="컬러코드명을 입력하세요."
                required>
              <input type="submit" class="form-container button" value="등록"></input>
              <button type="button" class="form-container button" onclick="closeColorModal()">취소</button>
          </div>
          <!-- 등록 버튼 -->
          </form>
        </div>
      </div>
      </div>


      <script>

        // 부랜드모달 열기
        function openBrandModal() {
          document.getElementById('brandModal').style.display = 'block';
        }
        // 모달 닫기
        function closeBrandModal() {
          document.getElementById('brandModal').style.display = 'none';
        }

        // 카테모달 열기
        function openCateModal() {
          document.getElementById('cateModal').style.display = 'block';
        }
        // 모달 닫기
        function closeCateModal() {
          document.getElementById('cateModal').style.display = 'none';
        }
        // 컬러모달 열기
        function openColorModal() {
          document.getElementById('colorModal').style.display = 'block';
        }

        // 모달 닫기
        function closeColorModal() {
          document.getElementById('colorModal').style.display = 'none';
        }

      </script>

    </body>

    </html>