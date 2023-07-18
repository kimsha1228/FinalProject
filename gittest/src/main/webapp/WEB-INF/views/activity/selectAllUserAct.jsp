<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>상품 정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 네이버 지도 API JS -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}&submodules=geocoder"></script>
<script type="text/javascript">
<%-- 	let user_id = '<%= session.getAttribute("user_id") %>'; --%>
// 	let initadd = '서울 종로구 효자로 12 국립고궁박물관';
	let result = '${vo2.add}';
    console.log("현재 로그인 되어있는 아이디:", ${user.user_id});
	console.log("현재 주소:",result);
=======
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css">
<link rel="stylesheet" href="resources/css/activity/selectAllUserAct.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>

<title>상품</title>
<script>
<%--     let user_id = '<%= session.getAttribute("user_id") %>'; --%>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:", user_id);
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
</script>
<<<<<<< HEAD
<script type="text/javascript" src="resources/js/activity/selectOneUserAct.js?ver=7"></script>
=======
<script type="text/javascript" src="resources/js/activity/selectAllUserAct.js?ver=3"></script>
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
</head>
<body>
<<<<<<< HEAD
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
				<td><button id="wish" class="${vo2.id}" onclick="addWish('${user.user_id}','${vo2.id}')">♡</button></td>
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
=======
<jsp:include page="../top_menu.jsp"></jsp:include>
<h1>상품</h1>
<div>추천 리스트</div>
<table>
	<thead>
	    <tr>
	        <th>id</th>
	        <th>act_name</th>
	        <th>rate</th>
	        <th>vcount</th>
	        <th>tag</th>
	        <th>price</th>
	        <th>wishList</th>
	    </tr>
	</thead>
	<tbody id="vos">
	</tbody>
</table>
<div class="container">
  <div class="row">
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
  </div>
</div>
    <div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
			
			<div class="col-5">
				<div class="card card-block card-1">
				asdf
				</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-2">zxcv</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-3">qwer</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-4">fghj</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-5">fghj</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-6">rtyu</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-7">vbnm</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-8">dfgh</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-9">dgasd</div>
			</div>
			<div class="col-5">
				<div class="card card-block card-10">awev</div>
			</div>
    </div>
<br>
<br>
	<div class="dropdown">
	  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    정렬
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
	    <a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(1);">최근 등록</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(2);">오래된 순</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(3);">조회순</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(4);">평점순</a>
	  </div>
	    <a class="btn btn-outline-danger" href="javascript:sortFunction(5);" role="button">초기화</a>
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
	</div>
<<<<<<< HEAD
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
			<input type='hidden' name='price' id='price' value='${vo2.price}'/>
			<input type='hidden' name='user_id' value='${user.user_id}'/>
		</form>
		<input type="submit" form="Reservation" formaction="insertOneReservation.do" value="바로구매">
		<button type="submit" onclick="insertOneCart()">장바구니</button>
	</div>
	<br>
	<br>
	<div>
		<p>주소: ${vo2.add}</p>
		<div id="map" style="width:100%;height:600px;"></div>
	</div>
	<br>
	<br>
	<button onclick="window.location.href='selectFaq.do'">고객센터</button><!-- selectAllFaq.do 연결 -->
	<button onclick="window.location.href='insertContact.do?act_id=${vo2.id}&seller_id=${vo2.seller_id}'">문의하기</button>

<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js"></script>
=======
<!-- <label for="searchWord">상품 이름</label> -->
<!-- <input type="hidden" name="searchKey" id="searchKey" value="act_name"> -->
<!-- <input type="text" name="searchWord" id="searchWord"> -->
<!-- <button class="myButton" onclick="searchList()">검색</button> -->
<p>상품 이름 <input class="search" type="search" data-column="1"><button type="button" class="reset">검색 초기화</button></p>
<table id="tableContainer">
    <thead>
        <tr>
            <th class="sorter-false">id</th>
            <th class="sorter-false">act_name</th>
            <th class="sorter-false">rate</th>
            <th class="sorter-false">price</th>
            <th class="sorter-false">wishList</th>
            <th class="sorter-false" style="display: none;">vcount</th>
            <th class="sorter-false" style="display: none;">act_date</th>
        </tr>
    </thead>
    <tbody id="vos2">
        <c:forEach var="vo" items="${vos}" varStatus="status">
            <tr>
                <td>                
                    <a href="selectOneUserAct.do?id=${vo.id}">${vo.id}</a>
                </td>
                <td>${vo.act_name}</td>
                <td>${vo.rate}</td>
                <td>${vo.price}</td>
                <td><button class="wish" data-act_id="${vo.id}" data-arg1='${user.user_id}' data-arg2= '${vo.id}' data-arg3='${status.count}'>♡</button></td>                
                <td style="display: none;">${vo.vcount}</td>
                <td style="display: none;">${vo.act_date}</td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
    </tfoot>
</table>
<!-- 페이징 요소-->
<div class="tableContainer">
	<form>
		<i class="fa-sharp fa-solid fa-angles-left fa-2xl first"></i>
		<i class="fa-sharp fa-solid fa-angle-left fa-2xl prev"></i>
		<!-- the "pagedisplay" can be any element, including an input -->
		<span class="pagedisplay" data-pager-output-filtered="{startRow:input} &ndash; {endRow} / {filteredRows} of {totalRows} total rows"></span>
		<i class="fa-sharp fa-solid fa-angle-right fa-2xl next"></i>
		<i class="fa-sharp fa-solid fa-angles-right fa-2xl last"></i>
<!-- 		<select class="pagesize"> -->
<!-- 		<option value="10">10</option> -->
<!-- 		<option value="all">All Rows</option> -->
<!-- 		</select> -->
	</form>
</div>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
</body>
</html>
