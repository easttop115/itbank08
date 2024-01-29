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

                .instruction-item2 {
                    background-color: #fff;
                    display: flex;
                    justify-content: space-between;
                    padding: 8px;
                    margin-top: 5px;
                    border: 1px solid #D3D3D3;
                }

                .instruction-item2 div {
                    /* 각 div 엘리먼트에 대한 스타일 */
                    flex: 1;
                    border-right: 1px solid #060000;
                    /* 각 엘리먼트 사이에 흰색 구분선 추가 */
                    padding: 0 8px;
                    /* 왼쪽 오른쪽으로 8px 간격 추가 */
                    box-sizing: border-box;
                    /* 패딩을 포함한 전체 크기 유지 */
                }

                .instruction-item2 div:last-child {
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

                /*모달*/
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
                    padding: 40px;
                    border-radius: 10px;
                    width: 72%;
                    text-align: center;
                    margin: 80px auto 0;
                    display: flex;
                    justify-content: center;
                    /* 요소들을 시작 부분에 정렬 */
                    flex-wrap: wrap;
                    /* 넘치는 요소를 다음 줄로 이동시키기 위해 추가 */
                }

                .modal-filter {
                    display: inline-flex;
                    /* 요소들을 가로로 정렬하는 Flexbox 설정 */
                    justify-content: center;

                }



                .output-container {
                    border: 1px solid #ddd;
                    /* 네모 박스 테두리 스타일 지정 */
                    padding: 10px;
                    /* 내부 간격 지정 */
                    border-radius: 5px;
                    /* 모서리를 둥글게 만듦 */
                    background-color: #f5f5f5;
                    /* 네모 박스 배경색 지정 */
                    width: 100%;
                    /* 네모 박스를 부모 요소의 가로폭에 맞춤 */
                    margin-top: 20px;
                    /* 상단 여백 추가 */
                    display: flex;
                    justify-content: flex-start;

                }

                .modal-bottem {
                    display: flex;
                    justify-content: space-between;
                    padding: 8px;
                    margin-top: -10px;
                    background-color: #cadae7;
                    /* 배경 색상 변경 */
                    border: 1px solid #D3D3D3;
                    /* 테두리 추가 */
                    white-space: nowrap;
                    width: 148%;

                }

                .modal-bottem div {
                    /* 각 div 엘리먼트에 대한 스타일 */
                    flex: 1;
                    border-right: 1px solid #060000;
                    /* 각 엘리먼트 사이에 흰색 구분선 추가 */
                    padding: 0 8px;
                    /* 왼쪽 오른쪽으로 8px 간격 추가 */
                    box-sizing: border-box;
                    /* 패딩을 포함한 전체 크기 유지 */
                }

                .modal-bottem div:last-child {
                    border-right: none;
                    /* 마지막 엘리먼트의 오른쪽 구분선 제거 */
                }



                .close-btn {
                    margin-left: 136%;
                    font-size: 24px;
                    /* 추가된 부분 */
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



                .instruction-item2 {
                    background-color: #fff;
                }


                /*스크롤*/

                .prodNo-wrapper {
                    overflow-x: auto;
                }

                .prodName {
                    overflow-x: auto;
                    /* 가로 스크롤을 표시하기 위해 추가 */
                    white-space: nowrap;
                    /* 텍스트 줄바꿈 방지 */
                    max-width: 200px;
                    /* 필요한 경우 최대 너비 지정 */
                }

                .instruction-item.header .no {
                    width: 30px;
                    /* 원하는 너비로 조정 */
                }

                .instruction-item.header .no {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    max-width: 42px;
                    /* 원하는 최대 너비로 조정 */
                }

                .instruction-item2 .no {
                    max-width: 42px;
                    /* 원하는 너비로 조정 */
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }
            </style>
        </head>

        <body>
            <c:import url="/header" />
            <!--버튼-->

            <h1>R/T지시요청</h1>
            <div class="button-box">
                <button>조회</button>
                <button type="button" onclick="location.href='/instruction/instructionform'">목록</button>
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
                        <div class="no">NO</div> <!-- NO 부분의 길이를 줄임 -->
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
                        <c:when test="${empty instructionDTOLists}">
                            <li class="instruction-item" style="background-color: #fff;">
                                <div class="instruction-title" style="color: #000;" colspan="13">조회된 정보가 없습니다.
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="instruction" items="${instructionDTOLists}">
                                <li class="instruction-item2">
                                    <div class="no">${instruction.no}</div>
                                    <!-- HTML 코드 수정 -->
                                    <div class="prodNo-wrapper">
                                        <div class="prodNo" style="white-space: nowrap;">${instruction.prodNo}
                                        </div>
                                    </div>
                                    <!-- 품번이 긴 경우 스크롤 적용 -->
                                    <div class="prodName">${instruction.prodName}</div>
                                    <div class="colorCode">${instruction.colorCode}</div>
                                    <div class="size">${instruction.size}</div>
                                    <div class="reqQuan">${instruction.reqQuan}</div>
                                    <div class="sellPrice">${instruction.sellPrice}</div>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <!-- 모달 -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <form id="filter-form">
                        <form id="searchForm" action="/instruction/modalList" method="post">
                            <span class="close-btn" onclick="closeModal()">&times;</span>
                            <div class="modal-filter">
                                <label for="cateGroup" class="filter-label"></label>
                                <select name="cateGroup" id="cateGroup" class="searchOption">
                                    <option value="">카테고리 그룹 선택</option>
                                    <c:forEach var="instruction" items="${instructionDTOLists}">
                                        <option value="${instruction.cateGroup}">${instruction.cateGroup}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="modal-filter">
                                <label for="cateCode" class="filter-label"></label>
                                <select name="cateCode" id="cateCode" class="searchOption">
                                    <option value="">카테고리 코드 선택</option>
                                    <c:forEach var="instruction" items="${instructionDTOLists}">
                                        <option value="${instruction.cateCode}">${instruction.cateCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="modal-filter">
                                <label for="colorCode" class="filter-label"></label>
                                <select name="colorCode" id="colorCode" class="searchOption">
                                    <option value="">색상 코드 선택</option>
                                    <c:forEach var="instruction" items="${instructionDTOLists}">
                                        <option value="${instruction.colorCode}">${instruction.colorCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="modal-filter">
                                <label for="size" class="filter-label"></label>
                                <select name="size" id="size" class="searchOption">
                                    <option value="">사이즈 선택</option>
                                    <option value="S">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option>
                                </select>
                            </div>
                            <div class="filter-search">
                                <input id="searchProdNo" type="text" name="searchProdNo" placeholder="상품코드를 입력해주세요">
                                <input type="submit" class="search-button" value="검색">
                            </div>
                        </form>
                    </form>
                    <!-- 품번, 품명, 색상, 사이즈 출력란 -->
                    <div class="output-container">
                        <div class="table">
                            <div class="modal-bottem">
                                <div class="modal-cell">품번</div>
                                <div class="modal-cell">품명</div>
                                <div class="modal-cell">색상</div>
                                <div class="modal-cell">사이즈</div>
                                <!-- 필요한 열을 추가할 수 있습니다. -->
                            </div>
                            <div class="table-body">
                                <!-- 여기에 조회 결과를 반복문으로 표현하는 div 요소들을 추가합니다. -->
                                <c:choose>
                                    <c:when test="${not empty instructionDTOLists}">
                                        <c:forEach var="instruction" items="${instructionDTOLists}">
                                            <div class="instruction-item">
                                                <div class="prodNo"
                                                    onclick="openModal('productModal', '${instruction.prodNo}')">
                                                    ${instruction.prodNo}</div>
                                                <div class="prodName"
                                                    onclick="openModal('productModal', '${instruction.prodNo}')">
                                                    ${instruction.prodName}</div>
                                                <div class="size">${instruction.size}</div>
                                                <div class="colorCode">${instruction.colorCode}</div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="no-data-row">
                                            <div colspan="5">조회된 정보가 없습니다.</div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
        </body>
        <script>
            // 모달 관련 함수들
            function openModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "block";
            }

            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }

            // 검색 버튼에 이벤트 핸들러 추가
            document.getElementById('searchButton').addEventListener('click', function (event) {
                event.preventDefault(); // 기본 동작 중지
                openModal(); // 모달 열기 함수 호출
            });

            const modalForm = document.querySelector('#modalForm');
            modalForm.addEventListener('submit', function (event) {
                event.preventDefault();
                console.log('event: ', event);

                const formData = new FormData(modalForm);
                const formNameList = ['prodNo', 'brandCode', 'cateCode', 'size', 'colorCode', 'incomePrice', 'sellPrice', 'prodCon'];

                const submitData = {};

                for (let i = 0; i < formNameList.length; i++) {
                    const formName = formNameList[i];
                    submitData[formName] = formData.get(formName);
                }
                console.log('submitData: ', submitData);
                updateFetch(submitData);
            });



            function loadProdInfo(prodNo) {
                fetch('<c:url value="/prod/detail/" />' + prodNo)
                    .then(res => res.json())
                    .then(data => {
                        console.log('data: ', data);
                        generateModalContent(data);
                    });
            }

            function generateModalContent(prodInfo) {
                const formHtml =
                    '<div class="form-container">' +
                    '  <h2 style="text-align: center;">' + prodInfo.prodName + '</h2>' +
                    '  <div class="input-row">' +
                    '    <label for="modifyProdNo">상품코드</label>' +
                    '    <input type="text" class="modifyProdNo" name="prodNo" value="' + prodInfo.prodNo + '" readonly>' +
                    '  </div>' +
                    '  <div class="input-row">' +
                    '    <label for="modifyBrandCode">브랜드코드</label>' +
                    '    <input type="text" class="modifyBrandCode" name="brandCode" value="' + prodInfo.brandCode + '" readonly>' +
                    '  </div>' +
                    '  <div class="input-row">' +
                    '    <label for="modifyCate">카테고리</label>' +
                    '    <input type="text" class="modifyCate" name="cateCode" value="' + prodInfo.cateCode + '" readonly>' +
                    '  </div>' +
                    '  <div class="input-row">' +
                    '    <label for="modifySize">사이즈</label>' +
                    '    <input type="text" class="modifySize" name="size" value="' + prodInfo.size + '" readonly>' +
                    '  </div>' +
                    '  <div class="input-row">' +
                    '    <label for="modifyColor">색상</label>' +
                    '    <input type="text" class="modifyColor" name="color" value="' + prodInfo.colorCode + '" readonly>' +
                    '  </div>' +


                    console.log('formHtml: ', formHtml);
                const modal = document.querySelector('#modalForm');
                modal.innerHTML = formHtml;
            }

            // 페이지 로딩 시 실행되는 함수
            document.addEventListener('DOMContentLoaded', function () {
                const shopSelect = document.getElementById('shopSelect');

                // 매장 선택 시
                shopSelect.addEventListener('change', function () {
                    const selectedShop = shopSelect.value;
                    console.log('Selected Shop:', selectedShop);
                    // 여기서 선택된 매장 값을 서버로 전송하도록 구현할 수 있습니다.
                });

                // 검색 버튼에 이벤트 핸들러 추가
                document.getElementById('searchButton').addEventListener('click', function (event) {
                    event.preventDefault(); // 기본 동작 중지
                    searchInstructions(); // 검색 수행
                });

                // 카테고리 선택 시 검색 수행
                document.getElementById('cateGroup').addEventListener('change', function () {
                    searchInstructions();
                });

                // 필터 폼 내부의 변경 사항 감지
                document.getElementById('filter-form').addEventListener('change', function () {
                    searchInstructions();
                });
            });

            // 검색 수행 함수
            function searchInstructions() {
                // 검색 조건 수집
                var cateGroup = document.getElementById('cateGroup').value;
                var cateCode = document.getElementById('cateCode').value;
                var colorCode = document.getElementById('colorCode').value;
                var size = document.getElementById('size').value;
                var prodNo = document.getElementById('searchProdNo').value;

                // AJAX 또는 서버로부터 데이터를 가져옴

                // 임시 데이터 예시
                var instructionDTOLists = [
                    { prodNo: '001', prodName: 'Product 1', size: 'M', colorCode: 'Red' },
                    { prodNo: '002', prodName: 'Product 2', size: 'L', colorCode: 'Blue' }
                ];

                displaySearchResults(instructionDTOLists);
            }

            // 검색 결과 표시 함수
            function displaySearchResults(results) {
                var searchResults = document.querySelector('.table-body');
                searchResults.innerHTML = '';

                if (results.length > 0) {
                    results.forEach(function (instruction) {
                        var newItem = document.createElement('div');
                        newItem.className = 'instruction-item';
                        newItem.innerHTML = `
                    <div class="prodNo" onclick="openModal('productModal', '${instruction.prodNo}')">${instruction.prodNo}</div>
                    <div class="prodName" onclick="openModal('productModal', '${instruction.prodNo}')">${instruction.prodName}</div>
                    <div class="size">${instruction.size}</div>
                    <div class="colorCode">${instruction.colorCode}</div>
                `;
                        searchResults.appendChild(newItem);
                    });
                } else {
                    var noDataRow = document.createElement('div');
                    noDataRow.className = 'no-data-row';
                    noDataRow.innerHTML = '<div colspan="4">조회된 정보가 없습니다.</div>';
                    searchResults.appendChild(noDataRow);
                }
            }

            // 모달에서 카테고리 그룹, 카테고리 코드, 색상 코드, 사이즈 선택 및 품번 입력 시 해당 값을 출력란에 표시
            document.getElementById('filter-form').addEventListener('input', function () {
                var cateGroup = document.getElementById('cateGroup').value;
                var cateCode = document.getElementById('cateCode').value;
                var colorCode = document.getElementById('colorCode').value;
                var size = document.getElementById('size').value;
                var prodNo = document.getElementById('prodNo').value;
                document.getElementById('outputProdNo').innerText = prodNo || cateGroup;
                document.getElementById('outputProdName').innerText = cateCode;
                document.getElementById('outputColor').innerText = colorCode;
                document.getElementById('outputSize').innerText = size;
            });

            // 품번 입력란과 매장재고 결과를 가져오기
            function searchProduct() {
                const productName = document.getElementById('productName').value;

                // AJAX 또는 서버로 품번을 전송하여 매장 재고를 가져오는 로직을 구현
                // 여기에서는 임의의 매장 재고 값인 "100"을 사용합니다.
                const storeInventory = "100";

                // 가져온 매장 재고를 결과란에 표시
                document.getElementById('storeInventory').value = storeInventory;
            }

            // 날짜 범위 추가
            function addDateRange() {
                const startDate = document.getElementById('startDate').value; tjd

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

            // 지시번호를 기반으로 검색하는 함수
            function searchInstructions() {
                const instructionNumber = document.getElementById('instructionNumber').value;

                // AJAX 요청 또는 서버로부터 지시를 가져오는 다른 로직을 구현하세요
                console.log('번호로 지시 검색 중:', instructionNumber);
            }
        </script>

        </body>

        </html>