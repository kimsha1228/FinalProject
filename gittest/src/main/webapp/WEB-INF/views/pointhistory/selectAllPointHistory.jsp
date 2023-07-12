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
	<h1>포인트</h1>
	
	<div style="padding:5px">

	</div>

	<table id="memberList">
	<thead>
		<tr>
			<th>user_id</th>
			<th>history</th>
			<th>point</th>
			<th>point_date</th>
		</tr>
	</thead>
  
	<tfoot>
		<tr>
			<td colspan="4">1 2 3 4 </td>
		</tr>
	</tfoot>
	</table>
</body>
</html>