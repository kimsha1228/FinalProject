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

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의작성</h1>
	
	<form action="insertContactOK.do" method="get">
		<table id="boardList">
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title" value="문의 제목을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea rows="10" cols="20" name="content" value="content">문의 내용을 입력해주세요</textarea></td>
			</tr>
			<tr>
				<td><label for="attach_img">attach_img</label></td>
				<td><textarea rows="10" cols="20" name="attach_img" value="attach_img">attach_img</textarea></td>
			</tr>
			<tr>
				<td><label for="user_id">유저id</label></td>
				<td>user_id<input type="hidden" id="user_id" name="user_id" value="user_id"></td>
			</tr>
			<tr>
				<td><label for="seller_id">판매자id</label></td>
				<td>seller_id<input type="hidden" id="seller_id" name="seller_id" value="seller_id"></td>
			</tr>
			<tr>
				<td><label for="act_name">act_name</label></td>
				<td>seller_id<input type="hidden" id="act_name" name="act_name" value="act_name"></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
			
	
		</table>
	</form>
</body>
</html>