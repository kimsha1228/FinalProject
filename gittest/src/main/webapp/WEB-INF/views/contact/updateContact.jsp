	<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/updateContact.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>글수정</h1>
	
	<form action="updateContactOK.do" method="post">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td>${vo2.id}
				<input type="hidden" id="id" name="id" value="${vo2.id}">
				</td>
			</tr>
			<tr>
				<td><label for="title">title:</label></td>
				<td>
				<input type="text" id="title" name="title" value="${vo2.title}">
				</td>
			</tr>
			<tr>
				<td><label for="content">content:</label></td>
				<td><textarea rows="10" cols="20" name="content">${vo2.content}</textarea></td>
			</tr>
			<tr>
				<td><label for="writer">writer:</label></td>
				<td>${vo2.writer}<input type="hidden" id="writer" name="writer" value="${vo2.writer}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>