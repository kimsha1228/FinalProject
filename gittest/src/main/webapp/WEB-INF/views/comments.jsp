<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul>

	<h1>이용후기 화면</h1>
	<li><a href="selectMyComments.do?user_id=${user_id}">작성 가능한 후기</a></li>
	<li><a href="selectAllComments.do?user_id=john123">내 이용 후기</a></li>
	<li><a href="insertComments.do?user_id=john123">insert</a></li>


</ul>