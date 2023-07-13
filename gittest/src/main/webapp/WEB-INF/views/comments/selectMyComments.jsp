<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 내역</title>
    <%-- CSS 및 JavaScript 파일 링크 등의 필요한 부분을 추가하세요. --%>
</head>
<body>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h1>예약 내역</h1>

	<c:if test="${vos1.size() != 0}">
		<table>
			<tr>
				<th colspan="2">
					<a href="selectAllReservation.do?user_id=${user_id}">예약내역</a>
					<a href="selectExpiredReservation.do?user_id=${user_id}">사용내역</a>
					<a href="selectCancelReservation.do?user_id=${user_id}">취소내역</a>
				</th>
			</tr>
		</table>
		<table>
			<c:forEach var="vo" items="${vos1}">
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td>
						<fmt:parseDate value="${vo.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
						<a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectOneReservation.do?id=${vo.id}&user_id=${user_id}">예약상세</a>
						<a href="cancelReservation.do?id=${vo.id}&user_id=${user_id}">예약 취소</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

    <%-- 기타 필요한 내용을 추가하세요. --%>
</body>
</html>
