<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectOneContact.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의보기</h1>

	<table id="boardList">
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>user_id</th>
				<th>seller_id</th>
				<th>act_id</th>
				<th>act_name</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.title}</td>
				<td>${vo2.content}</td>
				<td>${vo2.con_date}</td>
				<td>${vo2.attach_img}</td>
				<td>${vo2.user_id}</td>
				<td>${vo2.seller_id}</td>
				<td>${vo2.act_id}</td>
				<td>${vo2.act_name}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="updateContactOK.do?id=${param.id}">문의수정</a>
					<a href="deleteContactOK.do?id=${param.id}">문의삭제</a></td>
			</tr>
		</tfoot>
	</table>
	<hr>
	<h1>답변</h1>
	<table id="answerList">
		<tr>
			<th>content</th>
			<th>writer</th>
		</tr>
		<tr>
			<td>
				<form action="insertAnswerOK.do">
					<input type="hidden" name=id value="${param.id}">
					<input type="hidden" name="writer" value="writer">
					<input type="text" name="content" value="댓글입니다.">
					<input type="text" name="seller_id" value="seller">
					<input type="submit" value="입력완료" class="myButton">
				</form>
			</td>
			<td>${contact_id}</td>
		</tr>
	</table>	
	
	
	<table id="commentsList">
		<tr>
			<th>id</th>
			<th>cnum</th>
			<th>content</th>
			<th>ans_date</th>
			<th></th>
		</tr>
		<c:forEach var="com" items="${coms}">
			<tr>
				<td>${com.id}</td>
				<td>
					<form action="updateAnswerOK.do">
						<input type="hidden" name="id" value="${com.id}">
						<input type="hidden" name="cnum" value="${com.cnum}">
						<input type="text" name="content" value="${com.content}">
						<input type="submit" value="수정완료" class="myButton">
					</form>
				</td>
				<td>${com.contact_id}</td>
				<td>${com.ans_date}</td>
				<td>
					<a href="deleteContactOK.do?cnum=${com.cnum}&id=${com.id}" class="myButton">댓글삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>