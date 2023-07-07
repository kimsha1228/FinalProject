<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자 표시할 때 -->
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
	<div class="all_check_input_div">
		<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
	</div>	

	<c:if test="${not empty cartList}">
		<table>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
						<table>
							<tr>
								<td><input type="checkbox" name="selectedActivities" checked="checked">
									<input type="hidden" name="id" value="${cart.id}">
									<input type="hidden" name="user_id" value="john123"> <!-- 세션없어서 이걸로 테스트 -->
									<input type="hidden" name="act_id" value="${cart.act_id}">
									<input type="hidden" name="price" value="${cart.price}">
									<input type="hidden" name="quantity" value="${cart.quantity}">
									<input type="hidden" name="res_date" value="${cart.res_date}">
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
								<td>${cart.res_date}</td>
							</tr>
							<tr>
								<th>수량</th>
								<td>
								<div>
									<input type="number" value="${cart.quantity}" class="quantity_input">	
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
								</div>
									<a class="quantity_modify_btn" data-id="${cart.id}">변경</a>
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
							<tr>
								<td><button class="delete_btn" data-id="${cart.id}">삭제</button></td>
							</tr>
						</table>
				</c:forEach>
			</tbody>
		</table>
		
		<table>
			<tr>
				<td><strong>총 상품 가격</strong></td>
				<td>
					<span class="totalPrice_span"></span> 원
				</td>
			</tr>
		</table>
		
		<!-- 구매 버튼 영역 -->
<!-- 		<div class="content_btn_section"> -->
<!-- 			<a class="order_btn">주문하기</a> -->
<!-- 		</div> -->
		
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
<!-- 		<form action="주문 링크로 가자" method="get" class="order_form"> -->
		
<!-- 		</form>			 -->
	</c:if>

	<c:if test="${empty cartList}">
		<p>장바구니에 담긴 상품이 없습니다.</p>
	</c:if>
	
	<script>
	
	/* 수량버튼 */
	$(".plus_btn").on("click", function(){
		console.log("plus_btn");
		let quantity = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		console.log("minus_btn");
		let quantity = $(this).parent("div").find("input").val();
		if(quantity > 1){
			$(this).parent("div").find("input").val(--quantity);		
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
		$(".delete_cartId").val(id);
		$(".quantity_delete_form").submit();
	});
			
	
	</script>
	
</body>
</html>
