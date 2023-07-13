<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>내 이용 후기</h1>

	<table id="commentsList">
		<thead>
			<tr>
				<th>act_id</th>
				<th>id</th>
				<th>rate</th>
				<th>content</th>
				<th>com_date</th>
				<th>likes</th>
				<th>user_id</th>
				<th>img</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<c:if test="${vo.user_id eq param.user_id}">
					<tr>
						<td><a href="selectOneComments.do?act_id=${vo.act_id}">${vo.act_id}</a></td>
						<td>${vo.id}</td>
						<td>${vo.rate}</td>
						<td>${vo.content}</td>
						<td>${vo.com_date}</td>
						<td>${vo.likes}</td>
						<td>${vo.user_id}</td>
						<td><img width="35px"
							src="resources/uploadimg/${vo.save_name}"></td>
						<td><a href="updateComments.do?id=${vo.id}" class="myButton">수정</a>
						</td>
						<td><a
							href="deleteCommentsOK.do?id=${vo.id}&user_id=${vo.user_id}"
							class="myButton">삭제</a></td>
				</c:if>
			</c:forEach>


		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>