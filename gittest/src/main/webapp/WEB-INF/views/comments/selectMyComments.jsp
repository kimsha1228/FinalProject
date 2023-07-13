<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Comments</title>
</head>
<body>
	<h1>내 이용 후기</h1>
	<a href="selectAllComments.do?user_id=${param.user_id}">전체 후기 보기</a>
	<br>
</body>
</html>