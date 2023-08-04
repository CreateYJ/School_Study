<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>게시판 수정</title>
    <style>
        /* 스타일링 예시 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            resize: vertical;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <c:if test="${sessionScope.user.username == 'admin'}">
        <div class="container">
            <h1>게시판 수정</h1>
            <form action="${pageContext.request.contextPath}/board_edit/${board.board_seq}" method="POST">
                <input type="hidden" name="board_seq" value="${board.board_seq}" />
                <label for="title">제목:</label>
                <input type="text" name="title" value="${board.title}" />
                <label for="writer">작성자:</label>
                <input type="text" id="writer" name="writer" value="${board.writer}" readonly /><br>
                <label for="contents">내용:</label>
                <textarea id="contents" name="contents">${board.contents}</textarea><br>
                <input type="submit" value="수정" />
            </form>
        </div>
    </c:if>
    <c:if test="${sessionScope.user.username != 'admin'}">
        <h1>권한이 없습니다.</h1>
    </c:if>
</body>
</html>
