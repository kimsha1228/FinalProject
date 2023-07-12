<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationFail</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3>예약 실패했습니다...</h3>
	<a href="selectAllReservation.do?user_id=${user_id}">예약 내역 페이지로</a>
	<a href="selectAllReservation.do?user_id=${user_id}">예약내역 보기</a>

</body>
</html>
