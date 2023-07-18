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
<link rel="stylesheet" href="resources/css/cardAndStar.css?ver=1">
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