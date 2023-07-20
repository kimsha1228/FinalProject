<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload....");
});

function idCheck(){
	console.log("idCheck....",$('#id').val());
	
	$.ajax({
		url : "json_u_idCheck.do",
		data:{user_id:$('#user_id').val()},
		method:'GET',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			console.log('ajax...success:', obj.result);
			let msg = '';
			if(obj.result==='OK'){
				alert("사용가능한 아이디입니다.");
// 				msg = '사용가능한 아이디입니다.';
			}else{
				alert("사용중인 아이디입니다.");
// 				msg = '사용중인 아이디입니다.';
			}
// 			$('#idCheck').text(msg);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
}//end idCheck()...

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="loginform">
	<h3>회원가입</h3>
	<form action="u_insertOK.do" method="post">
		<table id="userinserttable">
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" value="" autofocus required></td>
			</tr>
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="" required>
					<button type="button" onclick="idCheck()">ID중복체크</button>
					<span id="idCheck"></span>
				</td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw1" name="pw" class="pw" value="" required></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 확인</label></td>
				<td><input type="password" id="pw2" class="pw" value="" required>
					<span id="alert-success" style="display: none;">✅</span>
    				<span id="alert-danger" style="display: none; color: #d92742;">❎</span>
    			</td>
			</tr>
			
			<tr>
				<td><label for="name">영문명</label></td>
				<td>
					<input type="text" id="first_name" name="first_name" value="" placeholder="영문 이름" size="10.5" required>
					<input type="text" id="last_name" name="last_name" value="" placeholder="영문 성" size="10.5" required>
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td>
					<input type="text" id="tel1" name="tel1" value="010" size="5" required>
					<input type="text" id="tel2" name="tel2" value="" size="5" required>
					<input type="text" id="tel3" name="tel3" value="" size="5" required>
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>
					<input type="text" id="email1" name="email1" placeholder="email" value="" size="10" required><b>@</b>
					<input type="text" id="email2" name="email2" placeholder="naver.com" value="" size="10" required>
				</td>
			</tr>
				
			<tr>
				<td></td>
				<td>
					<input type="checkbox" id="type" name="type" value="2">판매자 가입 체크해주세요
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="회원가입하기" id="uinsertbtn" class="myButton"></td>
			</tr>
		</table>
	</form>
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