<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<table id="commentsList">
        <thead>
            <tr>
                <th>act_id</th>
                <th>id</th>
                <th>rate</th>
                <th>content</th>
                <th>com_date</th>
                <th>likes</th>
                <th>user_id</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty vo2}">
                <tr>
                    <td>${vo2.act_id}</td>
                    <td>${vo2.id}</td>
                    <td>${vo2.rate}</td>
                    <td>${vo2.content}</td>
                    <td>${vo2.com_date}</td>
                    <td>${vo2.likes}</td>
                    <td>${vo2.user_id}</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>
