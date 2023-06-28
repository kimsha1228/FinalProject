<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/activity/selectOneAct.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>상품 정보</h1>

	<!-- 추후 이미지도 불러와야함 -->
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>act_name</th>
				<th>content</th>
				<th>rate</th>
				<th>vcount</th>
				<th>tag</th>
				<th>add</th>
				<th>price</th>
				<th>act_date</th>
				<th>seller_id</th>
				<th>dest_id</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.act_name}</td>
				<td>${vo2.content}</td>
				<td>${vo2.rate}</td>
				<td>${vo2.vcount}</td>
				<td>${vo2.tag}</td>
				<td>${vo2.add}</td>
				<td>${vo2.price}</td>
				<td>${vo2.act_date}</td>
				<td>${vo2.seller_id}</td>
				<td>${vo2.dest_id}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="updateAct.do?id=${param.id}">상품수정</a>
					<a href="deleteActOK.do?id=${param.id}">상품삭제</a></td>
			</tr>
		</tfoot>
	</table>

    <ul>
        <li>images</li>
        <li>이미지1</li>
        <li>이미지2</li>
        <li>이미지3</li>
    </ul>
</body>
</html>