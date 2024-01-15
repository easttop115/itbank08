<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<c:import url="/header" />
			<c:import url="/sider" />
			<link rel="stylesheet" href="/css/userInfo.css">
			<style>
				.header-section {
					display: flex;
					align-items: center;
					margin-bottom: 20px;
				}

				.page-name-box {
					display: flex;
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
			</style>

			<div class="content-container">
				<div class="info-wrapper">
					<div class="header-section">
						<div class="page-name-box">
							<div class="site-name">Stock City |</div>
							<div class="page-name">고객사 정보</div>
						</div>
					</div>
					<h4 class="error-msg">${msg}</h4>
					<c:choose>
						<c:when test="${empty joins}">
							<h1> 등록된 데이터가 존재하지 않습니다. </h1>
						</c:when>
						<c:otherwise>
							<table class="tableLine">
								<thead>
									<tr>
										<th class="th">아이디</th>
										<th class="th">회사명</th>
										<th class="th">사업자등록번호</th>
										<th class="th">이메일</th>
										<th class="th">승인 날짜</th>
										<th class="th">계정 상태</th>
										<th class="th">상태 변경</th>
										<th class="th">매장 수</th>
										<th class="th">매장 추가</th>
										<th class="th">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="joins" items="${joins}">
										<tr>
											<td class="td">${joins.id}</td>
											<td class="td">${joins.company}</td>
											<td class="td">${joins.businessNo}</td>
											<td class="td">${joins.email}</td>
											<td class="td">${joins.regDate}</td>
											<td class="td">${joins.registStatus}</td>
											<c:choose>
												<c:when test="${joins.registStatus == 'denied'}">
													<td class="td"><a href="/verifyProc?email=${joins.email}">가입 승인</a>
													</td>
												</c:when>
												<c:when test="${joins.registStatus == 'approve' or joins.registStatus == 'active'}">
													<td class="td"><a href="/adminStatusModify?id=${joins.id}">비활성화</a></td>
												</c:when>
												<c:otherwise>
													<td class="td"><a href="/adminStatusModify?id=${joins.id}">활성화</a>
													</td>
												</c:otherwise>
											</c:choose>
											<td class="td">${joins.adCount}</td>
											<td class="td">
												<input type="number" id="adCount" name="adCount" min="1">
												<button onclick="addRows('${joins.id}', '${joins.email}')">추가</button>
											</td>
											<td class="td"><a href="/adminRootDelete?id=${joins.id}">삭제</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<script>
				function addRows(id, email) {
					var adCount = document.getElementById("adCount").value;

					// AJAX를 이용하여 입력값을 컨트롤러로 전송할 수 있습니다.
					// 이 예제에서는 간단한 URL로 가정하고 GET 방식으로 전송합니다.
					var url = "/addSubAccount?id=" + id + "&email=" + email + "&adCount=" + adCount;

					// 실제로는 더 복잡한 AJAX 요청을 사용해야 할 수 있습니다.
					// 예를 들어 jQuery나 fetch API 등을 활용할 수 있습니다.
					// 아래 코드는 jQuery를 사용한 예제입니다.
					$.get(url, function (data) {
						// 성공적으로 처리된 경우의 로직
						// 예를 들어 결과를 콘솔에 출력하거나 다른 동작을 수행할 수 있습니다.
						console.log(data);
					});
				}
			</script>