<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 좌측 상단 출력 -->
<header>
<div id="logo">
	<a href="balgil.com"><img width="130px" src="resources/uploadimg/logo.png"></a>
</div>	

<div id="content">
<ul>
	<li><a href="selectAllDestination.do?category=City">여행지 루트 선택</a></li>
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
	<li class="showUserName">${user.user_id}님</li>
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
		$('.showUserName').hide();
		$('.wishlist').hide();
		$('.cart').hide();
		$('.myPage').hide();
		$('.logout').hide();
	}else{
		$('.login').hide();
		$('.u_insert').hide();
		$('.showUserName').show();
		$('.wishlist').show();
		$('.cart').show();
		$('.myPage').show();
		$('.logout').show();
	}
</script>