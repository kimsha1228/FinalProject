<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="css.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	//로컬 저장소와 세션 저장소 (F12 응용프로그램 조회 가능)
	//세션 저장소는 브라우저를 닫으면 사라진다
	// 	localStorage.setItem('name','Kim');	
	// 	sessionStorage.setItem('tel','011');	
	</script>
</head>
<body>
	<h1>index.jsp ${user_id}</h1>
	<jsp:include page="top_menu.jsp"></jsp:include>
<%-- 	<h1>${user_id}</h1> --%>
<%-- 	<h1>${user_name}</h1> --%>
<%-- 	<h1>${cookie.user_name.value}</h1> --%>
</body>
</html>