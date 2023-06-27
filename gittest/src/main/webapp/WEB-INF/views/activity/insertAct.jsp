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

	<form action="insertActOK.do" method="post">
		<table>
			<tr>
				<td><label for="actName">액티비티 이름:</label></td>
				<td><input type="text" id="actName" name="actName"
					value="에버랜드 종일 자유이용권"></td>
			</tr>
			<tr>
				<td><label for="content">액티비티 설명:</label></td>
				<td><textarea rows="10" cols="20" name="content">서울 근교에 다녀올 곳은 언제나 에버랜드죠! 에버랜드에는 온 가족이 함께하는 패밀리코스와 스릴을 즐길 수 있는 레이싱 코스, 익스프레스 코스가 있어 남녀노소 재미있게 하루를 즐길 수 있어요. 
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
				<td>작성자는 seller01이라 가정<input type="hidden" id="sellerId"
					name="sellerId" value="seller01"></td>
			</tr>
			<tr>
				<td>경기도의 Dest번호를 2라 가정<input type="hidden" id=destID
					name="destID" value="2"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>