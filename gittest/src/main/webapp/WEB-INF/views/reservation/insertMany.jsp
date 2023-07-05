<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

// $(function(){
// 	console.log("onload...");
// 	$.ajax({
// 		url : "jsonUserSelectOne.do",
// 		data:{user_id:${user_id}},
// 		method:'GET',
// 		dataType:'json', 
// 		success : function(vo2) {
			
//  			let tag_vo2 =  `
//  				<tr>
// 					<td>예약자 정보</td>
// 				</tr>
// 				<tr>
// 					<td>여권상 영문명</td>
// 					<td>\${vo2.eng_name}</td>
// 				</tr>
// 				<tr>
// 					<td>전화번호</td>
// 					<td>\${vo2.tel}</td>
// 				</tr>
// 				<tr>
// 					<td>이메일</td>
// 					<td>\${vo2.email}</td>
// 				</tr>
//  				`;
			
// 			$("#vo2").html(tag_vo2);
// 		},
// 		error:function(xhr,status,error){
// 			console.log('xhr.status:', xhr.status);
// 		}
// 	});//end $.ajax()...



// });//end onload...

	function res_total(event){
		console.log("res_total()..."+$('#quantity'+0).val());
// 		let quantity = $('#quantity'+0).val();
		
		let datas = "1,10000,2023-07-30:"; //이 부분 반복문 돌리기
		datas += "3,10000,2023-07-30:";
		datas += "4,10000,2023-07-30";
		location.href = "InsertManyReservation.do?datas="+datas;
	}
</script>
</head>
<body>
<!-- 	<table> -->
<!-- 	<tbody id="vo2"></tbody> -->
<!-- 	</table> -->

	<table>
		<tbody><!-- 이 부분이 장바구니에서 넘어와야할 부분... -->
<%-- 		<c:forEach var="vo" items="${vos}"> --%>
<!-- 			<tr> -->
<%-- 				<td><input type="hidden" id="user_id" value="${vo.act_id}">${vo.act_id}</td> --%>
<%-- 				<td><input type="hidden" id="res_date" value="${vo.res_date}">${vo.res_date}</td> --%>
<%-- 				<td><input type="hidden" id="quantity" value="${vo.quantity}">${vo.quantity}</td> --%>
<%-- 				<td><input type="hidden" id="price" value="${vo.price}">${vo.price}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- price_final 어떻게 만들까 -->
		</tbody>
		<tr>
			<td><input type="hidden" id="user_id0" value="admin01"></td>
			<td><input type="number" id="act_id0" value="1">
			</td>
			<td><input type="number" id="price0" value="10000"></td>
			<td><input type="number" id="quantity0" value="2"></td>
			<td><input type="date" id="res_date0" value="2023-07-30"></td>
			<td><input type="number" id="price_final" value="20000"></td>
		</tr>
		
	
	</table>
			<button onclick="res_total()">모두예약</button>


</body>
</html>