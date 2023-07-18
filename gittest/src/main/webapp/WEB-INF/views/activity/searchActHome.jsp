<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=1">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="resources/js/activity/searchActHome.js?ver=2"></script>

<title>홈 상품 검색</title>
<script>
	let user_id = '${user.user_id}';
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section>
	
	<h1 id="searchresult"></h1>

	<p style="text-align: right;margin: 10px 10px 0px 0px;">상품 이름 <input class="search" type="search" data-column="1"><button type="button" class="reset">검색 초기화</button></p>
	<table id="tableContainer">
		<thead>
	        <tr>
	            <th class="sorter-false">상품 사진</th>
	            <th class="sorter-false" data-value="${param.searchWord}">상품 요약</th>
	            <th class="sorter-false">기타정보</th>
	            <th style="display: none;">price</th>
	            <th style="display: none;">vcount</th>
	            <th class="sorter-false" style="display: none;">act_date</th>
	        </tr>
		</thead>
		<tbody id="vos">
			
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<!-- 페이징 요소-->
	<div class="tableContainer" style="text-align: center;">
		<form>
			<i class="fa-sharp fa-solid fa-angles-left fa-2xl first"></i>
			<i class="fa-sharp fa-solid fa-angle-left fa-2xl prev"></i>
			<!-- the "pagedisplay" can be any element, including an input -->
			<span class="pagedisplay" data-pager-output-filtered="{startRow:input} &ndash; {endRow} / 검색결과: {filteredRows}개"></span>
			<i class="fa-sharp fa-solid fa-angle-right fa-2xl next"></i>
			<i class="fa-sharp fa-solid fa-angles-right fa-2xl last"></i>
		</form>
	</div>
</section>

<jsp:include page="../footer.jsp"></jsp:include>

<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
</body>
</html>