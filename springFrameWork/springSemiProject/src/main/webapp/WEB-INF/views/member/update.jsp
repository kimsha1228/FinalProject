<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	console.log('update...');
	$.ajax({
		//url:"json_selectOne.do?num="+${param.num}, 을 두줄로 풀면 밑줄이 된다
		url:"json_selectOne.do",
		data:{num:${param.num}},
		method:'GET',
		dataType:'json',
		success:function(vo2){
			console.log('ajax...success:',vo2);
			$('#span_num').text(vo2.num);
			$('#span_id').text(vo2.id);
			$('#num').val(vo2.num);
			$('#password').val(vo2.password);
			$('#name').val(vo2.name);
			$('#tel').val(vo2.tel);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});
});	
</script>
</head>
<body>
	<h1>update.jsp</h1>

	<form action="m_updateOK.do" method="post">
		<table id="memberList">
			<tr>
				<td><label for="num">num:</label></td>
				<td><span id="span_num"></span><input type="hidden" id="num"
					name="num" value=""></td>
			</tr>
			<tr>
				<td><label for="id">id:</label></td>
				<td><span id="span_id"></span></td>
			</tr>
			<tr>
				<td><label for="password">password:</label></td>
				<td><input type="password" id="password" name="password" value=""></td>
			</tr>
			<tr>
				<td><label for="name">name:</label></td>
				<td><input type="text" id="name" name="name" value=""></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="tel" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>

</body>
</html>