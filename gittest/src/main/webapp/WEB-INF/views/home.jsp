<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<jsp:include page="./css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/home.js?ver=2"></script>
</head>
<body>
<jsp:include page="./top_menu.jsp"></jsp:include>

<section>
	<section>
		<h1>환영합니다! ${user_id}</h1>
		<label for="searchWord">상품을 검색해보세요!</label>
		<input type="hidden" name="searchKey" id="searchKey" value="act_name">
		<input type="text" name="searchWord" id="searchWord">
		<button class="myButton" onclick="searchAct()" >검색</button>
	</section>
	<section id="destinations">
		<h3>현재 이용 가능한 여행지</h3>
		<div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
				<a class="col-3" href="selectOneDestRoute.do?dest_id=1">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' src="https://youimg1.tripcdn.com/target/0101c12000adm19trE691_C_670_770_R5.jpg_.webp">
						<span class="card-act-name">서울</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=2">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' src="https://youimg1.tripcdn.com/target/0104h1200083vnxttED9A_C_670_770_R5.jpg_.webp">
						<span class="card-act-name">경기도</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=3">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' src="https://youimg1.tripcdn.com/target/fd/tg/g3/M0A/46/03/CggYG1XK_vuAAbdvAAqr2aJOX-s018_C_670_770_R5.jpg_.webp">
						<span class="card-act-name">부산</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=4">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' src="https://youimg1.tripcdn.com/target/0103e120008x0rxdo2CDA_C_670_770_R5.jpg_.webp">
						<span class="card-act-name">인천</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=5">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' src="https://youimg1.tripcdn.com/target/0105a12000adm6wre0977_C_670_770_R5.jpg_.webp">
						<span class="card-act-name">제주도</span>
					</span>
				</a>
			</div>
	</section>

	<section id="recommended">
	</section>
	
	<section id="allAct">
	</section>
</section>
<jsp:include page="./footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script>
function searchAct(){
	window.location.href = "searchActHome.do?searchWord=" + $('#searchWord').val();
}
</script>
</body>
</html>