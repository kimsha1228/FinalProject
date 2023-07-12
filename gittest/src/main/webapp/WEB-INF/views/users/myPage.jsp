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
	<h1><a href="myInfo.do">내 정보 관리</a></h1>
	<h1><a href="selectAllUserCoupon.do">쿠폰 페이지</a></h1>
	<h1><a href="selectAllPoint.do">포인트 페이지</a></h1>
	<h1><a href="selectAllCart.do?user_id=${user_id}">장바구니 페이지</a></h1>
	<h1><a href="selectAllReservation.do?user_id=${user_id}">액티비티 예약내역 페이지</a></h1>
	<h1><a href="selectMyComments.do">이용후기 페이지</a></h1>
	<h1><a href="selectAllUserContact.do">문의내역 페이지</a></h1>
	<h1><a href="logout.do">로그아웃 메인페이지</a></h1>
</body>
</html>