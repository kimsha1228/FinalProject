<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <ul> -->
<!--현재 테스트 페이지들로 탑메뉴 구성되어 있음 -->
<!-- 	<li><a href="home.do">HOME</a></li> -->

<!-- 	<li><a href="Activity_test.do">Activity_test</a></li> -->
	
<!-- 	<li><a href="Route_test.do">Route_test</a></li> -->

<!--  	<li><a href="map_test.do">map_test</a></li> -->

<!-- 	<li><a href="reservation_api.do">예약테스트</a></li> -->
		
<!-- 	<li><a href="myPage.do">마이페이지</a></li> -->
	
<!-- 	<li><a href="selectAllContact.do?seller_id=seller01">문의</a></li>	insertcontact seller_id 필요 -->
	
<!-- 	<li><a href="selectAllContact.do?seller_id=seller01">셀러문의seller01</a></li> -->
	
<!-- 	<li><a href="selectAllContact.do?user_id=john123">유저문의john123</a></li> -->
	
<!-- 	<li><a href="selectAllFaq.do?seller_id=admin01">FAQadmin01</a></li> -->
	
<!-- 	<li><a href ="Faq_test.do">FAQ</a></li> -->
	
<!-- 	<li><a href ="Coupon.do">쿠폰 가기</a></li> -->
  
<!-- 	<li><a href="cart.do">장바구니 가기</a></li> -->

<!-- 	<li><a href="u_insert.do">회원가입</a></li> -->
	
<!-- 	<li><a href="login.do">로그인</a></li> -->
	
<!-- 	<li><a href="logout.do">로그아웃</a></li> -->
	
<!-- 	<li><a href="wishlist.do">위시리스트 가기</a></li> -->
	
<!-- 	<li><a href="destination.do">여행지 가기</a></li> -->
	
<!--   	<li><a href="comments.do">이용 후기</a></li>  -->
	
<!--   	<li><a href="u_update.do?user_id=john123">회원수정</a></li> -->
	
<!-- 	<li><a href="myInfo.do?user_id=john123">내 정보 관리</a></li> -->
<!-- 	</ul> -->
<!-- <hr> -->


<!-- 탑메뉴 이렇게 변경될 것 -->

<!-- 좌측 상단 출력 -->
<header>
<div id="logo">
	<a href="home.do"><img width="120px" src="resources/uploadimg/logo.png"></a><!-- 로고 이미지로 대체할 것<img width="50px" src="resources/uploadimg/logo.png"> -->
</div>	

<div id="content">
<ul>
	<li><a href="selectAllDestination.do?category=City">여행지 루트 선택</a></li><!-- 여기 주소 정리 필요 -->
	<li><a href="selectAllUserAct.do">여행지 상품 선택</a></li>
</ul>	
</div>

<div id="login">
<!-- 우측 상단 출력 -->
<ul>
	<!-- 로그인 전 이렇게 출력 -->
	<li class="login"><a href="login.do">로그인</a></li>
	<li class="u_insert"><a href="u_insert.do">회원가입</a></li>
	
	<!-- 로그인 후 로그인 안보이게 하고 하단 링크들 출력 -->
	<li class="wishlist"><a href="selectAllWishList.do?user_id=${user.user_id}">위시리스트</a></li>
	<li class="cart"><a href="selectAllCart.do?user_id=${user.user_id}">장바구니</a></li>
	<li class="myPage"><a href="myPage.do?user_id=${user.user_id}">마이페이지</a></li>
	<li class="logout"><a href="logout.do">로그아웃</a></li>
</ul>
</div>
</header>
<script type="text/javascript">
	if('${user.user_id}'===''){
		$('.login').show();
		$('.u_insert').show();
		$('.wishlist').hide();
		$('.cart').hide();
		$('.myPage').hide();
		$('.logout').hide();
	}else{
		$('.login').hide();
		$('.u_insert').hide();
		$('.logout').show();
		$('.wishlist').show();
		$('.cart').show();
		$('.myPage').show();
	}
</script>