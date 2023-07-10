<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationComplete</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3>취소가 완료되었습니다!</h3>	
	<a href="selectAllReservation.do?user_id=${user_id}">예약내역 보기</a>
	<a href="selectCancelReservation.do?user_id=${user_id}">취소내역 보기</a>
	
		<form action="selectAllReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="예약내역">
		</form>
		<form action="selectCancelReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="취소내역">
		</form>
</body>
</html>
