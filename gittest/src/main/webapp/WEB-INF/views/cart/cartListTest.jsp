<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
});	

/* 체크여부에따른 종합 정보 변화 */
$(".selectedActivities").on("change", function(){
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".selectedActivities").attr("checked", true);
	} else{
		$(".selectedActivities").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});


/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".selectedActivities").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			Point += parseInt($(element).find(".individual_totalPoint_input").val());			
		}

	});
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	
}

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let id = $(this).data("cartid");
	let bookCount = $(this).parent("td").find("input").val();
	$(".update_id").val(id);
	$(".update_quantity").val(quantity);
	$(".quantity_update_form").submit();
	
});

// /* 장바구니 삭제 버튼 */
// $(".delete_btn").on("click", function(e){
// 	e.preventDefault();
// 	const cartId = $(this).data("cartid");
// 	$(".delete_cartId").val(cartId);
// 	$(".quantity_delete_form").submit();
// });
	
// /* 주문 페이지 이동 */	
// $(".order_btn").on("click", function(){
	
// 	let form_contents ='';
// 	let orderNumber = 0;
	
// 	$(".cart_info_td").each(function(index, element){
		
// 		if($(element).find(".selectedActivities").is(":checked") === true){	//체크여부
			
// 			let bookId = $(element).find(".individual_bookId_input").val();
// 			let bookCount = $(element).find(".individual_bookCount_input").val();
			
// 			let bookId_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + bookId + "'>";
// 			form_contents += bookId_input;
			
// 			let bookCount_input = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
// 			form_contents += bookCount_input;
			
// 			orderNumber += 1;
			
// 		}
// 	});	

// 	$(".order_form").html(form_contents);
// 	$(".order_form").submit();
	
// });
		

</script>
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
					<form action='#' id='Cart' method='GET'>
						<table>
							<tr>
								<td><input type="checkbox" name="selectedActivities" checked="checked">
									<input type="hidden" name="id" value="${cart.id}">
									<input type="hidden" name="user_id" value="john123"> <!-- 세션없어서 이걸로 테스트 -->
									<input type="hidden" name="act_id" value="${cart.act_id}">
									<input type="hidden" name="price" value="${cart.price}">
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
									<input type="text" name="quantity" value="${cart.quantity}" class="quantity_input">	
									<button class="quantity_btn plus_btn">+</button>
									<button class="quantity_btn minus_btn">-</button>
									<a class="quantity_modify_btn" data-cartId="${cart.id}">변경</a>
								</td>
							</tr>
							<tr>
								<th>가격</th>
								<td>${cart.price}</td>
							</tr>
							<tr>
								<th>총 금액</th>
								<td>${cart.price*cart.quantity}</td>
							</tr>
							<tr>
								<td><input type="submit" form="Cart" formaction="insertOneReservation.do" value="바로구매"></td>
<!-- 								<td><input type="submit" form="Cart" formaction="deleteOneCart.do" value="삭제"></td> --> 
								<td><button class="delete_btn" data-cartid="${cart.id}">삭제</button></td>
							</tr>
						</table>
					</form>
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
		<form action="updateOneCart.do" method="post" class="quantity_update_form">
			<input type="hidden" name="id" class="update_id">
			<input type="hidden" name="quantity" class="update_quantity">
		</form>	
		
		<!-- 삭제 form -->
<!-- 		<form action="deleteOneCart.do" method="post" class="quantity_delete_form"> -->
<!-- 			<input type="hidden" name="cartId" class="delete_cartId"> -->
<%-- 			<input type="hidden" name="memberId" value="${member.memberId}"> --%>
<!-- 		</form>		 -->
		<!-- 주문 form -->
<!-- 		<form action="주문 링크로 가자" method="get" class="order_form"> -->
		
<!-- 		</form>			 -->
	</c:if>

	<c:if test="${empty cartList}">
		<p>장바구니에 담긴 상품이 없습니다.</p>
	</c:if>
</body>
</html>
