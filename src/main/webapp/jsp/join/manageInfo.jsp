<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<c:import url="/header" />
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

			<div class="info-wrapper">
				<div class="header-section">
					<div class="page-name-box">
						<div class="site-name">Stock City |</div>
						<div class="page-name">고객 관리</div>
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
									<th class="th">전화번호</th>
									<th class="th">가입일</th>
									<th class="th">계정 상태</th>
									<th class="th">매장 종류</th>
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
										<td class="td">${joins.tel}</td>
										<td class="td">${joins.regDate}</td>
										<td class="td">${joins.registStatus}</td>
										<td class="td">${joins.accountId}</td>
										<td class="td">
											<a href="storeDelete?id=${joins.id}">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>