<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>채팅방 목록</title>
            <style>
                body {
                    margin: 0;
                    font-family: 'Arial', sans-serif;
                }

                #modal {
                    display: none;
                    position: fixed;
                    right: 0;
                    top: 200px;
                    min-width: 330px;
                    width: 20vw;
                    height: 100vh;
                    background-color: #fff;
                    box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
                }

                #openModalBtn {
                    position: fixed;
                    bottom: 10px;
                    right: 10px;
                    padding: 10px;
                    background-color: #007bff;
                    color: #fff;
                    cursor: pointer;
                    border-radius: 10px;
                    z-index: 999;
                    /* Ensure it's on top of other elements */
                }

                #closeModalBtn {
                    position: absolute;
                    right: 10px;
                    top: 35px;
                    cursor: pointer;
                    padding: 10px;
                    background-color: #007bff;
                    color: #fff;
                    border-radius: 10px;
                }

                #chatroomList,
                #inviteList,
                #chatroomContent {
                    padding: 20px;
                }

                #chatroomContent {
                    padding-top: 10px;
                }

                #chatInput {
                    width: 70%;
                    padding: 8px;
                    margin-right: 10px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }

                #sendBtn {
                    padding: 8px;
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
            </style>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <script type="text/javascript">
                // WebSocket 연결
                var socket = new WebSocket("ws://localhost:9090/websocket");
                // WebSocket 이벤트 핸들러
                socket.onopen = function (event) {
                    console.log("WebSocket 연결 성공!");
                };

                // WebSocket 이벤트 핸들러
                socket.onmessage = function (event) {
                    // 서버로부터 메시지를 받았을 때의 처리
                    var message = JSON.parse(event.data);
                    console.log("WebSocket 메시지 받음:", message);

                    // 채팅 로그를 표시하는 코드
                    var chatroomContent = document.getElementById('chatroomContent');
                    var chatLog = document.createElement('p');
                    chatLog.textContent = message.userId + ": " + message.message;
                    chatroomContent.appendChild(chatLog);
                };

                function sendMessage(chatroomNumber) {
                    var messageInput = document.getElementById('chatInput');
                    var message = messageInput.value.trim();

                    if (message !== "") {
                        var chatLogDTO = {
                            chatroomNo: chatroomNumber,
                            userId: '${sessionScope.id}',
                            message: message
                        };
                        socket.send(JSON.stringify(chatLogDTO));

                        // 메시지 전송 후 입력 필드 비우기
                        messageInput.value = "";
                    }
                }
            </script>
        </head>

        <body>
            <div id="openModalBtn" onclick="openModal()">채팅 열기</div>

            <div id="modal">
                <div id="closeModalBtn" onclick="closeModal()">닫기</div>
                <!-- ////////////////채팅리스트////////////////////////////////////////////////////////////////////////// -->
                <div id="chatroomList">
                    <h2>채팅방 목록</h2>
                    <c:forEach var="chatroomNumber" items="${chatroomNumbers}">
                        <button class="chatroomButton" onclick="showChatroomContent('${chatroomNumber}')">
                            채팅방 ${chatroomNumber}
                        </button>
                    </c:forEach>
                    <button id="inviteRoomBtn" onClick="inviteRoom()">새 채팅</button>
                </div>
                <!-- ////////////////새 채팅방 만들기////////////////////////////////////////////////////////////////////////// -->
                <div id="inviteList" style="display: none;">
                    <h2>초대 목록</h2>
                    <c:forEach var="storeId" items="${storeIds}">
                        <label>
                            <input type="checkbox" class="chatroomCheckbox" value="${storeId}">
                            채팅방 ${storeId}
                        </label>
                    </c:forEach>
                    <button onclick="joinSelectedChatrooms()">채팅방 입장</button>
                </div>

                <!-- ///////////////////채팅 창////////////////////////////////////////////////////////////////// -->
                <div id="chatroomContent" style="display: none;">
                    <!-- Content for chatroom -->
                    <!-- You can add the content for each chatroom dynamically -->

                    <!-- 채팅 입력 필드 -->
                    <input type="text" id="chatInput" placeholder="메시지 입력">

                    <!-- 전송 버튼 -->
                    <button id="sendBtn" onclick="sendMessage()">전송</button>
                </div>
                <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
            </div>

            <script type="text/javascript">
                socket.onclose = function (event) {
                    console.log("WebSocket 연결 종료: " + event.code + ", " + event.reason);
                };
                function openModal() {
                    document.getElementById('modal').style.display = 'block';
                    document.getElementById('chatroomList').style.display = 'block';
                    document.getElementById('inviteList').style.display = 'none';
                    document.getElementById('chatroomContent').style.display = 'none';
                    document.getElementById('openModalBtn').style.display = 'none';

                }
                function inviteRoom() {
                    document.getElementById('inviteList').style.display = 'block';
                    document.getElementById('chatroomList').style.display = 'none';
                }
                function showChatroomContent(chatroomNumber) {
                    var content = "<h3>채팅방 " + chatroomNumber + " 내용</h3>";
                    content += "<p>채팅 내용이 여기에 들어갑니다.</p>";
                    document.getElementById('chatroomContent').innerHTML = content;

                    document.getElementById('chatroomList').style.display = 'none';
                    document.getElementById('chatroomContent').style.display = 'block';

                    // 수정된 내용: showChatroomContent 함수에서 sendMessage 호출
                    sendMessage(chatroomNumber);
                }
                function closeModal() {
                    document.getElementById('modal').style.display = 'none';
                    document.getElementById('openModalBtn').style.display = 'block';
                }
            </script>
        </body>

        </html>