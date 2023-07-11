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



<!-- 	<table border="1"> -->
		<c:if test="${vos1.size()!=0}">
<!-- 			<form action="selectAllReservation.do" method="POST"> -->
<%-- 				<input type="hidden" name="user_id" id="user_id" value="${user_id}"> --%>
<!-- 				<input type="submit" value="예약내역"> -->
<!-- 			</form> -->
<!-- 			<form action="selectCancelReservation.do" method="POST"> -->
<%-- 				<input type="hidden" name="user_id" id="user_id" value="${user_id}"> --%>
<!-- 				<input type="submit" value="취소내역"> -->
<!-- 			</form> -->
			<table>
			<tr>
			<th colspan="2">
			<a href="selectAllReservation.do?user_id=${user_id}">예약내역</a>
			<a href="selectCancelReservation.do?user_id=${user_id}">취소내역</a>
			</th>
			</tr>
			</table>
			<c:forEach var="vo" items="${vos1}">
					
				<table>
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
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
					<td colspan="2">
						<a href="selectOneReservation.do?id=${vo.id}&user_id=${user_id}">예약상세</a>
						<a href="cancelReservation.do?id=${vo.id}&user_id=${user_id}">예약 취소</a>
					</td>
				</tr>
			</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos1.size()==0}">
<!-- 			<form action="selectAllReservation.do" method="POST"> -->
<%-- 				<input type="hidden" name="user_id" id="user_id" value="${user_id}"> --%>
<!-- 				<input type="submit" value="예약내역"> -->
<!-- 			</form> -->
<!-- 			<form action="selectCancelReservation.do" method="POST"> -->
<%-- 				<input type="hidden" name="user_id" id="user_id" value="${user_id}"> --%>
<!-- 				<input type="submit" value="취소내역"> -->
<!-- 			</form> -->
		<table>
			<tr>
				<td>예약한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="home.do">예약하러 가기</a></td>
			</tr>
			</table>
		</c:if>
		<c:if test="${vos2.size()!=0}">
			<c:forEach var="vo2" items="${vos2}">
			<table>
				<tr>
					<th>취소번호</th>
					<td>${vo2.id}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectOneCancelReservation.do?id=${vo2.id}&user_id=${user_id}">취소상세</a>
					</td>
				</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos2.size()==0}">
		<table>
			<tr>
				<td>취소한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=${user_id}">예약내역 보기</a></td>
			</tr>
			</table>
		</c:if>
<!-- 	</table> -->
	
</body>
</html>