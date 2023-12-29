<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 등록 조회</title>

  <!-- ------------------------------------------------------------------------ -->

  <style>
    /* ------ title ------ */
    .inventory-title {
      font-size: 18px;
      font-weight: bold;
      color: #626161;
      text-align: left;
      margin: 20px auto;
    }

    .inventory-title2 {
      font-size: 18px;
      font-weight: bold;
      color: #626161;
      text-align: left;
      margin: 20px auto;
    }

    /* 검색창 */
    .search-container {
      width: 600px;
      justify-content: center;
      align-items: center;
      margin-bottom: 20px;
      border: 2px solid #2895F4;
      border-radius: 8px;
      padding-top: 10px;
      padding-bottom: 10px;
      padding-left: 50px;
      background-color: #f9f9f9;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin: 8px 10px;
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

    /* 등록된 상품 조회 리스트 */
    .prodList-table {
      border: 1px solid black;
      border-collapse: collapse;
      width: 1000px;
      margin: 8px 10px;
      border-spacing: 0;
      text-align: center;
    }

    .prodList-table td {
      border: 1px solid #626161;
      padding: 4px;
      text-align: center;
      height: 10px;
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


    /* 새로운 테이블 스타일 */
    .newTable {
      float: right;
      /* 오른쪽으로 부유시킴 */
      margin-bottom: 20px;
      /* 상단 간격 조절 */
      width: 600px;
    }

    .newTable td {
      border: 1px solid black;
      padding: 4px;
      text-align: center;
      height: 10px;
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


  </style>

  <!-- ------------------------------------------------------------------------ -->
  <script>

  </script>

  <!-- ------------------------------------------------------------------------ -->
</head>


<body>
  <c:import url="/header" />
  <h2 class="inventory-title">등록 상품 조회</h2>
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
              <button onclick="searchProducts()">검색</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div>
    <table class="prodList-table">
      <tr>
        <td class="prodNo">No</td>
        <td class="prodCode">상품코드</td>
        <td class="prodName">상품명</td>
        <td class="totalQuan">재고량/총수량</td>
        <td class="prodManage">상품관리</td>
      </tr>
      <c:choose>
        <c:when test="{empty DataList}">
          <tr class="second-table-content">
            <td colspan="5">조회된 정보가 없습니다.</td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach var="item" items="{DataList}">
            <tr>
              <td class="prodNo">No</td>
              <td class="prodCode">상품코드</td>
              <td class="prodName">상품명</td>
              <td class="totalQuan">재고량/총수량</td>
              <td class="prodManage">상품관리</td>
            </tr>
          </c:forEach>
        </c:otherwise>

      </c:choose>
      </tr>
    </table>
  </div>

  <h2 class="inventory-title2">등록 상품 관리</h2>
  <table class="newTable">
    <tr>
      <td class="prodNo">No</td>
      <td class="prodCode">상품코드</td>
      <td class="prodName">상품명</td>
      <td class="totalQuan">재고량/총수량</td>
      <td class="prodManage">상품관리</td>
    </tr>
    <c:choose>
      <c:when test="{empty DataList}">
        <tr class="second-table-content">
          <td colspan="5">조회된 정보가 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach var="item" items="{DataList}">
          <tr>
            <td class="prodNo">No</td>
            <td class="prodCode">상품코드</td>
            <td class="prodName">상품명</td>
            <td class="totalQuan">재고량/총수량</td>
            <td class="prodManage">상품관리</td>
          </tr>
        </c:forEach>
      </c:otherwise>

    </c:choose>
    </tr>
  </table>
</body>

</html>