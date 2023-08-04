<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.outer {
	width: 60%;
	min-width: 650px;
	background: rgb(248, 249, 250);
	box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

#joinForm {
	width: 400px;
	margin: auto;
	padding: 10px;
}

#joinForm h1 {
	text-align: center;
}

.input_area {
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	background: white;
}

.input_area input:not([type=checkbox]) {
	width: 250px;
	height: 30px;
	border: 0px;
}

.btnArea {
	text-align: center;
	padding: 50px;
}

button {
	width: 100px;
	height: 35px;
	border: 0px;
	color: white;
	background: #282A35;
	margin: 5px;
}
</style>

</head>
<body>

	<div class="outer">
		<div id="joinInfoArea">
			<form id="joinForm" action="${pageContext.request.contextPath}/registerUser" method="post" name="frm" onsubmit="return validate();" required>
				<h1>회원 가입</h1>

				<h4>* 아이디</h4>
				<span class="input_area"> <input type="text" name="username" maxlength="13" id="username" placeholder="아이디 입력" required>
				</span> 
				<input type="button" name="user_IDcheck" maxlength="15" value="중복 확인" onclick="checkUsername()">

				<h4>* 비밀번호</h4>
				<span class="input_area"> <input type="password" name="password" maxlength="15" id="password" value="" required>
				</span>
				
				<!-- 
				<h4>* 비밀번호 확인</h4>
				<span class="input_area"> <input type="password" name="password2" maxlength="15" id="password2" value="" required>
				</span> <label id="pwdResult"></label>
				 -->
				<h4>* 이름</h4>
				<span class="input_area"> <input type="text" maxlength="5" name="p_name" id="p_name" value="" required>
				</span>

				<h4>* 생일</h4>
				<span class="input_area"> <input type='date' name='birth' required />
				</span>

				<h4>* 연락처</h4>
				<span class="input_area"> <input type="text" maxlength="11" name="pnum" id="pnum" placeholder="(-없이)01012345678" required>
				</span>

				<h4>* 성별</h4>
				<span class="input_area"> <select name="gender" required>
						<option value="">-- 선택 --</option>
						<option value="man">남자</option>
						<option value="woman">여자</option>
				</select>
				</span>

				<h4>우편번호</h4>
				<span class="input_area"><input type="text" name="address_num" class="postcodify_postcode5"></span>
				<button type="button" id="postcodify_search_button">검색</button>
				<h4>도로명주소</h4>
				<span class="input_area"><input type="text" name="address_road" class="postcodify_address"></span>
				<h4>상세주소</h4>
				<span class="input_area"><input type="text" name="address_detail" class="postcodify_details"></span>

				<div class="btnArea">
					<button class="submit1" type="submit" name="join" id="join">가입하기</button>
				</div>
			</form>
		</div>
	</div>

<script>
    function checkUsername() {
        let username = $("input[name='user_IDcheck']").val();
        if (username.length === 0) {
            alert("아이디를 다시 입력해주세요.");
            return;
        }
        // AJAX POST 요청을 보냅니다.
        $.ajax({
            url: "${pageContext.request.contextPath}/checkUsername",
            type: "POST",
            data: JSON.stringify({ username: username }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.exists) {
                    alert("이미 존재하는 아이디입니다.");
                } else {
                    alert("사용 가능한 아이디입니다.");
                }
            }
        });
    }
</script>

	
</body>
</html>