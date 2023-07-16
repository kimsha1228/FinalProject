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
	<h1>reservationSelectAll</h1>

		<c:if test="${vos.size()!=0}">
			<table>
			<tr>
			<th colspan="2">
			<a href="selectMyComments.do?user_id=${user_id}">작성 가능한 후기</a>
			<a href="selectMyWrittenComments.do?user_id=${user_id}">내가 쓴 후기</a>
			</th>
			</tr>
			</table>
			<c:forEach var="vo" items="${vos}">
					
				<table>
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td><fmt:parseDate value="${vo.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="insertComments.do?act_id=${vo.act_id}&user_id=${user_id}&res_id=${vo.id}">후기 작성</a>
					</td>
				</tr>
			</table>
			</c:forEach>
		</c:if>
	
		<c:if test="${vos.size()==0}">
		<table>
			<tr>
				<td>후기를 쓸 수 있는 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=${user_id}">예약내역 보기</a></td>
			</tr>
			</table>
		</c:if>	
		
		<c:if test="${vos1.size()!=0}">
			<c:forEach var="vo1" items="${vos1}">
				<table>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo1.act_id}">${vo1.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectMyOneComments.do?res_id=${vo1.res_id}&user_id=${user_id}">후기 상세</a>
					</td>
				</tr>
			</table>
			</c:forEach>
		</c:if>
	
		<c:if test="${vos1.size()==0}">
		<table>
			<tr>
				<td>작성한 후기가 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectMyComments.do?user_id=${user_id}">후기 작성하러 가기</a></td>
			</tr>
			</table>
		</c:if>	
	
</body>
</html>