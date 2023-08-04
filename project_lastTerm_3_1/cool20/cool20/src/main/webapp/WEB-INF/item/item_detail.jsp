<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Item Detail</title>
    <style>
        /* Reset CSS */
        body, h1, h2, h3, h4, h5, h6, p, ul, ol, li, img {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
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

        #container {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
        }

        #container h1 {
            font-size: 24px;
            font-weight: bold;
        }

        #container h2 {
            font-size: 20px;
        }

        #container p {
            font-size: 14px;
            line-height: 1.5;
        }

        #container img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        #container p.price {
            font-size: 18px;
            font-weight: bold;
            color: #f00;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        
        .container {
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}

		#container {
			text-align: center;
		}

		.item_image {
			max-width: 100%;
			height: auto;
			margin: 10px 0;
		}
    </style>
</head>
<body>
	<!-- Header -->
	<div class="page_header_wrapper">
		<jsp:include page="../global/page_header.jsp" flush="false" />
	</div>

	<jsp:useBean id="item" scope="request" type="com.tukorea.project_items.Item" />
	<div class="container">
		<div id="container">
			<form action="${pageContext.request.contextPath}/insertPurchase" method="post">
				<h1>Item Detail</h1>
				<input type="text" name="item_name" value="${item.name}" />
				<input type="text" name="item_id" value="${item.id}" />
				<input type="text" name="memo" value="${item.memo}" />
				<img class="item_image" src="${pageContext.request.contextPath}/${item.image}" alt="${item.name}">
				<input type="text" name="price" value="${item.price}"/>
				<c:if test="${sessionScope.user.username != 'admin'}">
					<!-- 구매하기 버튼 -->
					<c:if test="${sessionScope.user.username != null}">
						<button type="submit">구매하기</button>
					</c:if>
				</c:if>
			</form>
		</div>
	</div>

	<!-- JavaScript 코드 -->
	<script>
		function purchaseItem(name, id, price) {
			// 데이터를 JSON 형태로 구성
			var data = {
				itemName: name,
				itemId: id,
				itemPrice: price
			};

			// AJAX 요청으로 데이터 전달
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/purchase/purchase_list', true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.onreadystatechange = function () {
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
					// 요청이 성공한 경우에만 페이지 이동
					window.location.href = '/purchase/purchase_list';
				}
			};
			xhr.send(JSON.stringify(data));
		}
	</script>

	<style>
		.container {
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}

		#container {
			text-align: center;
		}

		.item_image {
			max-width: 100%;
			height: auto;
			margin: 10px 0;
		}
	</style>

	<!-- Footer -->
	<div class="page_footer_wrapper">
		<jsp:include page="../global/page_footer.jsp" flush="false" />
	</div>
</body>
</html>
