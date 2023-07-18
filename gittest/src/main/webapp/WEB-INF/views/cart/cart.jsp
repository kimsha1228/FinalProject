<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>장바구니</h1>
		

	<c:if test="${not empty cartList}">
		<div class="all_check_input_div">
			<input type="checkbox" class="allSelectedActivity" checked="checked"><span>전체선택</span>
		</div>
		<table>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
						<table style="margin-top: 10px">
							<tr>
								<td class="cart_one_info">
									<input type="checkbox" name="selectedActivity" class="selectedActivity" checked="checked">
									<input type="hidden" name="id" class="id" value="${cart.id}">
									<input type="hidden" name="user_id" class="user_id" value="${user.user_id}">
									<input type="hidden" name="act_id" class="act_id" value="${cart.act_id}">
									<input type="hidden" name="price" class="price" value="${cart.price}">
									<input type="hidden" name="quantity" class="quantity" value="${cart.quantity}">
									<input type="hidden" class="price_total" value="${cart.quantity*cart.price}">
									<input type="hidden" name="res_date" class="res_date" value="${cart.res_date}">
								</td>
								<td></td>
								<td>
								<button class="order_btn" data-id="${cart.id}" data-user_id="${user.user_id}" data-act_id="${cart.act_id}"
								data-price="${cart.price}" data-quantity="${cart.quantity}"  data-res_date="${cart.res_date}">단일 구매</button>
								<button class="delete_btn" data-id="${cart.id}" data-user_id="${user.user_id}">삭제</button>
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>
									<a href="selectOneUserAct.do?id=${cart.act_id}">${cart.act_name}</a>
								</td>
							</tr>
							<tr>
								<th>예약예정일</th>
								<td><fmt:parseDate value="${cart.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/></td>
							</tr>
							<tr>
								<th>수량</th>
								<td>
									<input type="number" value="${cart.quantity}" class="quantity_input">	
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
									<button class="quantity_modify_btn" data-id="${cart.id}" data-user_id="${user.user_id}">변경</button>
								</td>
							</tr>
							<tr>
								<th>가격</th>
								<td><fmt:formatNumber value="${cart.price}" pattern="#,### 원" /></td>
							</tr>
							<tr>
								<th>총 금액</th>
								<td><fmt:formatNumber value="${cart.price*cart.quantity}" pattern="#,### 원" /></td>
							</tr>
						</table>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<table style="margin-top:20px">
			<tr>
				<td><strong>총 상품 가격</strong></td>
				<td>
					<span class="price_total_span"></span> 원
				</td>
			</tr>
		</table>
<!-- 		<div class="order_btn_section"> -->
<!-- 			<a class="order_many_btn">주문하기</a> -->
<!-- 		</div> -->
		
		<!-- 수량 조정 form -->
		<form action="updateOneCart.do" method="get" class="quantity_update_form">
			<input type="hidden" name="id" class="update_id">
			<input type="hidden" name="user_id" class="update_user_id">
			<input type="hidden" name="quantity" class="update_quantity">
			<input type="hidden" name="quantity" class="update_quantity">
		</form>	
		
		<!-- 삭제 form -->
		<form action="deleteOneCart.do" method="get" class="quantity_delete_form">
			<input type="hidden" name="id" class="delete_id">
			<input type="hidden" name="user_id" class="delete_user_id">
		</form>		
		
		<!-- 주문 form -->
		<form action="insertOneReservation.do" method="POST" class="order_form">
			<input type="hidden" name="id" class="order_id">
			<input type="hidden" name="user_id" class="order_user_id">
			<input type="hidden" name="act_id" class="order_act_id">
			<input type="hidden" name="price" class="order_price">
			<input type="hidden" name="quantity" class="order_quantity">
			<input type="hidden" name="res_date" class="order_res_date">
		</form>
		
		<!-- 다중 주문 form -->
<!-- 		<form action="insertManyReservation.do" method="get" class="order_many_form"> -->
		
