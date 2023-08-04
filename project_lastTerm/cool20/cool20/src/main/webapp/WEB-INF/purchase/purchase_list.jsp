<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase List</title>
<style>
<
style>body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.page_header_wrapper {
	margin-bottom: 20px;
	text-align: center;
}

.page_footer_wrapper {
	margin-top: 20px;
	text-align: center;
}

h1, h2, p {
	margin-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f5f5f5;
	font-weight: bold;
}

td img {
	max-width: 100px;
	height: auto;
}

a {
	color: #337ab7;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</style>
</head>
<body>
	<!-- Header -->
	<div class="page_header_wrapper">
		<jsp:include page="../global/page_header.jsp" flush="false" />
	</div>

	<div class="container">
        <jsp:useBean id="purchase" scope="request" type="java.util.List" />
        <div class="page_header_wrapper">
            <h1>Purchase List</h1>
        </div>
        <table>
            <tr>
                <th>Item ID</th>
                <th>Item Name</th>
                <th>Price</th>
            </tr>
            <c:forEach items="${purchase}" var="purchase">
                <tr>
                    <td>${purchase.item_id}</td>
                    <td>${purchase.item_name}</td>
                    <td>${purchase.price}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

	<!-- Footer -->
	<div class="page_footer_wrapper">
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>
</body>
</html>
