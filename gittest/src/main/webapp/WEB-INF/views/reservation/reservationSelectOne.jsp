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
<script type="text/javascript">
$(function(){
	console.log("onload...");
	paymentSelectOne();
});//end onload...

function paymentSelectOne(){
	console.log('${vo1.id}');
	$.ajax({
 		url : "jsonPaymentSelectOne.do",
 		data:{res_id:'${param.id}'},
 		method:'GET',
 		dataType:'json', 
 		success : function(vo) {
 			let pay_info =  '';
 			pay_info += `
 				<tr>
					<th colspan="2">결제 상세 정보</th>
				</tr>
				<tr>
					<th>총 금액</th>
					<td>\${vo.price_total}원</td>
				</tr>
				<tr>
					<th>포인트 사용 금액</th>
					<td>(-)\${vo.point}원</td>
				</tr>
				<tr>
					<th>쿠폰 사용 금액</th>
					<td>(-)\${vo.coupon}원</td>
				</tr>
				<tr>
					<th>최종 결제 금액</th>
					<td>\${vo.price_final}원</td>
				</tr>
 			`;
 			$("#pay_info").html(pay_info);
 		},
 		error:function(xhr,status,error){
 			console.log('xhr.status:', xhr.status);
 		}
 	});//end $.ajax()...
}//end paymentSelectOne

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>reservationSelectOne</h1>
	
	<table>
		<tr>
			<th colspan="2">
				<a href="selectAllReservation.do?user_id=${user.user_id}">예약내역</a>
				<a href="selectExpiredReservation.do?user_id=${user.user_id}">사용내역</a>
				<a href="selectCancelReservation.do?user_id=${user.user_id}">취소내역</a>
			</th>
		</tr>
	</table>
	
	<table border="1">
		<tbody>
			<tr>
				<th colspan="2">예약 상세 정보</th>
			</tr>
			<tr>
				<th>예약번호</th>
				<td>${vo1.id}</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><a href="selectOneAct.do?id=${vo1.act_id}">${vo1.act_name}</a></td>
				<img src="resources/uploadimg/thumb_${vo1.img_name}"/>
			</tr>
			<tr>
				<th>예약일</th>
				<td><fmt:parseDate value="${vo1.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
				</td>
			</tr>
			<tr>
				<th>예약수량</th>
				<td>${vo1.quantity}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><fmt:formatNumber value="${vo1.price}" pattern="#,### 원" /></td>
			</tr>
		</tbody>

		<tbody id="pay_info">
		</tbody>
		<tr>
			<th colspan="2">
			<a href="cancelReservation.do?id=${vo1.id}&user_id=${user.user_id}">예약취소</a>
			</th>
		</tr>
	</table>
	
</body>
</html>