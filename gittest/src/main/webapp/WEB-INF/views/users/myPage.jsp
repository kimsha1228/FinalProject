<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="mypage">
	<h3>마이페이지</h3>
	<table id="mypagetable1">
		<tr id="mypagetable1_1">
			<td colspan="2">
				<img width="70px" height="70px" src="resources/uploadimg/${users.img}">
			</td>
		</tr>
		<tr id="mypagetable1_2">
			<td colspan="2">
				<a href="myInfo.do?user_id=${user.user_id}">내 정보 관리</a>
			</td>
		</tr>
		<tr id="mypagetable1_3">
			<td><a href="selectAllUserCoupon.do?user_id=${user.user_id}">쿠폰</a></td>
			<td><a href="myPoint.do?user_id=${user.user_id}">포인트</a></td>
		</tr>
	</table>
	
	<table id="mypagetable2">
		<tr>
			<td><a href="selectAllCart.do?user_id=${user.user_id}">장바구니</a></td>
		</tr>
		<tr>
			<td><a href="selectMyComments.do?user_id=${user.user_id}">이용 후기</a></td>
		</tr>
		<tr>
			<td><a href="selectAllReservation.do?user_id=${user.user_id}">예약 내역</a></td>
		</tr>
		<tr>
			<td><a href="selectAllUserContact.do?user_id=${user.user_id}">문의내역</a></td>
		</tr>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>