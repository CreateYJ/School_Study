<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', snas-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: url("whiteback.png") no-repeat center;
	background-size: cover;
}

body::befor {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, .7);
}

.login-form {
	position: relative;
	z-index: 2;
}

.login-form h1 {
	font-size: 32px;
	color: black;
	text-align: center;
	margin-bottom: 60px;
}

.int-area {
	width: 400px;
	position: relative;
	margin-top: 20px;
}

.int-area:first-child {
	margin-top: 0;
}

.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid #999;
	font-size: 18px;
	color: #000;
	outline: none;
}

.int-area label {
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: all .5s ease;
}

.int-area label.warning {
	animation: warning .3s ease;
	animation-iteration-count: 3;
}

@
keyframes warning { 0% {
	transform: translateX(-8px);
}

25
%
{
transform
:
translateX(
8px
);
}
50
%
{
transform
:
translateX(
-8px
);
}
75
%
{
transform
:
translateX(
8px
);
}
}
.int-area input:focus+label, .int-area input:valid+label {
	top: -2px;
	font-size: 13px;
	color: #166cea;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 100%;
	height: 50px;
	background: #166cea;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.caption {
	margin-top: 20px;
	text-align: center;
}

.caption a {
	font-size: 15px;
	color: #999;
	text-decoration: none;
}
</style>
</head>
<body>


	<div id="wrap">


		<section class="login-form">
			<h1>LOGIN</h1>
			<form method="post"
				action="${pageContext.request.contextPath}/loginProcess"
				id="login-form">
				<div class="int-area">
					<input type="text" name="username" id="user" autocomplete="on"
						required> <label for="id">USER NAME</label>
				</div>
				<div class="int-area">
					<input type="password" name="password" id="password"
						autocomplete="off" required> <label for="pw">PASSWORD</label>
				</div>
				<div class="btn-area">
					<button type="submit">LOGIN</button>
				</div>
				<div class="caption">
					<a href="${pageContext.request.contextPath}/users/register">계정이 없으신가요?</a>
				</div>
			</form>
		</section>

		<script>
			let id = $('#id');
			let pw = $('#pw');
			let btn = $('#btn');

			$(btn).on('click', function() {
				if ($(id).val() == "") {
					$(id).next('label').addClass('warning');
					setTimeout(function() {
						$('label').removeClass('warning');
					}, 1500);
				} else if ($(pw).val() == "") {
					$(pw).next('label').addClass('warning');

				}
			});
		</script>


	</div>
</body>
</html>