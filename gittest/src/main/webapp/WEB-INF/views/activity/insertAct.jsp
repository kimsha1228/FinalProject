<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>액티비티 작성</h1>

	<form action="insertActOk.do" method="post" enctype="multipart/form-data">
		<table>
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
				<td><label for="act_name">상품 이름:</label></td>
				<td><input type="text" id="act_name" name="act_name"
					value="에버랜드 종일 자유이용권"></td>
			</tr>
			<tr>
				<td><label for="content">상품 소개:</label></td>
				<td><textarea rows="10" cols="30" name="content">서울 근교에 다녀올 곳은 언제나 에버랜드죠! 에버랜드에는 온 가족이 함께하는 패밀리코스와 스릴을 즐길 수 있는 레이싱 코스, 익스프레스 코스가 있어 남녀노소 재미있게 하루를 즐길 수 있어요. 
				소중한 사람들과 함께 설렘 가득 에버랜드를 만나고 짜릿한 어트랙션에 탑승해보세요!
				</textarea></td>
			</tr>
			<tr>
				<td><label for="tag">태그:</label></td>
				<td><input type="text" id="tag" name="tag" value="추천">
				</td>
			</tr>
			<tr>
				<td><label for="add">주소:</label></td>
				<td><input type="text" id="add" name="add"
					value="경기도 용인시 처인구 포곡읍 에버랜드로 199 에버랜드 리조트"></td>
			</tr>
			<tr>
				<td><label for="price">가격:</label></td>
				<td><input type="number" id="price" name="price" value="10000">
				</td>
			</tr>
			<tr>
				<td>작성자는 seller01이라 가정<input type="hidden" id="seller_id"
					name="seller_id" value="seller01"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="act_button"></td>
			</tr>
		</table>
	</form>
</body>
</html>