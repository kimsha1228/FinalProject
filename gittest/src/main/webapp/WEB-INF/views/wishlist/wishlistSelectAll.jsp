<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wishlistComplete</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>WishList</h1>



	<form action="${pageContext.request.contextPath}/selectAllUserAct.do"
		method="GET">
		<input type="submit" value="상품 보러가기" />
	</form>


	<br>


	<table border="1">
		<c:if test="${not empty vos1}">

			<c:forEach var="vo" items="${vos1}">
				<tr>
					<th>회원번호</th>
					<td><a
						href="selectOneWishList.do?id=${vo.act_id}&user_id=${vo.user_id}">${vo.user_id}</a></td>
				</tr>

				<tr>
					<th>상품번호</th>
					<td><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
				</tr>


				<tr>
					<td colspan="2"><a
						href="deleteOK.do?act_id=${vo.act_id}&user_id=${vo.user_id}">
							위시리스트 삭제 </a></td>
				</tr>

			</c:forEach>
		</c:if>
		<c:if test="${empty vos1}">
			<tr>
				<td>위시리스트에 담긴 상품이 없습니다.</td>
			</tr>
			<tr>
				<td><a href="home.do">홈화면으로 가기</a></td>
			</tr>
		</c:if>
		<c:if test="${not empty vos2}">
			<c:forEach var="vo2" items="${vos2}">
				<tr>
					<th>회원번호</th>
					<td>${vo2.user_id}</td>
				</tr>

				<tr>
					<th>상품번호</th>
					<td><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td>
				</tr>
			</c:forEach>
		</c:if>

	</table>
</body>
</html>
