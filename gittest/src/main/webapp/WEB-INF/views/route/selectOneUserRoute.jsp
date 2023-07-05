<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript" src="resources/js/route/selectOneUserRoute.js?ver=1"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>루트 화면</h1>

	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>route_name</th>
				<th>루트</th>
				<th>vcount</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.route_name}</td>
				<td>
				  ${vo2.act_name1} 
				  <c:if test="${not empty vo2.act_name2}">
				    → ${vo2.act_name2}
				  </c:if>
				  <c:if test="${not empty vo2.act_name3}">
				    → ${vo2.act_name3}
				  </c:if>
				  <c:if test="${not empty vo2.act_name4}">
				    → ${vo2.act_name4}
				  </c:if>
				  <c:if test="${not empty vo2.act_name5}">
				    → ${vo2.act_name5}
				  </c:if>
				</td>
				<td>${vo2.vcount}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
	<br><br>
	<div id="act_container">
		<div>
			<label for="act1">${vo2.act_name1}</label>
			<input type="checkbox" id="act1" name="act1">
			<button onclick="addWish('${user_id}',${vo2.act_id1})">♥</button>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name2}">
				<label for="act2">${vo2.act_name2}</label>
				<input type="checkbox" id="act2" name="act2">
		  		<button onclick="addWish('${user_id}',${vo2.act_id2})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name3}">
				<label for="act3">${vo2.act_name3}</label>
				<input type="checkbox" id="act3" name="act3">
		  		<button onclick="addWish('${user_id}',${vo2.act_id3})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name4}">
				<label for="act4">${vo2.act_name4}</label>
				<input type="checkbox" id="act4" name="act4">
		  		<button onclick="addWish('${user_id}',${vo2.act_id4})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name5}">
				<label for="act5">${vo2.act_name5}</label>
				<input type="checkbox" id="act5" name="act5">
		  		<button onclick="addWish('${user_id}',${vo2.act_id5})">♥</button>
			</c:if>
		</div>
	</div>
	<br>
	<div>
		루트 소개:<br>
		${vo2.content}
	</div>
	<div>
		<form action='#' id='Reservation' method='GET'>
		
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker">
			
			<div>
				<p>수량 선택</p>
				<input type='button' value='-' class='qtyminus minus' onclick='decrementQuantity()' />
				<input type='text' name='quantity' value='1' id='quantity' class='qty' />
				<input type='button' value='+' class='qtyplus plus' onclick='incrementQuantity()' />
			</div>
			
			<p>현재 상품번호 act_id ${vo2.id}, 예약자 user_id ${user_id}</p>
			<input type='hidden' name='act_id' value='${vo2.id}'/>
			<input type='hidden' name='user_id' value='${user_id}'/>
		</form>
		<input type="submit" form="Reservation" formaction="insertManyCart.do" value="장바구니">
	</div>
	<br>
	<br>
	<div>
		<p>(임시로 구글지도 공유를 통해 에버랜드만 띄워놈)</p>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3174.0516200106736!2d127.198060288855!3d37.2939104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b5403ce34d773%3A0x1fa18ab619238098!2z7JeQ67KE656c65Oc!5e0!3m2!1sko!2skr!4v1688088597204!5m2!1sko!2skr" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
</body>
</html>