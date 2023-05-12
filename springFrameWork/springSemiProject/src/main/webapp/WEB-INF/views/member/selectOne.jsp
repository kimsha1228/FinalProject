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

//2.jquery ajax
	$(function(){
		console.log('selectOne...');
		$.ajax({
			//url:"json_selectOne.do?num="+${param.num}, 을 두줄로 풀면 밑줄이 된다
			url:"json_selectOne.do",
 			data:{num:${param.num}},
 			method:'GET',
			dataType:'json',
			success:function(vo2){
				console.log('ajax...success:',vo2);
				let tag_vo=`
					<tr>
	 					<td>\${vo2.num}</td>
	 					<td>\${vo2.id}</td>
	 					<td>\${vo2.password}</td>
	 					<td>\${vo2.name}</td>
	 					<td>\${vo2.tel}</td>
 					</tr>
				`;
				
				$("#vo").html(tag_vo);
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
	});
</script>
</head>
<body>
	<h1>회원정보</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<table id="memberList">
		<thead>
			<tr>
				<th>num</th>
				<th>id</th>
				<th>password</th>
				<th>name</th>
				<th>tel</th>
			</tr>
		</thead>
		<tbody id="vo">
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="m_update.do?num=${param.num}">회원수정</a> <a
					href="m_deleteOK.do?num=${param.num}">회원삭제</a></td>
			</tr>
		</tfoot>
	</table>

</body>
</html>