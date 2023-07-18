<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내용</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/contact/selectAllcontact.js"></script>
<script>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
<style>
    /* 스타일 추가 */
    table {
        margin-left: auto;
        margin-right: auto;
    }
     h1 {
        text-align: center;
    }
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<h1>문의 내역</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="selectOneContact.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.title}</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
	<br>
</body>
</html>