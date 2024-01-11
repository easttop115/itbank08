<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:import url="/header" />

        <html>

        <head>
            <meta charset="UTF-8">
            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
                integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
                crossorigin="anonymous">

            <title>게시글 수정 페이지</title>

            <style>
                body {
                    padding-top: 70px;

                    public String NoticeModify(String no, Model model) {
                        int n=0;

                        try {
                            n=Integer.parseInt(no);
                        }

                        catch (Exception e) {
                            return "redirect:NoticeForm";
                        }

                        NoticeDTO Notice=mapper.NoticeContent(n);

                        if (Notice==null) // sessionId = "admin";
                        return "redirect:NoticeForm";

                        if (Notice.getFileName() !=null) {
                            String[] names=Notice.getFileName().split("\\\\");
                            String[] fileNames=names[4].split("-", 2);
                            Notice.setFileName(fileNames[1]);
                        }

                        model.addAttribute("Notice", Notice);
                        return "Notice/NoticeModify";
                    }

                    public String NoticeModifyProc(NoticeDTO Notice) {
                        // System.out.println(Notice.getNo());
                        NoticeDTO check=mapper.NoticeContent(Notice.getNo());
                        if (check==null) return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";

                        // 로그인한 아이디와 작성자 아이디가 같은지 확인
                        String sessionId=(String) session.getAttribute("id");
                        /*
		 * if(check.getId().equals(sessionId) == false) return "작성자만 삭제 할 수 있습니다.";
		 */

                        if (Notice.getTitle()==null || Notice.getTitle().trim().isEmpty()) {
                            return "제목을 입력하세요.";
                        }

                        int result=mapper.NoticeModifyProc(Notice);
                        if (result==0) return "게시글 수정에 실패했습니다. 다시 시도하세요.";

                        return "게시글 수정 성공";
                    }

                    public String NoticeDeleteProc(String no) {
                        // 파일이 존재하면 삭제
                        int n=0;

                        try {
                            n=Integer.parseInt(no);
                        }

                        catch (Exception e) {
                            return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";
                        }

                        NoticeDTO Notice=mapper.NoticeContent(n);
                        if (Notice==null) return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";

                        // 로그인한 아이디와 작성자 아이디가 같은지 확인
                        String sessionId=(String) session.getAttribute("id");
                        //		if(Notice.getId().equals(sessionId) == false)
                        //			return "작성자만 삭제 할 수 있습니다.";

                        String fullPath=Notice.getFileName();

                        if (fullPath !=null) {
                            // 테이블에 파일의 경로와 이름이 있다면
                            File f=new File(fullPath);
                            if (f.exists()==true) // 파일 저장소에 파일이 존재한다면
                            f.delete();
                        }

                        // 테이블에서 게시글번호와 일치하는 행(row)삭제
                        mapper.NoticeDeleteProc(n);
                        return "게시글 삭제 완료";
                    }

                }

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
                    background-color: #FB8E23;
                    border: 1px solid #FB8E23;
                    /* 테두리 스타일과 색상을 지정합니다. */
                    border-radius: 5px;
                    /
                }
            </style>

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