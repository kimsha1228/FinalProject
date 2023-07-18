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
	
	<form action="insertContactOK.do" method="post" enctype="multipart/form-data">
		<table id="boardList">
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title" value="문의 제목을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea rows="10" cols="20" name="content" >문의 내용을 입력해주세요</textarea></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="file" id="file"></td>
			</tr>
			<tr>
				<td><label for="user_id">유저</label></td>
				<td>user_id<input type="hidden" id="user_id" name="user_id" value="${user.user_id}"></td>
			</tr>
			<tr>
				<td><label for="seller_id">판매자</label></td>
				<%
				   String sellerIdParam = request.getParameter("seller_id");
				%>
				<td>seller_id<input type="hidden" id="seller_id" name="seller_id" value="<%= sellerIdParam %>"></td>
			</tr>
			<tr>
				<td><label for="act_id">상품번호</label></td>
				<%
				   String actIdParam = request.getParameter("act_id");
				%>
				<td>act_id<input type="hidden" id="act_id" name="act_id" value="<%= actIdParam %>"></td>
			</tr>
			<tr>
				<td><label for="act_name">상품명</label></td>
				<%
				   String actNameParam = request.getParameter("act_name");
				%>
				<td>act_name<input type="hidden" id="act_name" name="act_name" value="<%= actNameParam %>"></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
			
	
		</table>
	</form>
</body>
</html>