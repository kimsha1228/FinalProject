<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<head>
<title>kubg</title>
</head>
<body>
	<section id="content">
		<ul>
			<li>
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck"/>
					<label for="allCheck">모두 선택</label>
	
					<script>
						$("#allCheck").click(
								function() {
									var chk = $("#allCheck").prop("checked");
									if (chk) {
										$(".chBox").prop("checked",true);
									} else {
										$(".chBox").prop("checked",false);
									}
								});
					</script>
				</div>
	
				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택 삭제</button>
	
					<script>
						$(".selectDelete_btn").click(function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");
								if (confirm_val) {
									var checkArr = new Array();
	
									// 체크된 체크박스의 갯수만큼 반복
									$("input[class='chBox']:checked").each(function() {
										checkArr.push($(this).attr("data-cartNum")); // 배열에 데이터 삽입
									});
	
									$.ajax({
											url : "/shop/deleteCart",
											type : "post",
											data : {chbox : checkArr},
											success : function(result) {
												if (result == 1) {
													location.href = "/shop/cartList";
												} else {
													alert("삭제 실패");
												}
											}
									});
								}
							});
					</script>
				</div>
			</li>
	
			<%-- jsp상의 변수 선언 --%>
			<c:set var="sum" value="0" />
	
			<c:forEach items="${cartList}" var="cartList">
				<li>
					<div class="checkBox">
						<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
						<script>
							$(".chBox").click(function() {
								$("#allCheck").prop(
										"checked", false);
							});
						</script>
					</div>
	
					<div class="thumb">
						<img src="${cartList.gdsThumbImg}"/>
					</div>
					<div class="gdsInfo">
						<p>
							<span>상품명</span>${cartList.gdsName}<br/> 
							<span>개당 가격</span>
							<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/>원<br/> 
							<span>구입 수량</span>${cartList.cartStock} 개<br/> 
							<span>최종 가격</span>
							<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/>원
						</p>
	
						<div class="delete">
							<button type="button" class="delete_${cartList.cartNum}_btn"
								data-cartNum="${cartList.cartNum}">삭제</button>
	
							<script>
								$(".delete_${cartList.cartNum}_btn").click(function() {
									var confirm_val = confirm("정말 삭제하시겠습니까?");
	
									if (confirm_val) {
										var checkArr = new Array();
	
										checkArr.push($(this).attr("data-cartNum"));
	
										$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : {chbox : checkArr},
												success : function(result) {
													if (result == 1) {
														location.href = "/shop/cartList";
													} else {
														alert("삭제 실패");
													}
												}
										});
									}
								});
							</script>
						</div>
					</div>
				</li>
	
				<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
				<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
			</c:forEach>
		</ul>
	
		<div class="listResult">
			<div class="sum">
				총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원
			</div>
			<div class="orderOpne">
				<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
	
				<script>
					$(".orderOpne_bnt").click(function() {
						$(".orderInfo").slideDown(); // $(".orderInfo")를 나타내고
						$(".orderOpne_bnt").slideUp(); // $(".orderOpne_bnt")를 숨김
					});
				</script>
	
			</div>
		</div>
	
		<div class="orderInfo">
			<form role="form" method="post" autocomplete="off">
	
				<input type="hidden" name="amount" value="${sum}" />
	
				<div class="inputArea">
					<label for="">수령인</label> <input type="text" name="orderRec"
						id="orderRec" required="required" />
				</div>
	
				<div class="inputArea">
					<button type="submit" class="order_btn">주문</button>
					<button type="button" class="cancel_btn">취소</button>
	
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp(); // $(".orderInfo")를 숨기고
							$(".orderOpne_bnt").slideDown(); // $(".orderOpne_bnt")를 나타냄
						});
					</script>
	
				</div>
	
			</form>
		</div>
	
	
	</section>

</body>
</html>