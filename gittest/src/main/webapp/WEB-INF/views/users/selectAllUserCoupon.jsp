<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div id="usercoupon">
	<h3>내 쿠폰</h3>
    <form action="userCoupon_insertOK.do">
	<table id="usercoupontable1">
		<tr>
<!-- 			<th>쿠폰코드</th> -->
			<td><input type="hidden" name="user_id" value="${user.user_id}">
				<input type="text" name="couponcode" value="" placeholder="coupooncode" size="30"></td>
	      	<td><input type="submit" value="쿠폰등록" class="myButton"></td>
		</tr>
	</table>	
	</form>
	
	<table id="usercoupontable2">
		<tr>
			<td>쿠폰이름</td>
			<td>쿠폰코드</td>
			<td>사용기한</td>
		</tr>
	<c:forEach var="vos" items="${vos}">
		<tr>
			<td>${vos.name}</td>
			<td>${vos.code}</td>
			<td><fmt:formatDate value="${vos.expire}" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>