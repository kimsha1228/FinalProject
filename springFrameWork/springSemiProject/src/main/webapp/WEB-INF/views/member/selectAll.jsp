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
	window.onload = function(){
		//2. jquery AJAX
		$.ajax({
			url:"json_selectAll.do",
// 			data:{id:$("#id").val()},
			dataType:'json',
			success:function(response){
				console.log('ajax...success:',response);
				console.log(response.length);
				let tag_vos='';
				//루프돌리는방법1
				for(let i in response){
					let vo = response[i];
					tag_vos+=`
						<tr>
	 					<td>				
	 						<a href="m_selectOne.do?num=\${vo.num}">\${vo.num}</a>
	 					</td>
	 					<td>\${vo.id}</td>
	 					<td>\${vo.password}</td>
	 					<td>\${vo.name}</td>
	 					<td>\${vo.tel}</td>
	 				</tr>
					`;
				}
				
				$("#vos").html(tag_vos);
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});//end ajax

	};//end onload
	
	function searchList(){
		console.log("searchList()...");
		
		$.ajax({
			url:"json_searchList.do",
			data:{
				searchKey:$('#searchKey').val(),
				searchWord:$('#searchWord').val(),
				},
			method:'GET',
			dataType:'json',
			success:function(response){
				console.log('ajax...success:',response);
				console.log(response.length);
				let tag_vos='';
				//루프돌리는방법1
				for(let i in response){
					let vo = response[i];
					tag_vos+=`
						<tr>
	 					<td>				
	 						<a href="m_selectOne.do?num=\${vo.num}">\${vo.num}</a>
	 					</td>
	 					<td>\${vo.id}</td>
	 					<td>\${vo.password}</td>
	 					<td>\${vo.name}</td>
	 					<td>\${vo.tel}</td>
	 				</tr>
					`;
				}
				
				$("#vos").html(tag_vos);
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});//end ajax
	};//end searchList()
</script>
</head>
<body> <!--  onload="selectAll()"-->
	<h1>회원목록 ${user_id} ${user_name}</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<select name="searchKey" id="searchKey">
		<option value="name">name</option>
		<option value="tel">tel</option>
	</select>
	<input type="text" name="searchWord" id="searchWord" value="ki">
	<button onclick="searchList()" class="myButton">검색</button>

	<table border="1" id="memberList">
	<thead>
		<tr>
			<th>num</th>
			<th>id</th>
			<th>password</th>
			<th>name</th>
			<th>tel</th>
		</tr>
	</thead>
	<tbody id="vos">

	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">1 2 3 4 5</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>



