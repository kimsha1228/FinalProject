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
<script type="text/javascript" src="resources/js/activity/selectOneUserAct.js?ver=7"></script>

<style>
.carousel {
   width:600px;
   height:360px;
   margin: auto;
 }
 .carousel-inner > .item > img {
   width:600px;
   height:360px;
 }
 .carousel > .carousel-inner > .carousel-item > img{
    width:600px; /* Yeap you can change the width and height*/
    height:360px;
}
</style>

<title>상품 정보</title>
<!-- 네이버 지도 API JS -->
<script type="text/javascript">
	let result = '${vo2.add}';
	let user_id = '${user.user_id}';
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section>
	<h1>상품 정보</h1>
    <div id="carouselControls" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
<!-- 	    <li data-target="#carouselControls" data-slide-to="0" class="active"></li> -->
<!-- 	    <li data-target="#carouselControls" data-slide-to="1"></li> -->
<!-- 	    <li data-target="#carouselControls" data-slide-to="2"></li> -->
 	  </ol>	
	  <div class="carousel-inner">
<!-- 	    <div class="carousel-item active"> -->
<!-- 	      <img src="resources/uploadimg/1-1.jpg" class="d-block w-100" alt="이미지1"> -->
<!-- 	    </div> -->
<!-- 	    <div class="carousel-item"> -->
<!-- 	      <img src="resources/uploadimg/1-2.jpg" class="d-block w-100" alt="이미지2"> -->
<!-- 	    </div> -->
<!-- 	    <div class="carousel-item"> -->
<!-- 	      <img src="resources/uploadimg/1-3.jpg" class="d-block w-100" alt="이미지3"> -->
<!-- 	    </div> -->
	  </div>
	 <button class="carousel-control-prev" type="button" data-target="#carouselControls" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">이전</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-target="#carouselControls" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">다음</span>
	  </button>
	</div>
	<div class="card" style="float:right;
						width:350px;
						align-items: center;
						margin: 10px;">
		<form action='#' id='Reservation' method='GET' style="text-align-last: center; margin:20px">
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker" min="" style="margin-bottom: 25px;">
			<p>수량 선택</p>
			<input type='button' value='-' class='qtyminus minus' onclick='decrementQuantity()' />
			<input type='text' name='quantity' value='1' id='quantity' class='qty' />
			<input type='button' value='+' class='qtyplus plus' onclick='incrementQuantity()' />
			<br><br>
			<input type='hidden' name='act_id' value='${vo2.id}'/>
			<input type='hidden' name='price' id='price' value='${vo2.price}'/>
			<input type='hidden' name='user_id' value='${user.user_id}'/>
			<input class="btn btn-primary" type="submit" form="Reservation" formaction="insertOneReservation.do" value="바로구매">
			<button class="btn btn-primary" type="submit" onclick="insertOneCart()">장바구니</button>
		</form>
	</div>
	<div
	style="background-color:inherit;
			padding:1rem 1rem;
			width:600px">
		<div>
	  	<h2 style="display: inline-flex; width: 440px;">${vo2.act_name}</h2>
	  	<button class="myButton" onclick="copyLink()"  style="font-size: medium;">공유</button>
		<button id="wish" class="${vo2.id} btn btn-outline-danger" onclick="addWish('${user.user_id}','${vo2.id}')" style="font-size: large;">♡</button>
		</div>
	  <p class="lead">${vo2.content}</p>
	</div>
	<div class="card" style="width: 300px; margin-left: 10px;">
		<div class="card-body">
			<div id="OneComment" class="card-text">
			</div>
			<a href="selectOneComments.do?act_id=${vo2.id}" class="btn btn-primary isCommented" style="color: white;">모든 이용후기</a>
			<div class="isCommented" style="float: right;">평균 별점: <span class="stars">${vo2.rate}</span></div>
		</div>
	</div>
	<br>
	<br>
	<div style="margin: 0 10px 10px;">
		<p>주소: ${vo2.add}</p>
		<div id="map" style="width:600px;height:400px;"></div>
	</div>
	<button class="myButton" onclick="window.location.href='selectFaq.do'">고객센터</button><!-- selectAllFaq.do 연결 -->
	<button class="myButton" onclick="window.location.href='insertContact.do?act_id=${vo2.id}&seller_id=${vo2.seller_id}'">문의하기</button>
</section>


<jsp:include page="../footer.jsp"></jsp:include>
<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js"></script>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript">
var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
$.fn.bootstrapBtn = bootstrapButton   
</script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
</body>
</html>