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
<script type="text/javascript">
$(function(){
	console.log("onload...");
	paymentSelectOne();
});//end onload...

function paymentSelectOne(){
	console.log('${param.id}');
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
			</tr>
			<tr>
				<th>예약일</th>
				<td>${vo1.res_date}</td>
			</tr>
			<tr>
				<th>예약수량</th>
				<td>${vo1.quantity}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${vo1.price}원</td>
			</tr>
		</tbody>

		<tfoot id="pay_info" text-align="right">
		</tfoot>
	</table>
</body>
</html>