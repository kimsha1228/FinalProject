<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>

<title>상품</title>
<script>
    let user_id = '<%= session.getAttribute("user_id") %>';
    console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
<script type="text/javascript" src="resources/js/activity/selectAllUserAct.js?ver=3"></script>
</head>
<body>
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
	</div>
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
                <td><button class="wish" data-act_id="${vo.id}" data-arg1='${user_id}' data-arg2= '${vo.id}' data-arg3='${status.count}'>♡</button></td>                
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
</body>
</html>
