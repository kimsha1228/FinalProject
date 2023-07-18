<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>

<title>홈 상품 검색</title>
<script>
<%--     let user_id = '<%= session.getAttribute("user.user_id") %>'; --%>
<<<<<<< HEAD
    console.log("현재 로그인 되어있는 아이디:", ${user.user_id});
=======
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:", user_id);
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
</script>
<script type="text/javascript" src="resources/js/activity/searchActHome.js?ver=4"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>홈 상품 검색</h1>
	
	<p id="searchresult"></p>

<!-- 	<label for="searchWord">상품 검색</label> -->
<!-- 	<input type="hidden" name="searchKey" id="searchKey" value="act_name"> -->
<!-- 	<input type="text" name="searchWord" id="searchWord"> -->
<!-- 	<button class="myButton" onclick="searchList()" >검색</button> -->
	<p>상품 이름 <input class="search" type="search" data-column="1"><button type="button" class="reset">검색 초기화</button></p>
	<table id="tableContainer">
	<thead>
        <tr>
            <th class="sorter-false">id</th>
            <th class="sorter-false" data-value="${param.searchWord}">act_name</th>
            <th class="sorter-false">rate</th>
            <th class="sorter-false">price</th>
            <th class="sorter-false">wishList</th>
            <th class="sorter-false" style="display: none;">vcount</th>
            <th class="sorter-false" style="display: none;">act_date</th>
        </tr>
	</thead>
	<tbody id="vos">
		
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
</body>
</html>