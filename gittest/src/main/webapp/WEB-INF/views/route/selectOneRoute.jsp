<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>루트 정보</h1>

	<table>
		<thead>
			<tr>
				<th>route_name</th>
				<th>summary</th>
				<th>dest_name</th>
				<th>routes</th>
				<th>content</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.route_name}</td>
				<td>${vo2.summary}</td>
				<td>${vo2.dest_name}</td>
				<td>
				  ${vo2.act_name1} 
				  <c:if test="${not empty vo2.act_name2}">
				    → ${vo2.act_name2}
				  </c:if>
				  <c:if test="${not empty vo2.act_name3}">
				    → ${vo2.act_name3}
				  </c:if>
				  <c:if test="${not empty vo2.act_name4}">
				    → ${vo2.act_name4}
				  </c:if>
				  <c:if test="${not empty vo2.act_name5}">
				    → ${vo2.act_name5}
				  </c:if>
				</td>
				<td>${vo2.content}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="updateRoute.do?id=${param.id}">루트수정</a>
					<a href="deleteRouteOk.do?id=${param.id}">루트삭제</a></td>
			</tr>
		</tfoot>
	</table>
	<img width="300px" src="resources/uploadimg/${vo2.img}" />
	<button type="button" onclick="location.href='selectAllAct.do'">루트목록</button>
</body>
</html>