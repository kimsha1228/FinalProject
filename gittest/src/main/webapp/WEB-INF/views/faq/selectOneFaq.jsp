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
<script type="text/javascript" src="resources/js/faq/selectOneFaq.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>자주 묻는 질문</h1>

	<table id="boardList">
		<thead>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.title}</td>
				<td>${vo2.content}</td>
				<td>${vo2.faq_date}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<a href="updateFaq.do?id=${param.id}">문의수정</a>
					<a href="deleteFaqOK.do?id=${param.id}">문의삭제</a>
				</td>
			</tr>
		</tfoot>
	</table>