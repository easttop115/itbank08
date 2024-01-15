<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시글 수정 페이지</title>
        </head>
        <style>
            body {
                padding-top: 70px;
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
                color: rgb(253, 195, 0);
                margin-right: 10px;
            }

            .page-name {
                font-size: 32px;
                font-weight: 900;
            }

            .meddle {
                margin-bottom: 10px;
            }

            .custom-button {
                color: #999;
                font-family: 'Monument', 'Noto Sans KR', sans-serif;
                border: solid 1px #ddd;
                font-size: 13px;
                padding: 4px 12px 5px;
                line-height: 1.4;
                border-radius: 5px;
                text-align: left;
                margin-left: 10px;
            }
        </style>

        <body>
            <c:import url="/header" />


            <article>
                <div class="container" role="main">
                    <div class="header-section">
                        <div class="page-name-box">
                            <div class="site-name">BOWFUN |</div>
                            <div class="page-name">공지사항</div>
                        </div>
                    </div>

                    <form action="noticemodifyProc" role="form" method="post">
                        <!--   <form name="form" id="form" role="form" method="post" enctype="multipart/form-data">  -->
                        <input type="hidden" name="no" value="${notice.no }" />
                        <div class="meddle">
                            <label for="title">제목</label> <input type="text" class="form-control" name="title"
                                id="title" value="${notice.title }" />
                        </div>

                        <div class="meddle">
                            <label for="content">내용 수정</label>
                            <textarea class="form-control" rows="5" name="content"
                                id="content">${notice.content }</textarea>
                        </div>

                        <div class="meddle">
                            <label for="fileName">파일첨부</label> <input type="file" name="FileName"
                                value="${notice.fileName }" />
                        </div>




                        <div>
                            <input type="submit" class="btn btn-sm btn-primary custom-button" id="btnSave" value="제출">
                            <button type="button" class="btn btn-sm btn-primary custom-button"
                                onclick="location.href='noticeform'">목록</button>
                            <button type="button" class="btn btn-sm btn-primary custom-button" id="btnbefore"
                                onclick="history.back()">이전</button>

                        </div>

                    </form>
                </div>
            </article>
        </body>

        </html>