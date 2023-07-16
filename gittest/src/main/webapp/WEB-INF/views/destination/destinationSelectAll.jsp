<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Destination</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>카테고리를 선택하세요</h1>

	<form
		action="${pageContext.request.contextPath}/selectAllDestination.do"
		method="GET">
		<button type="submit" name="category" value="서울">서울</button>
		<button type="submit" name="category" value="경기">경기</button>
		<button type="submit" name="category" value="부산">부산</button>
		<button type="submit" name="category" value="경주">경주</button>
		<button type="submit" name="category" value="제주도">제주도</button>
	</form>

	<h2>${category}</h2>
	<c:if test="${empty destinations}">
		<p>No destinations found.</p>
	</c:if>
	<c:if test="${not empty destinations}">
		<table>
			<tr>
				<th>여행지명</th>
				<th>여행지번호</th>
				<th>카테고리</th>
			</tr>
			<c:forEach items="${destinations}" var="destination">
				<c:if test="${destination.category eq category}">
					<tr>
						<td><a 
							href="${pageContext.request.contextPath}
							/selectOneDestRoute.do?dest_id=${destination.id}">
							${destination.name}</a></td>
						<td>${destination.id}</td>
						<td>${destination.category}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