<!-- 		</form>	 -->
	</c:if>

	<c:if test="${empty cartList}">
		<table>
			<tr>
				<td>장바구니에 담긴 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="home.do">예약하러 가기</a></td>
			</tr>
		</table>
	</c:if>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
	
	$(document).ready(function(){
		setTotalPrice();	
	
	});	

	/* 체크여부에 따른 총 가격 변화*/
	$(".selectedActivity").on("change", function(){
		setTotalPrice($(".cart_one_info"));
	});

	/* 체크박스 전체 선택 */
	$(".allSelectedActivity").on("click", function(){

		/* 체크박스 체크/해제 */
		if($(".allSelectedActivity").prop("checked")){
			$(".selectedActivity").attr("checked", true);
		} else{
			$(".selectedActivity").attr("checked", false);
		}
		
		setTotalPrice($(".cart_one_info"));	
		
	});
	
	/* 총 상품 가격 */
	function setTotalPrice(){
		let totalPrice = 0;
		$(".cart_one_info").each(function(index, element){
			if($(element).find(".selectedActivity").is(":checked") === true){
				totalPrice += parseInt($(element).find(".price_total").val());
			}
		});
		
		$(".price_total_span").text(totalPrice.toLocaleString());
	}
	
	/* 수량 +/- 버튼 */
	$(".plus_btn").on("click", function(){
		console.log("plus_btn");
		let quantity = $(this).parent("td").find("input").val();
		$(this).parent("td").find("input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		console.log("minus_btn");
		let quantity = $(this).parent("td").find("input").val();
		if(quantity > 1){
			$(this).parent("td").find("input").val(--quantity);		
		}
	});
	
	/* 수량 수정 버튼 */
	$(".quantity_modify_btn").on("click", function(){
		let id = $(this).data("id");
		let user_id = $(this).data("user_id");
		let quantity = $(this).parent("td").find("input").val();
		$(".update_id").val(id);
		$(".update_user_id").val(user_id);
		$(".update_quantity").val(quantity);
		$(".quantity_update_form").submit();
	});
	
	/* 장바구니 삭제 버튼 */
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		const id = $(this).data("id");
		let user_id = $(this).data("user_id");
		$(".delete_id").val(id);
		$(".delete_user_id").val(user_id);
		$(".quantity_delete_form").submit();
	});
	
	/* 한 개 구매 버튼 */
	$(".order_btn").on("click", function(e){
		e.preventDefault();
		let id = $(this).data("id");
		let user_id = $(this).data("user_id");
		let act_id = $(this).data("act_id");
		let price = $(this).data("price");
		let quantity = $(this).data("quantity");
		let res_date = $(this).data("res_date");
		$(".order_id").val(id);
		$(".order_user_id").val(user_id);
		$(".order_act_id").val(act_id);
		$(".order_price").val(price);
		$(".order_quantity").val(quantity);
		$(".order_res_date").val(res_date);
		$(".order_form").submit();
	});
	
	
	/* 주문 페이지 이동 */	
	$(".order_many_btn").on("click", function(){
		
		let txt_jsons ='[';
		
		$(".cart_one_info").each(function(index, element){
			
			if($(element).find(".selectedActivity").is(":checked") === true){
				
				let act_id = $(element).find(".act_id").val();
				let quantity = $(element).find(".quantity").val();
				let price = $(element).find(".price").val();
				let price_total = $(element).find(".price_total").val();
				let res_date = $(element).find(".res_date").val();
				
				txt_jsons += '{"act_id":'+act_id+',"quantity":'+quantity+',"price":'+price+',"price_total":'+price_total+',"res_date":'+res_date+'},';
			}
		});	
		txt_jsons += ']';
		
		$.ajax({
			url : "insertManyReservation.do",
			data : {
				txt_json : txt_jsons
			}, //여러개
			dataType : "json",
			success : function(response) {
			}
		});
		
	});
	
	</script>
	
</body>
</html>
