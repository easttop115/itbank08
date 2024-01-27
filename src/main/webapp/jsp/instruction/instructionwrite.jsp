<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>R/T지시등록</title>

            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                }

                h1 {
                    text-align: left;
                    font-size: 30px;
                }

                .filter-header {
                    display: flex;
                    flex-direction: row;
                    justify-content: flex-start;
                    gap: 10px;
                    /*사이 간격 조절*/
                    align-items: center;
                    flex-wrap: wrap;
                    /* 넘치면 넣어가게 해줌*/
                    background-color: #FFFFFF;
                    padding: 0px;
                    border: 1px solid #ddd;
                }

                .filter-section {
                    display: flex;
                }

                .filter-main {
                    display: flex;

                    justify-content: flex-start;
                    gap: 10px;
                    /* 사이 간격 조절 */
                    align-items: flex-start;
                    /* 시작 부분을 정렬하여 똑바로 정렬 */
                    flex-wrap: wrap;
                    /* 넘치면 넣어가게 해줌 */
                    background-color: #FFFFFF;
                    padding: 0px;
                    border: 1px solid #ddd;
                }

                .filter-section2 {
                    display: flex;
                    flex-direction: column;
                    /* 기존의 가로 방향을 세로로 변경 */
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

                .table-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    width: 100%;
                }

                .table-cell {
                    text-align: center;
                    flex: 1;
                    margin-left: 4px;
                    box-sizing: border-box;
                    margin-right: 5px;
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
                    text-align: center;
                    width: 100%;
                    border: 1px solid #D3D3D3;
                    /* 각 항목에 테두리 추가 */
                }

                .button-box {
                    display: flex;
                    justify-content: flex-end;
                    padding: 10px;
                    margin-right: 0%;
                    /* 수정된 부분: %로 변경 */
                }

                .button-box button {
                    color: #999;
                    font-family: 'Monument', 'Noto Sans KR', sans-serif;
                    border: solid 1px #ddd;
                    font-size: 13px;
                    padding: 4px 12px 5px;
                    line-height: 1.4;
                    border-radius: 5px;
                    text-align: left;
                    margin-left: 11px;
                    background-color: #f5f5f5;
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

                .filter-section2 .table-Processing button#button {
                    color: #999;
                    font-family: 'Monument', 'Noto Sans KR', sans-serif;
                    border: solid 1px #ddd;
                    font-size: 13px;
                    padding: 4px 12px 5px;
                    line-height: 1.4;
                    border-radius: 5px;
                    text-align: left;
                    margin-left: 11px;
                    background-color: #f5f5f5;

                }

                .modal {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    justify-content: center;
                    align-items: center;
                }

                .modal-content {
                    background-color: #fff;
                    padding: 120px;
                    border-radius: 10px;
                    width: 380px;
                    text-align: center;

                }

                .close-btn {
                    cursor: pointer;
                    position: absolute;
                    top: 10px;
                    right: 10px;
                }

                .pr-bu {
                    color: #fff;
                    font-family: 'Monument', 'Noto Sans KR', sans-serif;
                    border: solid 1px#3498db;
                    font-size: 13px;
                    padding: 4px 12px 5px;
                    line-height: 1.4;
                    border-radius: 5px;
                    text-align: left;
                    background-color: #3498db;

                }

                .model-list {
                    border: 1px solid #ddd;
                    /* 검은색 테두리 */
                    padding: 10px;
                    /* 내부 여백 조절 */
                    border-radius: 5px;
                }

                .model-list ul {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                }

                .model-list li {
                    margin-bottom: 5px;
                    /* 각 아이템 간격 조절 */
                }
            </style>
        </head>

        <body>
            <!--버튼-->

            <h1>R/T지시요청</h1>
            <div class="button-box">
                <button>조회</button>
                <button>신규</button>
                <button>삭제</button>
                <button>마감처리</button>

            </div>

            <!--filter-header 상단표-->

            <div class="filter-header">
                <div class="filter-section">
                    <label class="Instruction-period">지시기간</label>
                    <div class="table-row">
                        <div class="table-cell">
                            <input type="date" id="startDate" name="startDate">
                        </div>
                    </div>
                </div>
            </div>



            <!--filter-main 중간표-->

            <div class="filter-main">
                <div class="filter-section2">
                    <label class="Instruction-period">상품코드</label>
                    <div class="table-row">
                        <div class="table-cell">
                            <input type="text" id="productName" class="product-input" style="margin-top: 3%;"
                                placeholder="품번을 입력하세요" value="${instruction.prodNo}">
                            <button id="searchButton" onclick="openModal()">조회</button>
                        </div>
                    </div>
                </div>

                <!--모달창-->
                <div id="myModal" class="modal">
                    <div class="modal-content">
                        <span class="close-btn" onclick="closeModal()">&times;</span>
                        <!-- 여기에 모달 내용 추가 -->
                        <div class="table-row">
                            <div class="table-cell"
                                style="background-color: #f9f7f9; padding: 10px; border-radius: 5px;">
                                <input type="text" id="modal-prodno" placeholder="품명 코드를 입력하세요"
                                    value="${instruction.prodNo}">
                                <input type="submit" class="pr-bu" value="조회">
                            </div>
                        </div>
                        <!-- 추가된 부분: model-list 네모 박스 -->
                        <c:choose>
                            <c:when test="${not empty prods}">
                                <c:forEach var="product" items="${prods}">
                                    <div class="prodNo" onclick="openModal('productModal',  '${instruction.prodNo}')">
                                        ${instruction.prodNo}
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="model-list">
                                    <div class="td" colspan="5">조회된 정보가 없습니다.</div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="filter-section2">
                    <label class="Processing">지시매장</label>
                    <div class="table-row">
                        <div class="table-Processing">
                            <select id="storeSelect" class="store-dropdown">
                                <option value="">지시매장 선택</option> <!-- 선택 안된 경우의 옵션 추가 -->
                                <option value="${instruction.storeName}">${instruction.storeName}</option>
                                <!-- yourDataList는 서버에서 가져온 데이터 목록입니다. -->
                            </select>
                        </div>
                    </div>
                </div>
                =

                <div class="filter-section2">
                    <label class="Processing">지시수량</label>
                    <div class="table-row">
                        <div class="table-Processing">
                            <input type="text" id="quantity" class="product-input" placeholder="0"
                                value="${instruction.quan}">
                        </div>
                    </div>
                </div>


                <div class="filter-section2">
                    <label class="Processing">등록</label>
                    <div class="table-row">
                        <div class="table-Processing">
                            <button id="button">등록</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- instruction-list 하단 표-->


            <div class="table-container">
                <ul class="instruction-list">
                    <li class="instruction-item header">
                        <div class="no">NO.</div>
                        <div class="prodNo">품번</div>
                        <div class="prodName">품명</div>
                        <div class="colorCode">색상</div>
                        <div class="size">사이즈</div>
                        <div class="quan">요청 수량</div>
                        <div class="cost">가격</div>
                        <div class="delete">취소</div>
                    </li>


                    <!--DB-->
                    <c:choose>
                        <c:when test="${empty instructions}">
                            <li class="instruction-item" style="background-color: #fff;">
                                <div class="instruction-title" style="color: #000;" colspan="13">조회된 정보가 없습니다.</div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <!-- <c:forEach var="instruction" items="${instructionGroups}">
                                <li class="instruction-item">
                                    <div class="no">${instruction.no}</div>
                                </li>
                            </c:forEach>

                            <c:forEach var="product" items="${prodGroups}">
                                <li class="product-item">
                                    <div class="prodNo">${product.prodNo}</div>
                                    <div class="prodName">${product.prodName}</div>
                                    <div class="colorCode">${product.colorCode}</div>
                                    <div class="size">${product.size}</div>
                                    <div class="sellPrice">${product.sellPrice}</div>
                                </li>
                            </c:forEach>

                            <c:forEach var="orderStock" items="${orderStockGroups}">
                                <li class="orderStock-item">
                                    <div class="reqQuan">${orderStock.reqQuan}</div>
                                </li>
                            </c:forEach>
                            <li>
                                <div class="vi" colspan="13">${result}</div>
                            </li> -->
                            <c:forEach var="instruction" item="${instructions}">
                                <div class="no">${instruction.no}</div>
                                <div class="prodNo">${instruction.prodNo}</div>
                                <div class="prodName">${instruction.prodName}</div>
                                <div class="colorCode">${instruction.colorCode}</div>
                                <div class="size">${instruction.size}</div>
                                <div class="reqQuan">${instruction.reqQuan}</div>
                                <div class="sellPrice">${instruction.sellPrice}</div>
                                <div></div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>


            <script>
                function addDateRange() {
                    const startDate = document.getElementById('startDate').value;

                    // 날짜 범위에서 각 날짜에 대한 처리구분을 추가
                    for (let date = new Date(startDate); date <= new Date(startDate); date.setDate(date.getDate() + 1)) {
                        const newRow = document.createElement('div');
                        newRow.className = 'table-row';
                        const dateCell = document.createElement('div');
                        dateCell.className = 'table-cell';

                        dateCell.textContent = date.toISOString().split('T')[0];

                        newRow.appendChild(dateCell);

                        document.getElementById('dataBody').appendChild(newRow);
                    }
                }
                function searchInstructions() {
                    // 지시번호를 기반으로 검색하는 로직을 추가하세요
                    const instructionNumber = document.getElementById('instructionNumber').value;

                    // AJAX 요청 또는 서버로부터 지시를 가져오는 다른 로직을 구현하세요
                    console.log('번호로 지시 검색 중:', instructionNumber);
                }

                document.addEventListener('DOMContentLoaded', function () {   //매장 스크롤바ㅊ
                    const shopSelect = document.getElementById('shopSelect');

                    shopSelect.addEventListener('change', function () {
                        const selectedShop = shopSelect.value;
                        console.log('Selected Shop:', selectedShop);
                        // 여기서 선택된 매장 값을 서버로 전송하도록 구현할 수 있습니다.


                    });
                });


                //매장 재고

                function searchProduct() {
                    // 품번 입력란과 매장재고 결과를 가져오기
                    const productName = document.getElementById('productName').value;

                    // AJAX 또는 서버로 품번을 전송하여 매장 재고를 가져오는 로직을 구현
                    // 여기에서는 임의의 매장 재고 값인 "100"을 사용합니다.
                    const storeInventory = "100";

                    // 가져온 매장 재고를 결과란에 표시
                    document.getElementById('storeInventory').value = storeInventory;
                }


                // function deleteCheck() {
                //     result = confirm('진짜로 삭제하겠습니까?');
                //     if (result == true) {
                //         location.href = 'instructiondeleteProc?no=${instruction.no}'
                //     }
                // }


                // 모달 창 열기
                function openModal() {
                    document.getElementById('myModal').style.display = 'flex';
                }

                // 모달 창 닫기
                function closeModal() {
                    document.getElementById('myModal').style.display = 'none';
                }

                // 조회를 수행하는 함수 (원하는대로 사용자 정의 가능)
                function lookupCode() {
                    // 팝업 창에서 입력한 코드 가져오기
                    const enteredCode = document.getElementById('codeInput').value;

                    // 조회 로직 수행 (AJAX 또는 필요한 다른 로직)

                    // 현재는 입력한 코드를 포함한 경고 표시
                    alert('코드 조회: ' + enteredCode);

                    // 모달 창 닫기
                    closeModal();
                }
                function fetchProductInfo() {
                    // 모달에 입력된 상품 코드 가져오기
                    const prodNo = document.getElementById('modal-prodno').value;

                    // AJAX를 이용하여 서버에 상품 코드 전송
                    const xhr = new XMLHttpRequest();
                    xhr.open('GET', '/your-controller-path/fetchProdNo?criteria=' + prodNo, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            const productInfo = JSON.parse(xhr.responseText);
                            displayProductInfo(productInfo);
                        }
                    };
                    xhr.send();
                }
                function displayProductInfo(productInfo) {
                    const productInfoDiv = document.getElementById('productInfo');

                    // 이전에 표시된 정보 초기화
                    productInfoDiv.innerHTML = '';

                    // 조회된 정보가 있는 경우
                    if (productInfo.length > 0) {
                        productInfo.forEach(function (product) {
                            const productDiv = document.createElement('div');
                            productDiv.className = 'prodNo';
                            productDiv.textContent = product.prodNo;

                            // 클릭 이벤트 추가
                            productDiv.addEventListener('click', function () {
                                openModal('productModal', product.prodNo);
                            });

                            productInfoDiv.appendChild(productDiv);
                        });
                    } else {
                        // 조회된 정보가 없는 경우
                        const noInfoDiv = document.createElement('div');
                        noInfoDiv.className = 'td';
                        noInfoDiv.textContent = '조회된 정보가 없습니다.';
                        productInfoDiv.appendChild(noInfoDiv);
                    }
                }

            </script>

        </body>

        </html>