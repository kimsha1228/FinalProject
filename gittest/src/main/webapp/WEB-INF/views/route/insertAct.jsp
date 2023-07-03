<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 작성</title>
<script>

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>루트 작성</h1>

	<form action="insertRouteOk.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="route_name">루트 이름:</label></td>
				<td><input type="text" id="route_name" name="route_name"
					value="서울 관광1"></td>
			</tr>
			<tr>
				<td><label for="summary">루트 설명:</label></td>
				<td><textarea rows="10" cols="30" name="summary">서울의 멋진 장소를 관광해보세요!</textarea></td>
			</tr>
			<tr>
				<td>
					<label for="dest_id">여행지명:</label>
				</td>
				<td>
					<select id="dest_id" name="dest_id">
						  <option value="1">서울</option>
						  <option value="2">제주</option>
						  <option value="3" selected>경기도</option>
					</select>
				</td>
			</tr>
			<tr>
			<!-- 여기에 루트 옵션 여러개가 selectAll됨.. -->
			</tr>
			<tr>
				<td><label for="content">루트 소개:</label></td>
				<td><textarea rows="10" cols="30" name="content">
				서울의 멋진 장소를 관광해보세요! 신촌역 -> K-POP 댄스 원데이클래스 -> 홍대 땡땡거리 -> 경의선 숲길 -> 재즈바 -> 홍대입구
				</textarea></td>
			</tr>
			<tr id="multiplefile">
				<td>배너 사진
				<input type="file" name="file" id="multiplefile"></td>
			</tr>
			<tr>
				<td>작성자는 현재 ${user_id}
					<input type="hidden" id="seller_id" name="seller_id" value="${user_id}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="route_button"></td>
			</tr>
		</table>
	</form>
</body>
</html>