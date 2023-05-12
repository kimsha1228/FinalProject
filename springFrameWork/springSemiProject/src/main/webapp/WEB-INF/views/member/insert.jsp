<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function checkID() {
		//2. jquery AJAX
		console.log(id);
		$.ajax({
			url:"json_idCheck.do",
			data:{id:$("#id").val()},
			dataType:'json',
			success:function(response){
				console.log('ajax...success:',response);
				let msg = response.result === 'OK'?'사용가능':'사용중';
				$("#result").html(msg);
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<form action="m_insertOK.do" method="post">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td><input type="text" id="id" name="id" value="tester"><button class="myButton" type="button" onclick="checkID()">ID 중복체크</button></td>
				<td id="result"></td>
			</tr>
			<tr>
				<td><label for="password">password:</label></td>
				<td><input type="password" id="password" name="password" value="hi11"></td>
			</tr>
			<tr>
				<td><label for="name">name:</label></td>
				<td><input type="text" id="name" name="name" value="yang양"></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="tel" value="011"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>

</body>
</html>