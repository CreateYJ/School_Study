<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap {
	height: auto;
	width: 80%;
	margin-left: 10%;
}

/* Page Header */
#page_header {
	float: left;
	height: 145px;
	width: 100%;
}

#header_menu {
	border-bottom: 1px solid rgb(182, 182, 182);
	width: 100%;
}

#header_menu_right {
	width: 50%;
	float: right;
	height: 30px;
	margin-bottom: 5px;
	text-align: right;
}

#header_menu_left {
	width: 50%;
	height: 30px;
	margin-bottom: 5px;
	text-align: left;
}

a {
	text-decoration: none;
	color: rgb(114, 114, 114);
}

a:hover {
	color: rgb(153, 0, 0);
}

/* Search */
#search {
	z-index: -1;
	float: left;
	height: 97px;
	width: 30%;
	margin-top: 80px;
	vertical-align: bottom;
}

/* Logo */
#page_header_logo {
	margin-top: 10px;
	float: left;
	height: 97px;
	width: 40%;
	justify-content: center;
}

.logo_top {
	height: 97px;
	width: 167px;
	text-align: center;
	margin: auto;
}

/* MenuBar */
#menubar1 {
	text-align: center;
	margin-bottom: 10px;
	width: 100%;
	display: flex;
	border-bottom: 1px solid rgb(182, 182, 182);
	justify-content: space-between;
}

/* 드롭다운 메뉴  */
.dropdown-content {
	display: none;
	position: absolute;
	z-index: 10;
	text-align: center;
}

.dropdown-content a {
	display: block;
}

.dropdown:hover .dropdown-content {
	border: 1px solid wheat;
	background-color: white;
	display: block;
	margin-top: 2px;
	margin-left: 1%;
	padding: 25px;
}
/* 드롭다운 메뉴 끝 */
#menubar1 .search {
	display: inline-block;
}

/* 텍스트 슬라이드 */
.animated-text {
	color: rgb(0, 0, 0);
	padding: 0 40px;
	height: 30px;
	overflow: hidden;
}

.line {
	text-transform: uppercase;
	text-align: center;
	font-size: 1vw;
	line-height: 30px;
}

.line:first-child {
	animation: anim 12s infinite;
}

@
keyframes anim { 0% {
	margin-top: 0;
}

16
%
{
margin-top
:
-30px;
}
33
%
{
margin-top
:
-60px;
}
50
%
{
margin-top
:
-90px;
}
66
%
{
margin-top
:
-60px;
}
82
%
{
margin-top
:
-30px;
}
100
%
{
margin-top
:
0;
}
}
/* 텍스트 슬라이드 끝 */
#menubar2 {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div id="page_header">
	<div id="header_menu">
		<div id="header_menu_right">
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<a href="${pageContext.request.contextPath}/users/login">로그인</a>
					<a href="${pageContext.request.contextPath}/users/register">회원가입</a>
				</c:when>
				<c:otherwise>
					${sessionScope.user.username}님
					<a href="${pageContext.request.contextPath}/logoutProcess">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="header_menu_left">
			<a href="${pageContext.request.contextPath}/board/board_list">NOTICE</a>&nbsp;&nbsp;&nbsp;
			<c:if test="${sessionScope.user.username != 'admin'}">
			<c:if test="${sessionScope.user.username != null}">
				<a href="${pageContext.request.contextPath}/purchase/purchase_list">구매내역</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			</c:if>
		</div>
	</div>
	<div id="search">
		<section></section>
	</div>
	<div id="page_header_logo">
		<div class="logo_top">
			<a href="/"> <img src="${pageContext.request.contextPath}/images/cool20.png" width="167" height="97" /></a>
		</div>
	</div>
</div>


	<div id="menubar1">
		<div class="select"></div>
		<div id="menubar2">
			<a href="${pageContext.request.contextPath}/item/item_list">ITEMS</a>

		</div>


		<script type="text/javascript">
      
</script>
</body>
</html>