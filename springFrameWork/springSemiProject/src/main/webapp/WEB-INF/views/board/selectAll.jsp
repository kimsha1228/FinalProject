<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			url:"json_b_selectAll.do",
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
	 						<a href="b_selectOne.do?wnum=\${vo.wnum}">\${vo.wnum}</a>
	 					</td>
	 					<td>\${vo.title}</td>
	 					<td>\${vo.writer}</td>
	 					<td>\${vo.wdate}</td>
	 					<td>\${vo.vcount}</td>
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
		console.log("searchList()...",$('#searchKey').val(),$('#searchWord').val());
		
		$.ajax({
			url:"json_b_searchList.do",
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
	 						<a href="b_selectOne.do?wnum=\${vo.wnum}">\${vo.wnum}</a>
	 					</td>
	 					<td>\${vo.title}</td>
	 					<td>\${vo.writer}</td>
	 					<td>\${vo.wdate}</td>
	 					<td>\${vo.vcount}</td>
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
<body>
	<h1>글 목록</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>
		<select name="searchKey" id="searchKey">
			<option value="title">title</option>
			<option value="content">content</option>
		</select>
		<input type="text" name="searchWord" id="searchWord" value="sp">
		<button class="myButton" onclick="searchList()" >검색</button>

	<table border="1" id="boardList">
	<thead>
		<tr>
			<th>wnum</th>
			<th>title</th>
			<th>writer</th>
			<th>wdate</th>
			<th>vcount</th>
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