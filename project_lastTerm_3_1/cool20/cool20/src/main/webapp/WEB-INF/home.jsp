<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싸고 예쁜 쇼핑몰 쿨20</title>
<style>
#wrap {
	width: 80%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.page_header_wrapper, .page_footer_wrapper {
	width: 100%;
}

#page_content {
	text-align: center;
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.slides {
  position: relative;
  width: 100%;
  height: 600px;
  overflow: hidden;
}

.slide-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
}

.slide {
  flex-shrink: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity .7s ease-in-out;
}

.slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.nav-dots {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}

.nav-dot {
  width: 12px;
  height: 12px;
  margin: 0 6px;
  background-color: #aaa;
  border-radius: 50%;
  cursor: pointer;
  transition: background-color .3s ease-in-out;
}

.nav-dot.active {
  background-color: #333;
}</style>
</head>
<body>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<div class="page_header_wrapper">
			<jsp:include page="global/page_header.jsp" flush="false" />
		</div>

		<!-- page_content -->
		<div id="page_content">
			<div class="slides">
				<input type="radio" name="radio-btn" id="img-1" checked /> <input
					type="radio" name="radio-btn" id="img-2" /> <input type="radio"
					name="radio-btn" id="img-3" />

				<div class="slide-container">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/images/anrak.jpg"
							alt="이미지 1" style="width: 100%; height: 100%;" />
					</div>
					<div class="slide">
						<img src="${pageContext.request.contextPath}/images/bamak.jpg"
							alt="이미지 2" style="width: 100%; height: 100%;" />
					</div>
					<div class="slide">
						<img
							src="${pageContext.request.contextPath}/images/pullupblack_set.jpg"
							alt="이미지 3" style="width: 100%; height: 100%;" />
					</div>
				</div>

				<div class="nav-dots">
					<label for="img-1" class="nav-dot"></label> <label for="img-2"
						class="nav-dot"></label> <label for="img-3" class="nav-dot"></label>
				</div>
			</div>
		</div>

		<!-- page_footer 삽입 위치 -->
		<div class="page_footer_wrapper">
			<jsp:include page="global/page_footer.jsp" flush="false" />
		</div>
	</div>
</body>
</html>
