<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>상품 개별 등록</title>
      <!-- <style>
        table {
          border-collapse: collapse;
          width: calc(100% - 40px);
          margin: auto;
          border-spacing: 0;
        }

        th,
        td {
          border: 1px solid black;
          padding: 8px;
          text-align: left;
        }

        th {
          background-color: #D3D3D3;
          color: white;
        }

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2895F4;
          text-align: left;
          margin: 20px;
        }

        .blue-bg {
          background-color: #D3D3D3;
          color: white;
          text-align: left;
          padding: 10px;
        }

        .white-bg {
          background-color: white;
        }

        .align-left {
          text-align: left;
        }
      </style> -->
      <style>
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
          border: 1px solid #000;
          /* 내부 셀 테두리 색상 검은색으로 변경 */
          padding: 6px;
          /* 패딩 줄임 */
          text-align: left;
          border-radius: 0;
          /* 내부 셀의 모서리는 직각으로 유지 */
        }

        th {
          background-color: #D3D3D3;
          color: white;
        }

        /* ------ title ------ */
        .inventory-title {
          font-size: 18px;
          font-weight: bold;
          color: #2895F4;
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
          border: 1px solid black;
          border-radius: 4px;
          box-sizing: border-box;
        }

        input[type="submit"] {
          background-color: #1769AA;
          color: white;
          padding: 10px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }

        input[type="submit"]:hover {
          background-color: #1769AA;
        }

        /* Center align text in the first column */
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
            <th>상품코드</th>
            <td><input type="text" name="prodNo" required></td>
          </tr>
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
            <td><textarea name="productDescription" rows="10" cols="100" required></textarea></td>
          </tr>
        </table>
        <input type="submit" value="등록">

      </form>
    </body>

    </html>