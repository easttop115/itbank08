<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <html>

        <head>
            <meta charset="UTF-8">

            <title>게시글 상세 페이지</title>
            <style>
                body {
                    padding-top: 0px;
                    padding-bottom: 30px;
                }

                * {
                    box-sizing: border-box;
                }

                ul,
                li {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                }

                .header-section {
                    display: flex;
                    align-items: center;
                    margin-bottom: 20px;
                }

                .page-name-box {
                    display: flex;
                    margin-top: 20px;
                }

                .site-name {
                    font-size: 32px;
                    font-weight: 900;
                    color: #2895F4;
                    margin-right: 10px;
                }

                .page-name {
                    font-size: 32px;
                    font-weight: 900;
                }

                .meddle {
                    margin-bottom: 10px;
                    margin: 100px;
                    padding: 42px;

                }

                .custom-button {
                    background-color: #2895F4;
                    border: 1px solid #2895F4;
                    border-radius: 5px;
                }

                .user-form {
                    display: flex;
                    align-items: center;
                }

                .cobo {
                    border-top: 1px solid #ccc;
                    /* 상단에 선 추가 */
                    padding-top: 10px;
                    /* 선과 내용 사이의 간격 조절 */
                    margin-top: -492px;
                    /* 선과 상단 내용 사이의 간격 조절 */
                }

                .xans-board-movement li {
                    overflow: hidden;
                    padding: 0 20px;
                    border-bottom: 1px solid #e8e8e8;
                    font-size: 14px;
                    line-height: 1.8;
                    color: #333;
                    display: flex;
                    justify-content: flex-start;
                }

                .xans-board-movement {
                    border-top: 1px solid #e8e8e8;
                    border-bottom: 1px solid #e8e8e8;
                    margin: 20px 0;
                }
            </style>
        </head>

        <body>
            <c:import url="/header" />
            <article>
                <div class="container" role="main">
                    <div class="header-section">
                        <div class="page-name-box">
                            <div class="site-name">STOCK CITY |</div>
                            <div class="page-name">공지사항</div>
                        </div>
                    </div>
                    <form name="form" id="form" role="form" method="post" enctype="multipart/form-data">

                        <div class="meddle">
                            <div class="user-form">
                                <label for="title">제목</label>
                                <div class="form-control" name="title" id="title">${notice.title}</div>
                            </div>
                            <div class="meddle">
                                <label for="id">작성자</label>
                                <div class="form-control" name="id" id="id">${notice.id}</div>
                            </div>
                        </div>
                        <div class="meddle">
                            <div class="cobo">
                                <label for="content">내용</label>
                                <div class="form-control" rows="5" name="content" id="content">${notice.content}</div>
                            </div>
                        </div>

                        <div class="meddle">
                            <c:if test="${not empty notice.fileName}">
                                <label for="fileName">파일 이름</label>
                                <div class="form-control" id="FileName">${notice.fileName}</div>
                                <a href="noticeDownload?no=${notice.no}">파일 다운로드</a>
                            </c:if>
                        </div>
                        <!-- <div
                            class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002">
                            <ul>
                                <li class="prev">
                                    <strong>이전글</strong>
                                    <c:choose>
                                        <c:when test="${prevNext.prevNum == 0}">
                                            <span style="color: gray;">이전글이 없습니다.</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a
                                                href="/notice/noticecontent?reviewNum='${prevNext.prevNum}'">${prevNext.prevTitle}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="next">
                                    <strong>다음글</strong>
                                    <c:choose>
                                        <c:when test="${prevNext.nextNum == 0}">
                                            <span style="color: gray;">다음글이 없습니다.</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a
                                                href="${contextPath}/notice/noticecontent?reviewNum=${prevNext.nextNum}">${prevNext.nextTitle}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </div> -->

                        <div>
                            <c:choose>
                                <c:when test="${sessionScope.id == 'admin'}">
                                    <button type="button" class="btn btn-sm btn-primary custom-button"
                                        onclick="location.href='NoticeForm'">목록</button>
                                    <button type="button" class="btn btn-sm btn-primary custom-button"
                                        onclick="location.href='NoticeModify?no=${Notice.no}'">수정</button>
                                    <button type="button" class="btn btn-sm btn-primary custom-button" id="btnDelete"
                                        onclick="deleteCheck()">삭제</button>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                </div>
            </article>
            <script>

                function deleteCheck() {
                    result = confirm('진짜로 삭제하겠습니까?');
                    if (result == true) {
                        location.href = 'NoticeDeleteProc?no=${Notice.no}'
                    }
                }

                $(document).on('click', '#btnModify', function (e) {
                    e.preventDefault();
                    $("#form").attr('action', "/NoticeModify");
                    $("#form").submit();
                });
                $(document).on('click', '#btnDelete', function (e) {
                    e.preventDefault();
                    $("#form").attr('action', "/ NoticeDeleteProc");
                    // $("#form").submit();
                });

                $(document).on('click', '#btnList', function (e) {
                    e.preventDefault();
                    location.href = "/NoticeForm";
                });


            </script>




        </body>

        </html>