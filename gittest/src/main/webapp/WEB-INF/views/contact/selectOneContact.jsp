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

	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>file</th>
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
				<td>${vo2.file}</td>
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
    </ul>
</body>
</html>