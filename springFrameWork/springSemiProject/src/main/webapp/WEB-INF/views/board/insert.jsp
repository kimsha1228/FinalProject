<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<h1>글 게시 ${user_id} ${user_name}</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<form action="b_insertOK.do" method="post">
		<table id="memberList">
			<tbody>
				<tr>
					<th>title</th>
					<td><input type="text" name="title" value="${vo2.title}"></td>
				</tr>
				<tr>
					<th>content</th>
					<td><textarea rows="10" cols="25" name="content">${vo2.content}</textarea></td>
				</tr>
				<tr>
					<th>writer</th>
					<td>tester<input type="hidden" name="writer" value="tester" readonly></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6"><input type="submit" value="입력완료" class="myButton"></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>