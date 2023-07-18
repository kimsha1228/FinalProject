<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/css/tablesorter/theme.default.min.css">
<link rel="stylesheet"
	href="resources/css/activity/selectAllUserAct.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script
	src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script
	src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>

<title>후기</title>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>후기</h1>


	<table id="commentsList">
		<thead>
			<tr>
				<th>act_id</th>
				<th>id</th>
				<th>rate</th>
				<th>content</th>
				<th>com_date</th>
				<th>user_id</th>
				<th>likes</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>

					<td>${vo.act_id}</td>
					<td>${vo.id}</td>
					<td>${vo.rate}</td>
					<td>${vo.content}</td>
					<td>${vo.com_date}</td>
					<td>${vo.user_id}</td>
					<td><a href="updateLikes.do?id=${vo.id}&act_id=${vo.act_id}">${vo.likes}</a>
					</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
</body>
</html>