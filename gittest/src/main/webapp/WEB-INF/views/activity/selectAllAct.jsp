<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
// 		url : "mongo_findAll.do",
		url : "mongo_findAll_doc.do",
		data:{},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			$.each(arr,function(index,vo){
				console.log(index,vo);
// 				let regdate = new Date(vo._id.date).toLocaleString();
// 				vos += `
// 					<tr>
// 						<td><a href="mongo_selectOne.do?mid=\${vo._id}">\${index+1}</a></td>
// 						<td>\${vo.id}</td>
// 						<td>\${vo.pw}</td>
// 						<td>\${vo.name}</td>
// 						<td>\${vo.tel}</td>
// 						<td>\${regdate}</td>
// 					</tr>
// 				`;
				
			});
			$('#vos').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
	
});

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>상품목록(seller01이라 가정)</h1>
	
	<div style="padding:5px">
		<form action="searchAct.do">
			<select name="searchKey" id="searchKey">
				<option value="act_name">act_name</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="에버랜드">
			<input type="submit" value="검색">
		</form>
	</div>

	<table>
	<thead>
		<tr>
			<th>id</th>
			<th>act_name</th>
			<th>content</th>
			<th>rate</th>
			<th>vcount</th>
			<th>tag</th>
			<th>add</th>
			<th>price</th>
			<th>act_date</th>
			<th>seller_id</th>
			<th>dest_id</th>
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