<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
<ul>
<!-- 	<li><a href="reservationMany.do">예약하기</a></li> -->
<!-- 	<li><a href="cancelReservation.do?id=2">예약취소</a></li> -->
<!-- 	<li><a href="insertOneReservation.do?act_id=5&res_date=2023-10-31&quantity=5&price=50000">예약하기</a></li> -->
	<li><a href="insertOneReservation.do?act_id=15&res_date=2023-12-28&quantity=2&price=150000">예약하기</a></li>
	<li><a href="selectAllReservation.do?user_id=john123">예약 내역 페이지로</a></li>
<!-- 	<li><a href="selectOnepayment.do?user_id=john123">결제 상세 정보</a></li> -->
	
	<li><a href="selectAllReservation.do?user_id=${user_id}">예약 내역 페이지로(세션)</a></li>
<!-- 	<li><a href="selectOnepayment.do?user_id=john123">결제 상세 정보</a></li> -->
<!--   <li><a href="selectAllWishList.do?user_id=john123">위시리스트</a></li> -->
</ul>
	<form action="selectAllReservation.do" method="POST">
		<table>
			<tr>
				<td><input type="hidden" name="user_id" value="${user_id}">
				<input type="submit"  value="예약내역보기">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
