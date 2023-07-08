<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<jsp:include page="../css.jsp"></jsp:include>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload....");
});

function idCheck(){
	console.log("idCheck....",$('#id').val());
	
	$.ajax({
		url : "json_u_idCheck.do",
		data:{id:$('#id').val()},
		method:'GET',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			console.log('ajax...success:', obj.result);
			let msg = '';
			if(obj.result==='OK'){
				msg = '사용가능한 아이디입니다.';
			}else{
				msg = '사용중인 아이디입니다.';
			}
			$('#demo').text(msg);
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
	<h1>회원가입</h1>
	
	<form action="u_insertOK.do" method="post" enctype="multipart/form-data">
		<table id="memberList">
		    <tr>
				<td><label for="id">회원번호:</label></td>
				<td><input type="text" id="id" name="id" value="tester"></td>
			</tr>
			<tr>
				<td><label for="user_id"> user_id:</label></td>
				<td><input type="text" id="id" name="id" value="tester">
				<button type="button" onclick="idCheck()" class="myButton">ID중복체크</button>
					<span id="demo"></span></td>
			</tr>
			<tr>
				<td><label for="pw">pw:</label></td>
				<td><input type="password" id="pw" name="pw" value="hi11"></td>
			</tr>
			<tr>
				<td><label for="eng_name">eng_name:</label></td>
				<td><input type="text" id="name" name="name" value="tester"></td>
			</tr>
			<tr>
				<td><label for="region">region:</label></td>
				<td><input type="text" id="region" name="region" value="tester"></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="tel" value="tester"></td>
			</tr>
			<tr>
				<td><label for="email">email:</label></td>
				<td><input type="text" id="email" name="email" value="tester"></td>
			</tr>
			<tr>
				<td><label for="type">type:</label></td>
				<td><input type="text" id="type" name="type" value="tester"></td>
			</tr>
			<tr>
				<td><label for="point">point:</label></td>
				<td><input type="text" id="point" name="point" value="tester"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>