<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="loginform">
	<h3>내 정보 수정</h3>
	<form action="u_updateOK.do" method="post" enctype="multipart/form-data">
		<table id="userinserttable">
			<tr>
				<td><label for="img">프로필 사진</label></td>
				<td><input type="file" id="file" name="file" value="${users.img}"></td>
			</tr>
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="${users.user_id}" readonly></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw1" name="pw" class="pw" value="${users.pw}"></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw2" value="${users.pw}">
					<span id="alert-success" style="display: none;">✅</span>
    				<span id="alert-danger" style="display: none; color: #d92742;">❎</span>
				</td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" value="${users.name}"></td>
			</tr>
			<tr>
				<td><label for="eng_name">영문명</label></td>
				<td>
					<input type="text" id="first_name" name="first_name" value="${users.first_name}">
					<input type="text" id="last_name" name="last_name" value="${users.last_name}">
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td>
					<input type="text" id="tel1" name="tel1" value="${users.tel1}">
					<input type="text" id="tel2" name="tel2" value="${users.tel2}">
					<input type="text" id="tel3" name="tel3" value="${users.tel3}">
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>
					<input type="text" id="email1" name="email1" value="${users.email1}"><b>@</b>
					<input type="text" id="email2" name="email2" value="${users.email2}">
				</td>
			</tr>
			<tr style="margin-top:100px">
				<th colspan="2">
				<input type="submit" value="저장하기">
				</th>
			</tr>
		</table>
	</form>
<%-- 	<a href="u_deleteOK.do?user_id=${user.user_id}">회원탈퇴</a> --%>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
	$('.pw').focusout(function () {
        var pwd1 = $("#pw1").val();
        var pwd2 = $("#pw2").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                // 비밀번호 일치 이벤트 실행
            	$("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                // 비밀번호 불일치 이벤트 실행
            	  $("#alert-success").css('display', 'none');
                  $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
	
	</script>
</body>
</html>