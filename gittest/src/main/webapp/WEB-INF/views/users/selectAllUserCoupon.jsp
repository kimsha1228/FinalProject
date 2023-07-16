<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>쿠폰</h1>
    <form action="userCoupon_insertOK.do">
	<table>
		<tr>
			<th>쿠폰코드</th>
			<td><input type="hidden" name="user_id" value="john123"><!-- 여기 나중에 세션으로 변경 -->
			<input type="text" name="couponcode" value="" placeholder="coupooncode" size="30"></td>
	      	<td><input type="submit" value="쿠폰등록"></td>
		</tr>
	</table>	
	</form>
	
	<table border="1">
		<tr>
			<th>쿠폰이름</th>
			<th>쿠폰코드</th>
			<th>사용기한</th>
		</tr>
	<c:forEach var="vos" items="${vos}">
		<tr>
			<td>${vos.name}</td>
			<td>${vos.code}</td>
			<td>${vos.expire}</td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>