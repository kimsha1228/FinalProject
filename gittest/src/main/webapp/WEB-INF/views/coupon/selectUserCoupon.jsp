<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>나의 포인트</h1>
	
	<div><h3>현재 포인트 ${vo.point}</h3></div>
	<table>
		<tr>
			<th>쿠폰이름</th>
			<td><input type="text" name="name" value="" placeholder="10% off 두 자리 숫자 맨앞 기입" size="30"></td>
		</tr>
		<tr>
			<th>쿠폰코드</th>
			<td><input type="text" name="code" value="" placeholder="couponcode" size="30"></td>
		</tr>
		<tr>
			<th>사용기한</th>
			<td><input type="text" name="expire" value="" placeholder="2099-12-31 형식으로 등록" size="30"></td>
		</tr>
	</table>
		<input type="submit" value="쿠폰등록">
</body>
</html>