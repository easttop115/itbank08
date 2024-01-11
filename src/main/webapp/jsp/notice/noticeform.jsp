<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>공지사항 목록</title>

      <style>
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
        }

        section.notice {
          padding: 80px 0;
        }

        .page-title {
          margin-bottom: 60px;
        }

        .page-title h1 {
          font-size: 28px;
          color: #333333;
          font-weight: 400;
          text-align: center;
        }

        #notice-search .search-window {
          padding: 15px 0;
          background-color: #f9f7f9;
        }

        #notice-search .search-window .search-wrap {
          position: relative;
          /* padding-right: 124px; */
          margin: 0 auto;
          width: 80%;
          max-width: 564px;
        }

        #notice-search .search-window .search-wrap input {
          height: 40px;
          width: 100%;
          font-size: 14px;
          padding: 7px 14px;
          border: 1px solid #ccc;
        }

        #notice-search .search-window .search-wrap input:focus {
          border-color: #333;
          outline: 0;
          border-width: 1px;
        }

        #notice-search .search-window .search-wrap .btn {
          position: absolute;
          right: 0;
          top: 0;
          bottom: 0;
          width: 108px;
          padding: 0;
          font-size: 16px;
          background-color: #2895F4;
        }

        .notice-table {
          font-size: 13px;
          width: 100%;
          border-top: 1px solid #ccc;
          border-bottom: 1px solid #ccc;
        }

        .notice-table a {
          color: #333;
          display: inline-block;
          line-height: 1.4;
          word-break: break-all;
          vertical-align: middle;
        }

        .notice-table a:hover {
          text-decoration: underline;
        }

        .notice-table .no,
        .notice-table .writeDate {
          width: 100px;
          text-align: center;
        }

        .notice-table .title {
          flex: 1;
          text-align: center;
        }

        .notice-table th,
        .notice-table td {
          padding: 14px 0;
        }

        .notice-table .notice-item td {
          border-top: 1px solid #e7e7e7;
          text-align: center;

        }

        .notice-table .notice-item tr td a {
          border-top: 1px solid #e7e7e7;
          text-align: center;
          align: center;
        }

        .notice-table .notice-item th {
          padding-left: 28px;
          padding-right: 14px;
          border-top: 1px solid #e7e7e7;
          text-align: left;
        }

        .notice-table .notice-item th p {
          display: none;
        }

        .btn {
          display: inline-block;
          padding: 0 30px;
          font-size: 15px;
          font-weight: 400;
          background: transparent;
          text-align: center;
          white-space: nowrap;
          vertical-align: middle;
          -ms-touch-action: manipulation;
          touch-action: manipulation;
          cursor: pointer;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
          border: 1px solid transparent;
          text-transform: uppercase;
          -webkit-border-radius: 0;
          -moz-border-radius: 0;
          border-radius: 0;
          -webkit-transition: all 0.3s;
          -moz-transition: all 0.3s;
          -ms-transition: all 0.3s;
          -o-transition: all 0.3s;
          transition: all 0.3s;
        }

        .btn-dark {
          background: #555;
          color: #fff;
        }

        .btn-dark:hover,
        .btn-dark:focus {
          background: #373737;
          border-color: #373737;
          color: #fff;
        }



        * {
          list-style: none;
          text-decoration: none;
          padding: 0;
          margin: 0;
          box-sizing: border-box;
        }

        .clearfix:after {
          content: '';
          display: block;
          clear: both;
        }

        .container {
          width: 1100px;
          margin: 0 auto;
        }

        .blind {
          position: absolute;
          overflow: hidden;
          clip: rect(0 0 0 0);
          margin: -1px;
          width: 1px;
          height: 1px;
        }

        .button-box button {
          background-color: #fff;
          border: 1px solid black;
          padding: 8px 12px;
          margin-left: 75%;
        }

        .writeDate {
          margin-left: 88%;
          margin-bottom: 10px;
          margin-top: -19px;
        }

        .no {
          margin-bottom: -17px;
          margin-top: 11px;
        }

        .tr {
          border-bottom: 1px solid #ccc;
        }
      </style>
    </head>

    <body>
      <c:import url="/header" />

      <section class="notice">
        <div class="page-title">
          <div class="container">
            <h1>공지사항</h1>
          </div>
        </div>
        <div class="button-box">
          <!-- <c:choose>
            <c:when test="${sessionScope.id == 'admin'}">
               admin으로 로그인 했을때만 글쓰기 버튼 생성 -->
          <!-- <button type="button" onclick="location.href='noticeWrite'">글쓰기</button>
            </c:when>
          </c:choose> -->
          <button type="button" onclick="location.href='/notice/noticewrite'">글쓰기</button>
        </div>

        </div>

        <!-- 공지사항 검색창 -->
        <div id="notice-search">

          <div class="container">
            <div class="search-window">
              <form action="/searchNotice" method="post">
                <div class="search-wrap">
                  <label for="search" class="blind">공지사항 제목 검색</label>
                  <input id="title" type="text" name="title" placeholder="검색어를 입력해주세요.">
                  <button type="submit" class="btn btn-dark">검색</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <!-- 공지사항 항목 -->
        <div id="notice-list">
          <div class="container">
            <div class="notice-table">
              <div class="notice-item">
                <div class="tr">
                  <div class="no">NO</div>
                  <div class="title">제목</div>
                  <div class="writeDate">등록일</div>
                </div>
              </div>

              <c:choose>
                <c:when test="${empty Notices}">
                  <div class="notice-item">
                    <div class="tr">
                      <div class="td" colspan="10">등록된 데이터가 존재하지 않습니다.</div>
                    </div>
                  </div>
                </c:when>
                <c:otherwise>
                  <c:forEach var="Notice" items="${Notices}">
                    <div class="notice-item">
                      <div class="tr">
                        <div class="no">${Notice.no}</div>
                        <div class="title" onclick="location.href='noticecontent?no=${Notice.no}'">
                          ${Notice.title}</div>
                        <div class="writeDate">${Notice.writeDate}</div>
                      </div>
                    </div>
                  </c:forEach>
                  <div class="notice-item">
                    <div class="tr">
                      <div class="td" colspan="7">${result}</div>
                    </div>

                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>

        <script>
          function searchFunction() {

            var t = document.getElementById("search_tex").value.trim();
            console.log(t);
            var xhr;

            xhr = new XMLHttpRequest();
            xhr.open('post', '/searchNotice');
            xhr.send(t);
            xhr.onreadystatechange = resProc;
          }
          function resProc() {
            if (xhr.readyState == 4 && xhr.status == 200) {
              var resData = xhr.responseText;
              // 입력된 검색어 가져오기
              var input, filter, table, tr, td, i, txtValue;
              input = document.getElementById("search");
              filter = input.value.toUpperCase();
              table = document.getElementById("noticeTable"); // 공지사항 테이블의 id를 설정해야 합니다.
              tr = table.getElementsByTagName("div"); // 테이블 행이 div 요소로 되어 있다고 가정합니다.

              // 각 행을 반복하며 검색어에 맞지 않는 항목을 숨깁니다.
              for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByClassName("title")[0]; // 제목이라고 가정합니다.
                if (td) {
                  txtValue = td.textContent || td.innerText;
                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                }
              }
            }
          }
        </script>


    </body>

    </html>