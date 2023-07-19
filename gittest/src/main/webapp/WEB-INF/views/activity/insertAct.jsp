<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>상품 작성</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h1>상품 작성</h1>

	<form action="insertActOk.do" method="post" enctype="multipart/form-data">
		<table id="activityList">
			<tr>
				<td>
					<label for="dest_id">여행지명:</label>
				</td>
				<td>
					<select id="dest_id" name="dest_id">
					<c:forEach var="vo" items="${vos}" varStatus="status">
						<option value="${status.count}">${vo.name}</option>
					</c:forEach>
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
				소중한 사람들과 함께 설렘 가득 에버랜드를 만나고 짜릿한 어트랙션에 탑승해보세요!</textarea></td>
			</tr>
			<tr>
				<td><label for="price">가격:</label></td>
				<td><input type="number" id="price" name="price" value="10000">
				</td>
			</tr>
			<tr>
				<td><label for="tag">태그:</label></td>
				<td><input type="text" id="tag" name="tag" value="추천">
				</td>
			</tr>
			<tr>
				<td><label for="add">주소:</label></td>
				<td><input type="text" id="add" name="add"
					value="경기도 용인시 처인구 포곡읍 에버랜드로 199"></td>
			</tr>
			<tr id="multiplefiles">
				<td>
				<input type="file" name="file" multiple id="multiplefiles"></td>
			</tr>
			<tr>
				<td>작성자는 현재 ${user.user_id}
					<input type="hidden" id="seller_id" name="seller_id" value="${user.user_id}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="act_button"></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
			$(function(){
	    	   $("input[type='file']").change(function(event){
	    	      var $fileUpload = $("input[type='file']");
	    	      if (parseInt($fileUpload.get(0).files.length) > 5){ //5개이상이면
	    	         $fileUpload.val('');// 파일선택을 초기화
	    	         alert("이미지는 최대 5장까지만 삽입 가능합니다.");
	    	      }
	    	   });
			});
</script>
</body>
</html>