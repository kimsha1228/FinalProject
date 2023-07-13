<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>마이페이지</h1>
	<table id="usersList">
		<tr>
			<td><img width="50px" src="resources/uploadimg/${users.img}">
				<a href="myInfo.do?user_id=sss">내 정보 관리</a>
			</td>
		</tr>
		<tr>
			<td><a href="selectAllCoupon.do">쿠폰</a></td>
			<td><a href="selectAllPointHistory.do">포인트</a></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td><a href="selectAllCart.do?user_id=john123">장바구니</a></td>
		</tr>
		<tr>
			<td><a href="#">이용 후기</a></td>
		</tr>
		<tr>
			<td><a href="selectAllReservation.do?user_id=john123">예약 내역</a></td>
		</tr>
		<tr>
			<td><a href="#">문의내역</a></td>
		</tr>
	</table>
</body>
</html>