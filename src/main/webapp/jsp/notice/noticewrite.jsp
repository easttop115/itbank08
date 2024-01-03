<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>공지사항 글쓰기</title>
            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
                integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
                crossorigin="anonymous">
            <style>
                body {
                    padding-top: 0px;
                    padding-bottom: 30px;
                    font-family: 'Arial', sans-serif;
                    /* 기본 글꼴 지정 */
                }

                .container {
                    max-width: 600px;
                    /* 폼의 최대 너비 설정 */
                }

                .header-section {
                    display: flex;
                    align-items: center;
                    margin-bottom: 20px;
                }

                .page-name-box {
                    display: flex;
                    margin-top: 30px;
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
                    margin-bottom: 15px;
                }

                .label {
                    font-size: 18px;
                    color: #555;
                }

                .form-control {
                    font-size: 16px;
                    /* 추가 스타일은 JavaScript로 조절합니다. */
                }

                #pwd {
                    width: 40%;
                }

                .custom-button {
                    background-color: #2895F4;
                    border: 1px solid #2895F4;
                    border-radius: 5px;
                    color: #fff;
                    font-size: 16px;
                }

                .meddle .style-options {
                    display: flex;
                    flex-direction: row;
                    /* 수정된 부분: 로우로 변경 */
                    gap: 10px;
                    /* 각 옵션 사이의 간격 조절 */
                }

                .meddle .style-options label {
                    margin-right: 10px;
                    /* 옵션 라벨과의 간격 조절 */
                    background-color: black;
                    color: white;
                    padding: 5px;
                    border-radius: 5px;
                    display: inline-block;
                }

                /* 추가된 스타일 */
                .top-line,
                .bottom-line {
                    height: 1px;
                    background-color: #ddd;
                    margin-bottom: 10px;
                    /* 수정된 부분: 간격 추가 */
                }

                #styleInfo {
                    display: none;
                    position: absolute;
                    background-color: black;
                    color: white;
                    padding: 5px;
                    border-radius: 5px;
                }
            </style>
        </head>

        <body>
            <c:import url="/header" />
            <article>
                <div class="container" role="main">
                    <div class="header-section">
                        <div class="page-name-box">
                            <div class="site-name">Stock City | </div>
                            <div class="page-name">글쓰기</div>
                        </div>
                    </div>
                    <form name="form" id="form" role="form" method="post" enctype="multipart/form-data">
                        <div class="meddle">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
                        </div>

                        <!-- 추가된 부분: 상단 선 -->
                        <div class="top-line"></div>

                        <div class="meddle">
                            <div class="style-options">
                                <select id="fontFamily">
                                    <option value="'Arial', sans-serif">Arial</option>
                                    <option value="'Times New Roman', serif">Times New Roman</option>
                                    <!-- 추가할 글꼴 옵션들을 넣으세요 -->
                                </select>
                                <input type="number" id="fontSize" min="10" max="30" step="1" value="16">
                                <input type="color" id="fontColor" value="#000000">
                                <select id="textAlign">
                                    <option value="left">왼쪽</option>
                                    <option value="center">가운데</option>
                                    <option value="right">오른쪽</option>
                                </select>
                                <select id="fontWeight">
                                    <option value="normal">보통</option>
                                    <option value="bold">굵게</option>
                                </select>

                            </div>

                            <div class="meddle">
                                <label for="isSticky">상단 고정 여부</label>
                                <input type="checkbox" name="isSticky" id="isSticky" value="true">
                            </div>
                            <div id="styleInfo"></div>

                            <!-- 추가된 부분: 상단 선 -->
                            <div class="bottom-line "></div>


                            <div class="meddle">
                                <label for="content">내용</label>
                                <textarea class="form-control" rows="15" cols="70" name="content" id="content"
                                    placeholder="내용을 입력해 주세요"></textarea>
                            </div>


                            <div class="meddle">
                                <label for="fileName">파일첨부</label>
                                <input type="file" name="FileName">
                            </div>
                            <div class="meddle">
                                <label for="passwd">비밀번호</label>
                                <input type="password" name="pwd" size="10" class="form-control" id="pwd"
                                    placeholder="4자리 입력해주세요">
                            </div>
                        </div>
                        <div>
                            <input type="submit" class="btn btn-sm btn-primary custom-button" id="btnSave" value="저장">
                            <input type="button" class="btn btn-sm btn-primary custom-button" id="btnList" value="목록">
                        </div>
                    </form>
                </div>
            </article>
            <script>
                $(document).ready(function () {
                    $('.style-options label').mouseover(function () {
                        var labelText = $(this).text();
                        $('#styleInfo').text(labelText).show();
                    });

                    $('.style-options label').mouseout(function () {
                        $('#styleInfo').hide();
                    });

                    $(document).on('change', '#fontFamily', function () {
                        var selectedFont = $(this).val();
                        updateStyle("font-family", selectedFont);
                    });

                    $(document).on('input', '#fontSize', function () {
                        var selectedSize = $(this).val() + "px";
                        updateStyle("font-size", selectedSize);
                    });

                    $(document).on('change input', '#fontColor', function () {
                        var selectedColor = $(this).val();
                        console.log("Selected color:", selectedColor);
                        updateStyle("color", selectedColor);
                    });



                    $(document).on('change', '#textAlign', function () {
                        var selectedAlign = $(this).val();
                        updateStyle("text-align", selectedAlign);
                    });

                    $(document).on('change', '#fontWeight', function () {
                        var selectedWeight = $(this).val();
                        updateStyle("font-weight", selectedWeight);
                    });

                    function updateStyle(property, value) {
                        // 스타일을 업데이트하는 함수
                        $("#content").css(property, value);
                    }

                    $(document).on('input', '#content', function () {
                        // 내용 박스의 높이를 고정하고 내용이 넘칠 경우 스크롤이 생기도록 스타일을 적용합니다.
                        $("#content").css({
                            "height": "200px",  // 적절한 높이로 조절하세요.
                            "overflow-y": "auto"
                        });
                    });
                });
            </script>



        </body>

        </html>