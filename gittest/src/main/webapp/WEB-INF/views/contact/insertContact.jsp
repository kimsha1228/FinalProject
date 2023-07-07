<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectAllcontact.js"></script>
<script>
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의작성</h1>
	
	<form action="insertContactOK.do" method="post">
		<table id="boardList">
			<tr>
				<td><label for="title">title:</label></td>
				<td><input type="text" id="title" name="title" value="title1">
				</td>
			</tr>
			<tr>
				<td><label for="content">content:</label></td>
				<td><textarea rows="10" cols="20" name="content">content1</textarea></td>
			</tr>
			<tr>
				<td><label for="writer">writer:</label></td>
				<td>${user_id}<input type="hidden" id="writer" name="writer" value="${user_id}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>