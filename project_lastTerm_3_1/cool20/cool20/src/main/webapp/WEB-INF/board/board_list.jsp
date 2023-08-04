<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	text-align: center;
}

tr:hover {
	background-color: #f5f5f5;
}

.actions {
	display: flex;
	gap: 10px;
}

.insert-form {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 300px;
}

.insert-form input[type="text"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
}

.insert-form input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	text-decoration: none;
	cursor: pointer;
	width: 100%;
}
</style>
</head>
<body>

	<div class="page_header_wrapper">
		<jsp:include page="../global/page_header.jsp" flush="false" />
	</div>

	<div class="container">
		<jsp:useBean id="boardList" scope="request" type="java.util.List" />
		<table>
			<thead>
				<tr>
					<th style="width: 50px">번호</th>
					<th style="width: 50px">제목</th>
					<th>내용</th>
					<th style="width: 50px">작성자</th>
					<!-- <th style="width: 140px">등록일시</th> -->
					<th style="width: 100px">액션</th>

				</tr>
			</thead>
			<tbody>
				<%-- Iterate over the list of boards and populate the table rows --%>
				<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td>${boardList.board_seq}</td>
						<td><a
							href="${pageContext.request.contextPath}/board_detail/${boardList.board_seq}">
								${boardList.title} </a></td>
						<td>${boardList.contents}</td>
						<td>${boardList.writer}</td>
						<%-- 						<td>${boardList.reg_date}</td>
 --%>
						<td>
							<%-- Show action links for admin users only --%> <c:if
								test="${boardList.writer eq 'admin'}">
								<div class="actions">
									<c:if test="${sessionScope.user.username == 'admin'}">
										<a href="${pageContext.request.contextPath}/board_edit/${boardList.board_seq}">수정</a>
										<a href="${pageContext.request.contextPath}/board_delete?board_seq=${boardList.board_seq}">삭제</a>
									</c:if>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 작성하기 버튼 -->
		<div class="actions">
			<c:if test="${sessionScope.user.username == 'admin'}">
				<a href="/board/board_create" class="btn">작성하기</a>
			</c:if>
		</div>
	</div>

	<div class="page_footer_wrapper">
		<jsp:include page="../global/page_footer.jsp" flush="false" />