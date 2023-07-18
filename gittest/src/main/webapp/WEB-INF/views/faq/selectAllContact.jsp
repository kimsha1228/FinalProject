<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/contact/selectAllcontact.js"></script>
<script>
<<<<<<< HEAD
<<<<<<< HEAD
	let user_id = '<%=session.getAttribute("user_id")%>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의목록</h1>

	
	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>file</th>
				<th>user_id</th>
				<th>seller_id</th>
				<th>act_id</th>
				<th>act_name</th>
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
======= let user_id = '${user.user_id}'; console.log("현재 로그인 되어있는
아이디:",user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의목록</h1>
	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>file</th>
				<th>user_id</th>
				<th>seller_id</th>
				<th>act_id</th>
				<th>act_name</th>
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
>>>>>>> branch 'master' of
https://github.com/kimsha1228/FinalProject.git
=======
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의목록</h1>
	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>file</th>
				<th>user_id</th>
				<th>seller_id</th>
				<th>act_id</th>
				<th>act_name</th>
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
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject
