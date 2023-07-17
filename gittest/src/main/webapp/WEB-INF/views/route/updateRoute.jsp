<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 수정</title>
<link rel="stylesheet" href="resources/css/multi-select2.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/multi-select2.js"></script>
<script>
	let user_id = '${user.user_id}';
	let dest_id = ${vo2.dest_id};
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
<script type="text/javascript" src="resources/js/route/updateRoute.js?ver=2"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>루트 수정</h1>

	<form action="updateRouteOk.do" method="POST"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="route_name">루트 이름:</label></td>
				<td><input type="text" id="route_name" name="route_name"
					value="${vo2.route_name}"></td>
			</tr>
			<tr>
				<td><label for="summary">루트 설명:</label></td>
				<td><textarea rows="2" cols="30" name="summary">${vo2.summary}</textarea></td>
			</tr>
			<tr>
				<td>루트 옵션 선택!</td>
				<td id="rts"></td>
			</tr>
			<tr>
				<td><label for="content">루트 소개:</label></td>
				<td><textarea rows="10" cols="30" name="content">${vo2.content}</textarea></td>
			</tr>
			<tr id="file">
				<td>배너 사진 <input type="file" name="file" id="file"></td>
			</tr>
			<tr>
				<td>작성자는 현재 ${user.user_id} 
					<input type="hidden" name="seller_id" value="${user.user_id}">
					<input type="hidden" name="id" value="${param.id}">
					<input type="hidden" name="dest_id" value="${vo2.dest_id}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="route_button"></td>
			</tr>
		</table>
	</form>
</body>
</html>