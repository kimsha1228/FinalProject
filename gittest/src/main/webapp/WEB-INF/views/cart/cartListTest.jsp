<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>장바구니</h1>
		<table>
		<c:if test="${not empty cartList}">
			<c:forEach items="${cartList}" var="cart">
				<form action='#' id='Cart' method='GET'>
					<table>
						<tr>
							<td><input type="checkbox" name="selectedActivities" value="${cart.id}"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><a href="selectOneUserAct.do?id=${cart.act_id}">
								<input type="hidden" name="id" value="${cart.id}"><!-- 세션 -->
								<input type="hidden" name="user_id" value="john123"><!-- 세션 -->
								<input type="hidden" name="act_id" value="${cart.act_id}">${cart.act_name}</a>
							</td>
							
						</tr>
						<tr>
							<th>예약예정일</th>
							<td><input type="hidden" name="res_date" value="${cart.res_date}">${cart.res_date}</td>
						</tr>
						<tr>
							<th>수량</th>
							<!-- 수량 -/+ 버튼 설정 updateOneCart 연결 -->
							<td><input type="hidden" name="quantity" value="${cart.quantity}">${cart.quantity}</td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="hidden" name="price" value="${cart.price}">${cart.price}</td>
						</tr>
						<tr>
							<th>총 금액</th>
							<td>${cart.price*cart.quantity}</td>
						</tr>
						<tr>
							<td><input type="submit" form="Cart" formaction="insertOneReservation.do" value="바로구매"></td>
							<td><input type="submit" form="Cart" formaction="deleteOneCart.do" value="삭제"></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</c:if>
	</table>

	<c:if test="${empty cartList}">
		<p>장바구니에 담긴 상품이 없습니다.</p>
	</c:if>
</body>
</html>
