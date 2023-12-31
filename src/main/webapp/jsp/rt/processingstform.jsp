<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>R/T처리현황페이지</title>

            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                }

                h1 {
                    text-align: left;
                    font-size: 30px;
                }

                .main {
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    background-color: #FFFFFF;
                    padding: 0px;
                    border: 1px solid #ddd;
                    margin-top: -2px;
                    margin-bottom: 10px;
                }

                .section {
                    display: flex;
                    margin-right: -218px;
                }

                .section-three {
                    display: flex;
                    margin-right: 10px;
                }

                .table-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 5px;
                    width: 100%;
                }

                .table-cell {
                    padding: 8px;
                    text-align: left;
                    flex: 1;
                    margin-left: 4px;
                    box-sizing: border-box;
                    margin-right: 5px;
                }

                .table-Processing {
                    background-color: #fff;
                    padding: 5px;
                    margin-left: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    width: 100%;
                    box-sizing: border-box;
                }

                .table-Processing input[type="radio"] {
                    margin-right: 5px;
                }

                .table-Processing label {
                    width: 50px;
                }

                .table-cell.table-Processing {
                    background-color: #fff;
                    border: 1px solid #ddd;
                    padding: 5px;
                    margin-left: 10px;
                }

                .Instruction-period,
                .Processing,
                .shop {
                    background-color: #cadae7;
                    padding: 5px;
                    display: block;
                    margin-bottom: 5px;
                    text-align: center;
                    width: 100%;
                    border: 1px solid #D3D3D3;
                    /* 각 항목에 테두리 추가 */
                }

                .Instruction-period {
                    margin-bottom: 10px;
                    margin-top: 3px;
                }

                .section-two {
                    display: flex;
                    justify-items: center;
                    align-items: center;
                    margin: 0 auto;
                }

                .button-box {
                    display: flex;
                    justify-content: space-between;
                    padding: 10px;
                    margin-left: 93%;
                    margin-right: 0%;
                    /* 수정된 부분: %로 변경 */
                }

                .button-box button {
                    background-color: #2895F4;
                    border: 1px solid #2895F4;
                    padding: 8px 12px;
                    color: #FFFFFF;
                    border-radius: 5px;
                    /* 테두리를 둥글게 만듭니다. */

                }

                .button-box button:hover {
                    background-color: #1a77d4;
                    /* 마우스 호버 시 색상 변경 */

                }

                .table-container {

                    margin-top: 20px;

                }

                .instruction-list {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                    display: flex;
                    flex-direction: column;
                    width: 100%;
                    white-space: nowrap;
                    /* 텍스트 줄 바꿈 방지 */
                }

                .instruction-item header {
                    /* 기존 스타일 유지하면서 배경 색상과 테두리 추가 */
                    display: flex;
                    justify-content: space-between;
                    padding: 8px;
                    font-weight: bold;

                }

                .instruction-item {
                    /* 기존 스타일 유지하면서 배경 색상과 테두리 추가 */
                    display: flex;
                    justify-content: space-between;
                    padding: 8px;
                    margin-top: 5px;
                    background-color: #cadae7;
                    /* 배경 색상 변경 */
                    border: 1px solid #D3D3D3;
                    /* 테두리 추가 */
                    white-space: nowrap;
                    /* 텍스트 줄 바꿈 방지 */
                }

                /* 추가된 스타일 */
                .instruction-item div {
                    /* 각 div 엘리먼트에 대한 스타일 */
                    flex: 1;
                    border-right: 1px solid #fff;
                    /* 각 엘리먼트 사이에 흰색 구분선 추가 */
                    padding: 0 8px;
                    /* 왼쪽 오른쪽으로 8px 간격 추가 */
                    box-sizing: border-box;
                    /* 패딩을 포함한 전체 크기 유지 */

                }

                .instruction-item div:last-child {
                    border-right: none;
                    /* 마지막 엘리먼트의 오른쪽 구분선 제거 */
                }

                .instruction-title {
                    flex: 1;
                    font-weight: bold;
                    text-align: center;
                    /* 텍스트를 가운데 정렬 */
                    color: #fff;
                    /* 흰색으로 변경 */
                }

                .vi {
                    flex: 1;
                    text-align: center;
                    margin-top: 10px;
                    /* 아래에 간격 추가 */
                }
            </style>
        </head>

        <body>

            <h1>R/T처리현황</h1>
            <div class="button-box">
                <button>조회</button>
            </div>

            <div class="main">
                <div class="section">
                    <label class="Instruction-period">지시기간</label>
                    <div class="table-row">
                        <div class="table-cell">
                            <input type="date" id="startDate" name="startDate">
                        </div>
                        <div class="date-separator">~</div>
                        <div class="table-cell">
                            <input type="date" id="endDate" name="endDate">
                        </div>
                    </div>
                </div>

                <div class="section-two">
                    <label class="Processing">처리구분</label>
                    <div class="table-row">
                        <div class="table-Processing">
                            <input type="radio" name="status" value="미처리">
                            <label for="미처리">미처리</label>
                        </div>
                        <div class="table-Processing">
                            <input type="radio" name="status" value="처리">
                            <label for="처리">처리</label>
                        </div>
                        <div class="table-Processing">
                            <input type="radio" name="status" value="불이행">
                            <label for="불이행">불이행</label>
                        </div>
                    </div>
                </div>

                <div class="section-three">
                    <label class="shop">매장</label>
                    <div class="table-row">
                        <div class="table-cell">
                            <select name="shop" id="shopSelect">
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-container">
                <ul class="instruction-list">
                    <li class="instruction-item header">
                        <div class="no">NO.</div>
                        <div class="store-re">받는매장</div>
                        <div class="item-nu">품번</div>
                        <div class="product-na">품명</div>
                        <div class="color">색상</div>
                        <div class="size">사이즈</div>
                        <div class="stock">재고</div>
                        <div class="Instruction">지시</div>
                        <div class="confirmation">확정</div>
                        <div class="order-date">RT 지시일</div>
                        <div class="outDate">반출일</div>
                        <div class="processing">처리구분</div>
                        <div class="remarks">비고</div>
                    </li>
                    <c:choose>
                        <c:when test="${empty instructions}">
                            <li class="instruction-item" style="background-color: #fff;">
                                <div class="instruction-title" style="color: #000;" colspan="13">조회된 정보가 없습니다.</div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="instruction" items="${instructions}">

                                <li class="instruction-item">
                                    <div class="no">${instruction.no}</div>
                                    <div class="store-re">${instruction.store-re}</div>
                                    <div class="item-nu">${instruction.item-nu}</div>
                                    <div class="product-na">${instruction.product-na}</div>
                                    <div class="color">${instruction.color}</div>
                                    <div class="size">${instruction.size}</div>
                                    <div class="stock">${instruction.stock}</div>
                                    <div class="Instruction">${instruction.Instruction}</div>
                                    <div class="confirmation">${instruction.confirmation}</div>
                                    <div class="order-date">${instruction.order-date}</div>
                                    <div class="outDate">${instruction.outDate}</div>
                                    <div class="processing">${instruction.processing}</div>
                                    <div class="remarks">${instruction.remarks}</div>
                                </li>
                            </c:forEach>
                            <li>
                                <div class="vi" colspan="13">${result}</div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>


            <script>
                function addDateRange() {
                    const startDate = document.getElementById('startDate').value;
                    const endDate = document.getElementById('endDate').value;

                    // 날짜 범위에서 각 날짜에 대한 처리구분을 추가
                    for (let date = new Date(startDate); date <= new Date(endDate); date.setDate(date.getDate() + 1)) {
                        const newRow = document.createElement('div');
                        newRow.className = 'table-row';
                        const dateCell = document.createElement('div');
                        dateCell.className = 'table-cell';
                        const typeCell = document.createElement('div');
                        typeCell.className = 'table-cell';

                        dateCell.textContent = date.toISOString().split('T')[0];

                        const radioBtn1 = createRadioButton('미처리');
                        const radioBtn2 = createRadioButton('처리');
                        const radioBtn3 = createRadioButton('불이행');

                        typeCell.appendChild(radioBtn1);
                        typeCell.appendChild(radioBtn2);
                        typeCell.appendChild(radioBtn3);

                        newRow.appendChild(dateCell);
                        newRow.appendChild(typeCell);

                        document.getElementById('dataBody').appendChild(newRow);
                    }
                }

                function createRadioButton(label) {
                    const radioBtn = document.createElement('input');
                    radioBtn.type = 'radio';
                    radioBtn.name = 'status';
                    radioBtn.value = label;

                    const labelElement = document.createElement('label');
                    labelElement.textContent = label;

                    const wrapper = document.createElement('div');
                    wrapper.appendChild(radioBtn);
                    wrapper.appendChild(labelElement);

                    return wrapper;
                }
                document.addEventListener('DOMContentLoaded', function () {   //매장 스크롤바
                    const shopSelect = document.getElementById('shopSelect');

                    shopSelect.addEventListener('change', function () {
                        const selectedShop = shopSelect.value;
                        console.log('Selected Shop:', selectedShop);
                        // 여기서 선택된 매장 값을 서버로 전송하도록 구현할 수 있습니다.
                    });
                });
            </script>

        </body>

        </html>