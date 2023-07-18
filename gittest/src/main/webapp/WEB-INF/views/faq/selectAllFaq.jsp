<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faq/selectAllFaq.js"></script>
<script>
<<<<<<< HEAD
	let user_id = '<%= session.getAttribute("user_id") %>';
=======
	let user_id = '${user.user_id}';
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
	console.log("현재 로그인 되어있는 아이디:",user_id);
	
	$(document).ready(function() {
		if (user_id === "admin01") {
			$("#faq_menu").find("li").show();
		} else {
			$("#faq_menu").find("li").hide();
		}
	});

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>FAQ</h1>
	<ul id="faq_menu">
		<li><a href ="insertFaq.do">문의 입력</a></li>
	</ul>

	<table>
		<thead>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="selectOneFaq.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.id}</td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.faq_date}</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
	<div>
		<a class="btn" id="insert_btn">문의 작성</a>
	</div>

	<br>
</body>
</html>
