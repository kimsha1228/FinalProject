<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationComplete</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>reservationSelectAll</h1>



	<table border="1">
		<c:if test="${vos1.size()!=0}">
			<form action="selectAllReservation.do">
				<!-- 세션 연결되면 ${user_id}로 변경 -->
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="예약내역">
			</form>
			<form action="selectCancelReservation.do">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="취소내역">
			</form>
			<c:forEach var="vo" items="${vos1}">
				<tr>
					<th>예약번호</th>
					<td><a
						href="selectOneReservation.do?id=${vo.id}&user_id=${user_id}">${vo.id}</a></td>
					<!-- 여기도 세션 처리 -->
				</tr>
				<tr>
					<th>예약일</th>
					<td>${vo.res_date}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2"><a
						href="selectOneReservation.do?id=${vo.id}&user_id=${user_id}">예약상세</a>
						<a href="cancelReservation.do?id=${vo.id}&user_id=${user_id}">예약
							취소</a></td>
					<!-- 세션 -->
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${vos1.size()==0}">
			<form action="selectAllReservation.do">
				<!-- 세션 연결되면 ${user_id}로 변경 -->
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="예약내역">
			</form>
			<form action="selectCancelReservation.do">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="취소내역">
			</form>
			<tr>
				<td>예약한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="home.do">예약하러 가기</a></td>
			</tr>
		</c:if>
		<c:if test="${vos2.size()!=0}">
			<c:forEach var="vo2" items="${vos2}">
				<tr>
					<th>취소번호</th>
					<td><a
						href="selectOneCancelReservation.do?id=${vo2.id}&user_id=${user_id}">${vo2.id}</a></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${vos2.size()==0}">
			<tr>
				<td>취소한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=john123">예약내역 보기</a></td>
				<!-- 세션 연결되면 아이디 바꾸기 -->
			</tr>
		</c:if>
	</table>
</body>
</html>