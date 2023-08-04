<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 20px;
}

.page_header_wrapper {
    margin-bottom: 20px;
}

.page_footer_wrapper {
    margin-top: 20px;
}

.container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-gap: 20px;
    justify-content: center;
    align-items: center;
}

.container img {
    width: 100%;
    height: auto;
}
</style>
</head>
<body>
	<!-- 상단 헤더 삽입 위치 -->
	<div class="page_header_wrapper">
		<jsp:include page="../global/page_header.jsp" flush="false" />
	</div>

	<div class="container">
		<jsp:useBean id="items" scope="request" type="java.util.List" />
		<%-- 데이터베이스에서 가져온 상품 목록 반복 출력 --%>
		<c:forEach items="${items}" var="item">
			<div>
				<a href="/items/detail/${item.id}"> <img
					src="/${item.image}" alt="${item.name}">
				</a>
			</div>
		</c:forEach>
	</div>

	<!-- 하단 푸터 삽입 위치 -->
	<div class="page_footer_wrapper">
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>
</body>
</html>
