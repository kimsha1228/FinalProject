<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../admin_top.jsp"></jsp:include>
	<div id="list01">
	<div id="list1">
		<ul>
			<li><a href="insertAct.do">상품등록</a></li>
			<li><a href="selectAllAct.do">상품목록</a></li>
			<li><a href="insertRoute.do">루트등록</a></li>
			<li><a href="selectAllRoute.do">루트목록</a></li>
			<li><a href="selectAllCoupon.do">쿠폰목록</a></li>
		</ul>
	</div>
	<div id="list1">
		<ul>	
			<li><a href="selectAllContact.do?seller_id=${user.user_id}">문의글목록</a></li>
			<li><a href="selectAllSeller.do">판매자목록</a></li>
			<li><a href="selectAllUser.do">회원목록</a></li>
			<li><a href="selectAllFaq.do">고객센터</a></li>
		</ul>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>