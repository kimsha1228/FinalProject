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
				
	  			let point = '';
	  			if(vo2.point===0) $("#pointbox").hide();
	  			point += `<div>보유 포인트: <span id="user_point">\${vo2.point}</span>원<div>`;
// 	  			point += `<input type="number" id="using_point" value="">`;

	 			$("#vo2").html(tag_vo2);
	 			$("#having_point").html(point);

	 			$(".using_point_input").on("propertychange change keyup paste input", function(){
	 				console.log("using_point_input...keyup",`\${vo2.point}`,$(this).val());
	 				const maxPoint = parseInt(`\${vo2.point}`);
					let inputValue = parseInt($(this).val());	
					if(inputValue < 0){
						$(this).val(0);
					} else if(inputValue > maxPoint){
						$(this).val(maxPoint);
					}	
					
				});
					  			
	 			$(".using_point_input_btn").on("click", function(){
	 				console.log("using_point_input_btn...",`\${vo2.point}`);

	 				const maxPoint = parseInt(`\${vo2.point}`);	
 					console.log("maxPoint...",maxPoint);
	 				
	 				let state = $(this).data("state");	
	 				
	 				if(state == 'N'){
	 					console.log("n동작");
	 					/* 모두사용 */
	 					//값 변경
	 					$(".using_point_input").val(maxPoint);
	 					//글 변경
	 					$(".using_point_input_btn_Y").css("display", "inline-block");
	 					$(".using_point_input_btn_N").css("display", "none");
	 				} else if(state == 'Y'){
	 					console.log("y동작");
	 					/* 취소 */
	 					//값 변경
	 					$(".using_point_input").val(0);
	 					//글 변경
	 					$(".using_point_input_btn_Y").css("display", "none");
	 					$(".using_point_input_btn_N").css("display", "inline-block");		
	 				}	
	 				
	 			});	  			
	  				
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
	 		data:{user_id:$('#user_id').val()},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vos) {
	 			console.log('userCouponSelectAll', vos)
	 			
	 			let coupon = '';
				
	 			let discount = '';

	 			if(vos==0){
					coupon += `보유한 쿠폰이 없습니다`;
				} else{
		 			coupon += `<select class="coupon-select">`;
		 			coupon += `<option selected disabled>쿠폰을 선택해주세요</option>`;
		 			coupon += `<option value="0">쿠폰 사용 안함</option>`;
	 				$.each(vos, function(index, vo){
 						coupon += `<option value="\${vo.couponcode}">\${vo.name}</option>`;
					});
		 			coupon += "</select>";
		 			
		 			discount += `<div>쿠폰 할인 금액: <span id="discountPrice">0</span>원</div>`;
				}
					
	 			$("#coupon").html(coupon);
	 			$("#discount").html(discount);
	 			
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	 	
	 	let originalPrice = $("#price_total").val();
	 	
		$("#coupon").change(function(){
			
			
			if($(".coupon-select option:selected").val()=='0'){
// 				$("#discount").hide();
				let discount_final = $("#price_total").val();
				$("#discount_final").html(discount_final);
				$("#price_final").val(discount_final);
			} else {
				$("#discount").show();
			 	let discountRate = $(".coupon-select option:selected").text().slice(0,1).trim();
				let discountPrice = Math.floor(originalPrice*(discountRate/100)/10)*10;
				let finalPrice = originalPrice-discountPrice;
				let couponNo = $("select").val();
				$("#discountPrice").html("<span style=\"color:blue;\">"+discountPrice+"</span>");
				$("#discount_final").html(finalPrice+"원");
// 				$("input[name=price_final]").val(finalPrice);
			}
		})	 
	}//end userCouponSelectList
	
	//포인트도 갖다 주기.........................
	
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
				<td><input type="hidden" name="price" id = "price" value="${param.price}">금액: ${param.price}</td>
			</tr>
			<tr>	
				<td><input type="hidden" name="price_final" id = "price_final" value=""></td>
				<td><input type="hidden" name="point" id = "point" value=""></td>
			</tr>
			<tr>	
				<td id="discount_method"></td>
			</tr>
			<tr>	
<!-- 				<td><input type="submit" value="예약하기"></td> -->
			<tr>	
		</tbody>
	</table>
<!--  	<button onclick="res_total()">결제하기</button> -->
</form>

<table border="1">

	<tbody>
		<tr>
			<td>
				<input type="hidden" name="price_total" id = "price_total" value="${param.price*param.quantity}">총 금액: ${param.price*param.quantity}
			</td>
		</tr>
		<tr><!-- 쿠폰 select -->
			<td id="coupon">
				
			</td>
		</tr>
		<tr><!-- 쿠폰 할인 금액 -->
			<td id="discount">
			</td>
		</tr>
		<tr id="pointbox"><!-- 포인트 사용 금액 -->
			<td id="having_point">
			</td>
		</tr>
		<tr>
			<td>
				<input class="using_point_input" value="">원 
				<a class="using_point_input_btn using_point_input_btn_N" data-state="N">모두사용</a>
				<a class="using_point_input_btn using_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
				
			</td>
		</tr>
		<tr> <!-- 최종 결제 금액 -->
			<td>최종 결제 금액: <span id="discount_final"></span>
			</td>
		</tr>
		
	</tbody>

</table>


</body>
</html>