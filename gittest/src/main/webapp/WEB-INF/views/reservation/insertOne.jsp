<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload...");
	usersSelectOne();
	actSelectOne();
	userCouponSelectAll();

});//end onload...


	function usersSelectOne(){
	console.log('usersSelectOne()...');
		$.ajax({
	 		url : "jsonUsersSelectOne.do",
	 		data:{id:1},	//이 부분 세션 받아서 {user_id:{user_id}}로 바꿔줘야함 Mapper변경 잊지 말자
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vo2) {
				console.log(vo2);
				
	  			let tag_vo2 =  `
	  				<tr>
	 					<td colspan="2">예약자 정보</td>
	 				</tr>
	 				<tr>
	 					<td>여권상 영문명</td>
	 					<td>\${vo2.eng_name}</td>
	 				</tr>
	 				<tr>
	 					<td>전화번호</td>
 						<td>\${vo2.region} \${vo2.tel}</td>
	 				</tr>
	 				<tr>
 						<td>이메일</td>
	 					<td>\${vo2.email}</td>
	 				</tr>
	  				`;
				
	 			$("#vo2").html(tag_vo2);
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	}//end userSelectOne
	
	function actSelectOne(){
		$.ajax({
	 		url : "jsonActSelectOne.do",
	 		data:{id:$('#act_id').val()},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vo2) {
	 			let act_name =  `\${vo2.act_name}`;
	 			$("#act_name").html(act_name);
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	}//end userSelectOne
	
	function userCouponSelectAll(){
		$.ajax({
	 		url : "userCouponSelectAll.do",
	 		data:{id:$('#user_id').val()},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vos) {
	 			console.log('userCouponSelectAll', vos)
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	}//end userCouponSelectList
	
	
	
	
</script>
</head>
<body>
	<table border="1">
		<tbody id="vo2"></tbody> <!-- 이 부분에 유저 정보 얻어오기 -->
	</table>
	
<form action="InsertOneReservation.do" Method="get">
	<table>
		<tbody><!-- 이 부분이 상품 페이지에서 넘어와야할 부분... -->
			<tr>
				<td><input type="hidden" name="user_id" id = "user_id" value="john123">${user_id}</td><!-- 세션 연결되면 유저아이디 입력 -->
			</tr>
			<tr>	
				<td><input type="hidden" name="act_id" id = "act_id" value="${param.act_id}">상품명: <span id="act_name"></span></td>
			</tr>
			<tr>	
				<td><input type="hidden" name="res_date" id = "res_date" value="${param.res_date}">예약일: ${param.res_date}</td>
			</tr>
			<tr>	
				<td><input type="hidden" name="quantity" id = "quantity" value="${param.quantity}">수량: ${param.quantity}</td>
			</tr>
			<tr>	
				<td><input type="hidden" name="price" id = "price" value="${param.price*param.quantity}">금액: ${param.price*param.quantity}</td>
			</tr>
			<tr>	
<%-- 				<td><input type="hidden" name="price_total" id = "price_total" value="${param.price*param.quantity}">총 금액: ${param.price*param.quantity}</td> --%>
				<td><input type="hidden" name="price_final" id = "price_final" value="${param.price*param.quantity}">총 금액: ${param.price*param.quantity}</td>
			</tr>
			<tr>	
				<td><input type="submit" value="예약하기"></td>
			<tr>	
<!-- 더미 테스트 -->
<!-- 			<tr> -->
<!-- 				<td><input type="hidden" name="act_id" id = "act_id" value="8">상품명: <span id="act_name"></span></td> -->
<!-- 				<td><input type="hidden" name="res_date" id = "res_date" value="2023-12-28">예약일: 2023-12-28</td> -->
<%-- 				<td><input type="hidden" name="quantity" id = "quantity" value="${param.quantity}">수량: ${param.quantity}</td> --%>
<%-- 				<td><input type="hidden" name="price" id = "price" value="${param.price}">가격: ${param.price}</td> --%>
<%-- 				<td><input type="hidden" name="price_final" id = "price_final" value="">총 금액: ${param.price*param.quantity}</td>	<!-- 총 금액에 ${'#quantity'}.val()*${'#price'}.val() 이 값을 넣고 싶은데...--> --%>
<!-- 			</tr> -->
		</tbody>
	</table>
<!--  	<button onclick="res_total()">결제하기</button> -->
</form>

<table>

	<tbody id="user_coupon"></tbody>

</table>


</body>
</html>