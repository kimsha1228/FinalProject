<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
	<h1>로그인</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<form action="loginOK.do" method="post">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td><input type="text" id="id" name="id" value="tester"></td>
			</tr>
			<tr>
				<td><label for="password">pw:</label></td>
				<td><input type="password" id="password" name="password" value="hi11"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인" class="myButton"></td>
			</tr>
		</table>
	</form>

</body>
</html>