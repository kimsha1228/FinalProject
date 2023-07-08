<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
									<input type="hidden" name="user_id" class="user_id" value="john123"> <!-- 세션없어서 이걸로 테스트 -->
									<input type="hidden" name="act_id" class="act_id" value="${cart.act_id}">
									<input type="hidden" name="price" class="price" value="${cart.price}">
									<input type="hidden" name="quantity" class="quantity" value="${cart.quantity}">
									<input type="hidden" class="price_total" value="${cart.quantity*cart.price}">
									<input type="hidden" name="res_date" class="res_date" value="${cart.res_date}">
								</td>
								<td></td>
								<td><button class="delete_btn" data-id="${cart.id}">삭제</button></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>
									<a href="selectOneUserAct.do?id=${cart.act_id}">${cart.act_name}</a>
								</td>
							</tr>
							<tr>
								<th>예약예정일</th>
								<td>${cart.res_date}</td>
							</tr>
							<tr>
								<th>수량</th>
								<td>
									<input type="number" value="${cart.quantity}" class="quantity_input">	
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
									<button class="quantity_modify_btn" data-id="${cart.id}">변경</button>
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
		
		<!-- 구매 버튼 영역 -->
		<div class="order_btn_section">
			<a class="order_btn">주문하기</a>
		</div>
		
		<!-- 수량 조정 form -->
		<form action="updateOneCart.do" method="get" class="quantity_update_form">
			<input type="hidden" name="id" class="update_id">
			<input type="hidden" name="quantity" class="update_quantity">
		</form>	
		
		<!-- 삭제 form -->
		<form action="deleteOneCart.do" method="get" class="quantity_delete_form">
			<input type="hidden" name="id" class="delete_id">
		</form>		
		
		<!-- 주문 form -->
		<form action="order.do" method="get" class="order_form">
		
		</form>			
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
		let quantity = $(this).parent("td").find("input").val();
		$(".update_id").val(id);
		$(".update_quantity").val(quantity);
		$(".quantity_update_form").submit();
	});
	
	/* 장바구니 삭제 버튼 */
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		const id = $(this).data("id");
		$(".delete_id").val(id);
		$(".quantity_delete_form").submit();
	});
			
	/* 주문 페이지 이동 */	
	$(".order_btn").on("click", function(){
		
		let form_contents ='';
		let orderNumber = 0;
		
		$(".cart_one_info").each(function(index, element){
			
			if($(element).find(".selectedActivity").is(":checked") === true){
				
				let act_id = $(element).find(".act_id").val();
				let quantity = $(element).find(".quantity").val();
				let price = $(element).find(".price").val();
				let price_total = $(element).find(".price_total").val();
				let res_date = $(element).find(".res_date").val();
				
				let act_id_input = "<input name='act_id" + orderNumber + "' type='hidden' value='" + act_id + "'>";
				form_contents += act_id_input;
				
				let quantity_input = "<input name='quantity" + orderNumber + "' type='hidden' value='" + quantity + "'>";
				form_contents += quantity_input;
				
				let price_input = "<input name='price" + orderNumber + "' type='hidden' value='" + price + "'>";
				form_contents += price_input;
				
				let price_total_input = "<input name='price_total" + orderNumber + "' type='hidden' value='" + price_total + "'>";
				form_contents += price_total_input;
				
				let res_date_input = "<input name='res_date" + orderNumber + "' type='hidden' value='" + res_date + "'>";
				form_contents += res_date_input;
				
				orderNumber += 1;
				
			}
		});	

		$(".order_form").html(form_contents);
		$(".order_form").submit();
		
	});
	</script>
	
</body>
</html>
