<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faq/selectAllFaq.js"></script>
<script>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:",user_id);
	
	$(document).ready(function() {
		if (user_id === "admin01") {
			$("#faq_menu").find("li").show();
            $("#faq_form").show();
		} else {
			$("#faq_menu").find("li").hide();
            $("#faq_form").hide();
		}
	});
</script>
<style>
    .inputtable {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        flex-direction: column; 
    }}

  #faq_form {
        width: 80%;
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        box-sizing: border-box;
    }
      .inputtable h1 {
        text-align: center;
        margin-bottom: 20px;
    }

</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="inputtable">
		<h1>자주 묻는 질문</h1>
		<form id="faq_form" action="insertFaqOK.do" method="get">
			<table id="boardList">
				<tr>
					<td><label for="title">제목</label></td>
					<td><input type="text" id="title" name="title" value="faq 제목">
					</td>
				</tr>
				<tr>
					<td><label for="content">내용</label></td>
					<td><textarea rows="10" cols="20" name="content" value="content">faq 내용</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="myButton" value="작성완료"></td>
				</tr>
	
			</table>
		</form>
	</div>	

	<table>
		<thead>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="selectOneFaq.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.faq_date}</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>

	<br>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
