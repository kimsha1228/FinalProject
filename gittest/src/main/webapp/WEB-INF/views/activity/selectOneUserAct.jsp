<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
<script type="text/javascript" src="resources/js/activity/selectOneUserAct.js?ver=1"></script>
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
				<td><button onclick="addWish('${user_id}')">♥</button></td>
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
		<a href="selectAllComments.do?act_id=${vo2.id}">상품 후기 전체보기</a>
	</div>
	<div>
		<form action='#' id='Reservation' method='GET'>
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker">
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
		<p>${vo2.add}</p>
		<p>(임시로 구글지도 공유를 통해 에버랜드만 띄워놈)</p>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3174.0516200106736!2d127.198060288855!3d37.2939104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b5403ce34d773%3A0x1fa18ab619238098!2z7JeQ67KE656c65Oc!5e0!3m2!1sko!2skr!4v1688088597204!5m2!1sko!2skr" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	<br>
	<br>
	<button onclick="window.location.href='selectFaq.do'">고객센터</button>
	<button onclick="window.location.href='insertContact.do?act_id=${vo2.id}&seller_id=${vo2.seller_id}'">문의하기</button>
</body>
</html>