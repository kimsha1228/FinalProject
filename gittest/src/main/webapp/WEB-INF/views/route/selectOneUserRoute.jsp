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
	let act_id1 = ${vo2.act_id1}; let act_name1 = "${vo2.act_name1}"; let initadd = "${vo2.act_add1}";
	let act_id2 = ${vo2.act_id2}; let act_name2 = "${vo2.act_name2}"; let act_add2 = "${vo2.act_add2}";
	let act_id3 = ${vo2.act_id3}; let act_name3 = "${vo2.act_name3}"; let act_add3 = "${vo2.act_add3}";
	let act_id4 = ${vo2.act_id4}; let act_name4 = "${vo2.act_name4}"; let act_add4 = "${vo2.act_add4}";
	let act_id5 = ${vo2.act_id5}; let act_name5 = "${vo2.act_name5}"; let act_add5 = "${vo2.act_add5}";
	console.log("현재 로그인 되어있는 아이디:",user_id);
	console.log("현재 주소:",initadd);
</script>
<script type="text/javascript" src="resources/js/route/selectOneUserRoute.js?ver=2"></script>

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
				<th>추천수<button onclick="likeUpRoute(${vo2.id})">추천하기!</button></th>
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
				<td>${vo2.likes}</td>
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
			<input type="checkbox" id="act1" name="1" checked> <!-- name은 js에서 순서확인용으로 사용됨 -->
			<button onclick="addWish('${user_id}',${vo2.act_id1})">♥</button>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name2}">
				<label for="act2">${vo2.act_name2}</label>
				<input type="checkbox" id="act2" name="2">
		  		<button onclick="addWish('${user_id}',${vo2.act_id2})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name3}">
				<label for="act3">${vo2.act_name3}</label>
				<input type="checkbox" id="act3" name="3">
		  		<button onclick="addWish('${user_id}',${vo2.act_id3})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name4}">
				<label for="act4">${vo2.act_name4}</label>
				<input type="checkbox" id="act4" name="4">
		  		<button onclick="addWish('${user_id}',${vo2.act_id4})">♥</button>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty vo2.act_name5}">
				<label for="act5">${vo2.act_name5}</label>
				<input type="checkbox" id="act5" name="5">
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
<script type="text/javascript" src="resources/js/Maps.js"></script>
</body>
</html>