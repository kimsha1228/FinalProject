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
<!-- 네이버 지도 API JS -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fxc9ew4qop&submodules=geocoder"></script>
<script type="text/javascript">
	let user_id = '<%= session.getAttribute("user_id") %>'; 
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
<script type="text/javascript" src="resources/js/route/selectOneUserRoute.js?ver=3"></script>

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
				<th>추천수<button onclick="likeUpRoute(${param.id})">추천하기!</button></th>
			</tr>
		</thead>
		<tbody id="vos">
		</tbody>
	</table>
	<br><br>
	<div id="act_container">
	</div>
	<br>
	<div id="route_content">
	</div>
	<div>
		<form action='#' id='Reservation' method='GET'>
		
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker">
			
			<div id="quantityContainer">
			</div>
			
			<p> 예약자 user_id ${user_id}</p>
			<input type='hidden' name='user_id' value='${user_id}'/>
		</form>
		<input type="submit" form="Reservation" formaction="insertManyCart.do" value="장바구니">
	</div>
	<br>
	<br>
	<div>
		<p>루트 선택 순서</p>
		<div id="map" style="width:500px; height:600px;"></div>	
	</div>
<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js?ver=1"></script>
</body>
</html>