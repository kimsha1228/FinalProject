<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}&submodules=geocoder"></script>
<script type="text/javascript" src="resources/js/route/selectOneUserRoute.js?ver=7"></script>
<style>
#act_container > div > a > img{
	height:150px;
}
</style>

<title>루트 정보</title>
<script type="text/javascript">
	let user_id = '${user.user_id}'; 
</script>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="padding-left: 2rem; padding-right: 2rem;">
	<div class="jumbotron" style="background-color:inherit; padding:2rem 0rem 0rem 0rem; margin-bottom: 0px;">
	  <p id="추천수" style="float:right">
	  추천수
	  <button class="myButton" onclick="likeUpRoute(${param.id})">추천하기!</button>
	  </p>
	  <h1 class="display-4"></h1>
	  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
	  <hr class="my-2">
	</div>
<!-- 	<table> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>id</th> -->
<!-- 				<th>route_name</th> -->
<!-- 				<th>루트</th> -->
<!-- 				<th>vcount</th> -->
<%-- 				<th>추천수<button class="myButton" onclick="likeUpRoute(${param.id})">추천하기!</button></th> --%>
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody id="vos"> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
	
	<div id="act_container" class="card-group" style="margin: 0rem -1rem;">
	</div>
	
	<div id="route_content">
	</div>
	
	<div style="margin-top:20px;">
		<div style="float: right; margin-right: 176px;">
			<button class="myButton" onclick="showRoadRoute()">도로경로 표시하기</button><br>
			<button class="myButton" onclick="hideRoadRoute()">원래대로 표시하기</button>
		</div> 
		<div id="map" style="width:600px;height:400px;"></div>	
	</div>
	
</section>


<jsp:include page="../footer.jsp"></jsp:include>
<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js?ver=4"></script>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript">
var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
$.fn.bootstrapBtn = bootstrapButton   
</script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>