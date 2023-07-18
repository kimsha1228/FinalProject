<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectOneContact.js"></script>
<script>
	let user_id = '${user.user_id}';
	let type = '${user.type}';

	console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
<style>
#boardList tfoot td {
	text-align: right;
}
 table {
        margin-left: auto;
        margin-right: auto;
    }
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의보기</h1>

	<table id="boardList">
		<thead style="text-align: center;">
			<tr>
				<th>제목</th>
				<th>문의내용</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<tr>
				<td>${vo2.title}</td>
				<td>${vo2.content}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<a href="updateContact.do?id=${param.id}">문의수정</a>
					<a href="deleteContactOK.do?id=${param.id}">문의삭제</a>
				</td>
			</tr>
		</tfoot>
	</table>
	<img width="300px" src="resources/uploadimg/${vo2.attach_img}" />
	<hr>
	<h1>답변</h1>
		<c:if test="${user.type!=3}">
		<table id="answerList">
			<tr>
				<th>답변내용</th>
			</tr>
			<tr>
				<td>
					<form action="insertAnswerOK.do">
						<input type="hidden" name=id value="${param.id}">
						<input type="text" name="content" value="내용을 입력하세요">
						<input type="hidden" name="seller_id" value="${vo2.seller_id}">						
						<input type="hidden" name="contact_id" value="${vo2.id}">
						<input type="submit" value="답변입력" class="myButton">
					</form>
				</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${user.type!=3}">
		<table id="commentsList">
			<tr>
				<th>답변내용</th>
				<th></th>
			</tr>
			<c:forEach var="com" items="${coms}">
				<tr>
					<td>
						<form action="updateAnswerOK.do">
							<input type="hidden" name="contact_id" value="${com.contact_id}">
							<input type="hidden" name="id" value="${com.id}">
							<input type="text" name="content" value="${com.content}">
							<input type="submit" value="답변수정" class="myButton">
						</form>
					</td>
					<td>${com.content}</td>
					<td>
						<a href="deleteAnswerOK.do?id=${com.id}&contact_id=${com.contact_id}" class="myButton">답변삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>