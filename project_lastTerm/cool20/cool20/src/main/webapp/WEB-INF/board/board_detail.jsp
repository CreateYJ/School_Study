<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<style>
div.container {
	text-align: center;
	margin: 0 auto;
	width: 500px;
}

body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

.container {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 500px;
	text-align: center;
}

h1 {
	font-size: 20px;
	margin-bottom: 10px;
}

p {
	margin-bottom: 5px;
}

.actions {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="page_header_wrapper">
		<jsp:include page="../global/page_header.jsp" flush="false" />
	</div>

	<div class="container">
		<jsp:useBean id="board" scope="request"
			type="com.tukorea.project_board.Board" />

		<h1>게시글 상세</h1>
		<p>
			<strong>제목:</strong> ${board.title}
		</p>
		<p>
			<strong>내용:</strong> ${board.contents}
		</p>
		<p>
			<strong>작성자:</strong> ${board.writer}
		</p>

		<div class="actions">
			<a href="${pageContext.request.contextPath}/board/board_list"
				class="btn">목록으로</a>
		</div>
	</div>

	<div class="page_footer_wrapper">
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>
</body>
</html>
