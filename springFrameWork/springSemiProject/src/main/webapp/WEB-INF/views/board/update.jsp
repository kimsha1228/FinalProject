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
	console.log('b_update...',${param.wnum});
	$.ajax({
		//url:"json_selectOne.do?num="+${param.num}, 을 두줄로 풀면 밑줄이 된다
		url:"json_b_selectOne.do",
		data:{wnum:${param.wnum}},
		method:'GET',
		dataType:'json',
		success:function(vo2){
			console.log('ajax...success:',vo2);
			tag_wnum=`
				\${vo2.wnum}<input type="hidden" id="wnum" name="wnum" value="\${vo2.wnum}">
			`;
			$("#wnum").html(tag_wnum);
			$('#title').val(vo2.title);
			$('#content').text(vo2.content);
			$('#wdate').text(vo2.wdate);
			$('#writer').text(vo2.writer);
			$('#vcount').text(vo2.vcount);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});
});	
</script>
</head>
<body>
	<h1>글 수정</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<form action="b_updateOK.do" method="post">
		<table id="memberList">
			<tbody>
				<tr>
					<th>wnum</th>
					<td id="wnum"></td>
				</tr>
				<tr>
					<th>title</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<th>content</th>
					<td><textarea id="content" rows="10" cols="25" name="content"></textarea></td>
				</tr>
				<tr>
					<th>wdate</th>
					<td id="wdate"></td>
				</tr>
				<tr>
					<th>writer</th>
					<td id="writer"></td>
				</tr>
				<tr>
					<th>vcount</th>
					<td id="vcount"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6"><input type="submit" value="수정완료"></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>