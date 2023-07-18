<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="resform">
	<h3>예약내역</h3>

	<table id="selectmenu">
	<tr>
		<th colspan="2">
			<a href="selectAllReservation.do?user_id=${user.user_id}">예약내역</a>
			<a href="selectExpiredReservation.do?user_id=${user.user_id}">사용내역</a>
			<a href="selectCancelReservation.do?user_id=${user.user_id}">취소내역</a>
		</th>
	</tr>
	</table>
					
		<c:if test="${vos1.size()!=0}">
			<c:forEach var="vo" items="${vos1}">
				<table id="reoktable">
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
					<td rowspan="3">
						<img width="70px" height="70px"src="resources/uploadimg/thumb_${vo.img_name}"/>
					</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td><fmt:parseDate value="${vo.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td id="resname"><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
					
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectOneReservation.do?id=${vo.id}&user_id=${user.user_id}">예약상세</a>
						<a href="cancelReservation.do?id=${vo.id}&user_id=${user.user_id}">예약 취소</a>
					</td>
				</tr>
			</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos1.size()==0}">
		<table id="nores">
			<tr>
				<td>예약한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllUserAct.do" class="myButton">예약하러 가기</a></td>
			</tr>
			</table>
		</c:if>
		
		<c:if test="${vos3.size()!=0}">
			<c:forEach var="vo3" items="${vos3}">
			<table id="reexptable">
				<tr>
					<th>예약번호</th>
					<td>${vo3.id}</td>
					<td rowspan="3">
						<img width="70px" height="70px"src="resources/uploadimg/thumb_${vo3.img_name}"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td id="resname"><a href="selectOneUserAct.do?id=${vo3.act_id}">${vo3.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectOneExpiredReservation.do?id=${vo3.id}&user_id=${user.user_id}">예약상세</a>
					</td>
				</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos3.size()==0}">
		<table id="nores">
			<tr>
				<td>사용한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=${user.user_id}" class="myButton">예약내역 보기</a></td>
			</tr>
			</table>
		</c:if>
		
		<c:if test="${vos2.size()!=0}">
			<c:forEach var="vo2" items="${vos2}">
			<table id="recantable">
				<tr>
					<th>취소번호</th>
					<td>${vo2.id}</td>
					<td rowspan="3">
						<img width="70px" height="70px"src="resources/uploadimg/thumb_${vo2.img_name}"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td id="resname"><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectOneCancelReservation.do?id=${vo2.id}&user_id=${user.user_id}">취소상세</a>
					</td>
				</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos2.size()==0}">
		<table id="nores">
			<tr>
				<td>취소한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=${user.user_id}" class="myButton">예약내역 보기</a></td>
			</tr>
			</table>
		</c:if>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>