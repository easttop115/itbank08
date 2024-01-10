<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html lang="ko">

    <head>
      <style>
        /* 모달 스타일 */
        .modal {
          display: none;
          /* 기본적으로 모달을 숨김 */
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto;
          background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
          background-color: #fefefe;
          margin: 15% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 80%;
        }

        /* 닫기 버튼 스타일 */
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
    </head>

    <body>


      <!-- 모달 창 -->
      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal()">&times;</span>

          <!-- 모달 내용 -->
          <div class="container">
            <h2 style="text-align: center;">카테고리 등록</h2>
            <form id="categoryForm" action="/category/registerProc" method="post"
              onsubmit="return validateCategoryForm()">
              <!-- 카테고리 그룹 입력 -->
              <label for="cateGroup">카테고리 그룹</label>
              <input type="text" id="cateGroup" name="cateGroup">

              <!-- 카테고리 코드 입력 -->
              <label for="cateCode">카테고리 코드</label>
              <input type="text" id="cateCode" name="cateCode">

              <!-- 카테고리 이름 입력 -->
              <label for="cateName">카테고리 이름</label>
              <input type="text" id="cateName" name="cateName">

              <!-- 카테고리 설명 입력 -->
              <label for="categoryDescription">카테고리 설명</label>
              <textarea id="categoryDescription" name="categoryDescription" rows="4"
                placeholder="카테고리에 대한 설명을 입력하세요"></textarea>

              <!-- 등록 버튼 -->
              <button type="submit">등록</button>
            </form>
          </div>
        </div>
      </div>
    </body>

    </html>