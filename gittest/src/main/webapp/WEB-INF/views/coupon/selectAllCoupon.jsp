<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectAllcontact.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>쿠폰</h1>
	<table>
		<thead>
			<tr>
				<th>code</th>
				<th>name</th>
				<t>expire</th>
				<th>rate</th>
			</tr>
		</thead>
	
		<tfoot>
			<tr>
				<td colspan="4">1 2 3 4</td>
			</tr>
		</tfoot>
	</table>
	<br>
</body>
</html>
