<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 네이버 지도 API JS -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}&submodules=geocoder"></script>
<script type="text/javascript">
	let user_id = '<%= session.getAttribute("user_id") %>';
// 	let initadd = '서울 종로구 효자로 12 국립고궁박물관';
	let result = '${vo2.add}';
	console.log("현재 로그인 되어있는 아이디:",user_id);
	console.log("현재 주소:",result);
</script>
<script type="text/javascript" src="resources/js/activity/selectOneUserAct.js?ver=6"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>상품 정보</h1>

	<span id="imageList">
    	
    </span>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>act_name</th>
				<th>content</th>
				<th>rate</th>
				<th>vcount</th>
				<th>tag</th>
				<th>add</th>
				<th>price</th>
				<th>act_date</th>
				<th>seller_id</th>
				<th>dest_id</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.act_name}</td>
				<td>${vo2.content}</td>
				<td>${vo2.rate}</td>
				<td>${vo2.vcount}</td>
				<td>${vo2.tag}</td>
				<td>${vo2.add}</td>
				<td>${vo2.price}</td>
				<td>${vo2.act_date}</td>
				<td>${vo2.seller_id}</td>
				<td>${vo2.dest_id}</td>
			</tr>
			<tr>
				<td><button onclick="copyLink()">공유</button></td>
				<td><button id="wish" class="${vo2.id}" onclick="addWish('${user_id}','${vo2.id}')">♡</button></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
	<div>
		뭔가 댓글이 여기에 출력됨
		<div id="OneComment">
		</div>
		<a href="selectOneComments.do?act_id=${vo2.id}">상품 후기 전체보기</a>
	</div>
	<div>
		<form action='#' id='Reservation' method='POST'>
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker" min="">
			<p>수량 선택</p>
			<input type='button' value='-' class='qtyminus minus' onclick='decrementQuantity()' />
			<input type='text' name='quantity' value='1' id='quantity' class='qty' />
			<input type='button' value='+' class='qtyplus plus' onclick='incrementQuantity()' />
			<p>현재 상품번호 act_id ${vo2.id}, 예약자 user_id ${user_id}</p>
			<input type='hidden' name='act_id' value='${vo2.id}'/>
			<input type='hidden' name='price' value='${vo2.price}'/>
			<input type='hidden' name='user_id' value='${user_id}'/>
		</form>
		<input type="submit" form="Reservation" formaction="insertOneReservation.do" value="바로구매">
		<input type="submit" form="Reservation" formaction="insertOneCart.do" value="장바구니">
	</div>
	<br>
	<br>
	<div>
		<p>주소: ${vo2.add}</p>
		<div id="map" style="width:100%;height:600px;"></div>
	</div>
	<br>
	<br>
	<button onclick="window.location.href='selectFaq.do'">고객센터</button>
	<button onclick="window.location.href='insertContact.do?act_id=${vo2.id}&seller_id=${vo2.seller_id}'">문의하기</button>

<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js"></script>
</body>
</html>