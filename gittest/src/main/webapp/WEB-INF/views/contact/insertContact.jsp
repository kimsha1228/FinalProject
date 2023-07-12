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
				<td><label for="title">title:</label></td>
				<td><input type="text" id="title" name="title" value="title1">
				</td>
			</tr>
			<tr>
				<td><label for="content">content:</label></td>
				<td><textarea rows="10" cols="20" name="content" value="content">content1</textarea></td>
			</tr>
			<tr>
				<td><label for="attach_img">attach_img</label></td>
				<td><textarea rows="10" cols="20" name="attach_img" value="attach_img">attach_img</textarea></td>
			</tr>
			<tr>
				<td><label for="user_id">writer:</label></td>
				<td>user_id<input type="hidden" id="user_id" name="user_id" value="user_id"></td>
			</tr>
			<tr>
				<td><label for="seller_id">seller:</label></td>
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