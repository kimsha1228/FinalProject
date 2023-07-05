<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/answer/selectAllAnswer.js"></script>
<script>
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>답변목록</h1>
	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>content</th>
				<th>ans_date</th>
				<th>seller_id</th>
				<th>contact_id</th>
			</tr>
		</thead>
		<tbody id="vos">

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
	<br>
</body>
</html>
