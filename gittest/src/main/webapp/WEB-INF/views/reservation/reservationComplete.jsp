<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationComplete</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	console.log("onload...");
	actSelectOne();
	paymentSelectOne();
});//end onload...

function actSelectOne(){
	$.ajax({
 		url : "jsonActSelectOne.do",
 		data:{id:${param.act_id}},
 		method:'GET',
 		dataType:'json', 
 		success : function(vo) {
 			let act_name =  `\${vo.act_name}`;
 			$("#act_name").html(act_name);
 		},
 		error:function(xhr,status,error){
 			console.log('xhr.status:', xhr.status);
 		}
 	});//end $.ajax()...
}//end actSelectOne

function paymentSelectOne(){
	console.log('${param.res_id}');
	$.ajax({
 		url : "jsonPaymentSelectOne.do",
 		data:{res_id:'${param.res_id}'},
 		method:'GET',
 		dataType:'json', 
 		success : function(vo) {
 			let pay_info =  '';
 			pay_info += `
 				<tr>
					<th>결제 상세 정보</th>
				</tr>
				<tr>
					<td>포인트 사용 금액</td>
					<td>(-)\${vo.point}원</td>
				</tr>
				<tr>
					<td>쿠폰 사용 금액</td>
					<td>(-)\${vo.coupon}원</td>
				</tr>
				<tr>
					<td>최종 결제 금액</td>
					<td>\${vo.price_final}원</td>
				</tr>
 			`;
 			$("#pay_info").html(pay_info);
 		},
 		error:function(xhr,status,error){
 			console.log('xhr.status:', xhr.status);
 		}
 	});//end $.ajax()...
}//end actSelectOne

</script>	


</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3>결제 완료</h3>
	<table>
	<tr>
		<th><a href="home.do">메인페이지로</a></th>
		<th><a href="selectAllReservation.do">예약 내역 페이지로</a></th>
	</tr>
	</table>
	<hr>

	<table>
		<tr>
			<th>예약 상세 정보</th>
		</tr>
		<tr>
			<td>상품명</td>
			<td id="act_name"></td>
		</tr>
		<tr>
			<td>예약일</td>
			<td>${param.res_date}</td>
		</tr>
		<tr>
			<td>예약수량</td>
			<td>${param.quantity}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${param.price}원</td>
		</tr>
		<tr>
			<td>총 금액</td>
			<td>${param.price_total}원</td>
		</tr>
	</table>
	<hr>
	<table>
		<tbody id="pay_info">
		</tbody>
	</table>
</body>
</html>
