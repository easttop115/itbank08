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
                    <td class="prodNo" onclick="openModal('productModal',  '${product.prodNo}')">${product.prodNo}
                    </td>
                    <td class="prodName" onclick="openModal('productModal',  '${product.prodNo}')">${product.prodName}
                    </td>
                    <td class="size">${product.size}</td>
                    <td class="colorCode">${product.colorCode}</td>
                    <td class="quan">${product.quan}</td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <!-- prod가 비어있는 경우 (검색 결과가 없는 경우) -->
                <tr class="no-data-row">
                  <td colspan="5">조회된 정보가 없습니다.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </table>
        </div>
      </div>


      <!-- 모달 창 -->
      <div id="productModal" class="modal">
        <div class="modal-content">
          <form id="modalForm">

          </form>
        </div>
      </div>
    </body>

    <script>
      function openModal(modalName, prodNo) {
        console.log('prodNo: ', prodNo);
        loadProdInfo(prodNo)
        const selector = '#' + modalName
        const modalEle = document.querySelector(selector)
        modalEle.classList.add('open')
      }

      function closeModal(modalName) {
        const selector = '#' + modalName
        const modalEle = document.querySelector(selector)
        modalEle.classList.remove('open')
      }

      const modalForm = document.querySelector('#modalForm')
      modalForm.addEventListener('submit', function (event) {
        event.preventDefault()
        console.log('event: ', event);

        const formData = new FormData(modalForm)
        const formNameList = ['prodNo', 'brandCode', 'cateCode', 'size', 'colorCode', 'incomePrice', 'sellPrice', 'prodCon']

        // const someObj = { a: 1, b: 2 }
        // someObj.a // 1
        // someObj['a'] // 1

        // someObj.a = 3
        // someObj['a'] = 3

        const submitData = {}

        for (let i = 0; i < formNameList.length; i++) {
          const formName = formNameList[i]
          if (['incomePrice', 'sellPrice'].includes(formName)) {
            submitData[formName] = parseInt(formData.get(formName))
          } else {
            submitData[formName] = formData.get(formName)
          }
        }
        console.log('submitData: ', submitData);
        updateFetch(submitData)

        if (true) {
          alert('수정 완료')
          closeModal('productModal')
        } else {
          alert('수정 실패')
        }

      })

      function updateFetch(submitData) {
        fetch(
          'http://localhost/prod/updateProd/' + submitData.prodNo,
          {
            method: 'PUT',
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify(submitData)
          })
          .then(res => res.json())  // 응답데이터를 json으로 변경
          .then(data => {           // json으로 변환된 data를 받아옴
            console.log('data: ', data);
            return data
          })

      }

      // fetch로 데이터 받아오기(비동기): fetch('url') -> get으로 동작
      // 만약 post로 하려면 옵션 넣어줘야해
      // fetch('url', {
      // method: 'POST'
      // body: JSON.stringify(data) (데이터를 객체로 만들어서 타입 String으로 변경)
      // })
      function loadProdInfo(prodNo) {
        fetch('http://localhost/prod/detail/' + prodNo)
          .then(res => res.json())  // 응답데이터를 json으로 변경
          .then(data => {           // json으로 변환된 data를 받아옴
            console.log('data: ', data);
            generateModalContent(data)
          })
      }

      function generateModalContent(prodInfo) {
        const formHtml =
          '<div class="form-container">'
          + '  <h2 style="text-align: center;">' + prodInfo.prodName + '</h2>'
          + '  <div class="input-row">'
          + '    <label for="modifyProdNo">상품코드</label>'
          + '    <input type="text" class="modifyProdNo" name="prodNo" value="' + prodInfo.prodNo + '" readonly>'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifyBrandCode">브랜드코드</label>'
          + '    <input type="text" class="modifyBrandCode" name="brandCode" value="' + prodInfo.brandCode + '" readonly>'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifyCate">카테고리</label>'
          + '    <input type="text" class="modifyCate" name="cateCode" value="' + prodInfo.cateCode + '" readonly>'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifySize">사이즈</label>'
          + '    <input type="text" class="modifySize" name="size" value="' + prodInfo.size + '" readonly>'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifyColor">색상</label>'
          + '    <input type="text" class="modifyColor" name="color" value="' + prodInfo.colorCode + '" readonly>'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifyIncomePrice">입고금액</label>'
          + '    <input type="text" class="modifyIncomePrice" name="incomePrice" value="' + prodInfo.incomePrice + '">'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifySellPrice">판매금액</label>'
          + '    <input type="text" class="modifySellPrice" name="sellPrice" value="' + prodInfo.sellPrice + '">'
          + '  </div>'
          + '  <div class="input-row">'
          + '    <label for="modifyProdCon">상품설명</label>'
          + '    <input type="text" class="modifyProdCon" name="prodCon" value="' + prodInfo.prodCon + '">'
          + '  </div>'
          + '  <input type="submit" class="form-container button" value="수정"></input>'
          + '  <button type="button" class="form-container button" onclick="closeModal(`productModal`)">취소</button>'
          + '</div>'

        console.log('formHtml: ', formHtml);
        const modal = document.querySelector('#modalForm')
        modal.innerHTML = formHtml


      }
      loadProdInfo()



    </script>

    </html>