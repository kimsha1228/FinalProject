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

</head>
<script type="text/javascript">
$(function(){
	console.log('b_selectOne...',${param.wnum});
	$.ajax({
		//url:"json_selectOne.do?num="+${param.num}, 을 두줄로 풀면 밑줄이 된다
		url:"json_b_selectOne.do",
		data:{wnum:${param.wnum}},
		method:'GET',
		dataType:'json',
		success:function(vo2){
			console.log('ajax...success:',vo2);
			$("#wnum").text(vo2.wnum);
			$('#title').text(vo2.title);
			$('#content').text(vo2.content);
			$('#wdate').text(vo2.wdate);
			$('#writer').text(vo2.writer);
			$('#vcount').text(vo2.vcount);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});
});	//end b_selectOne

	function selectAll(cnum=0){
		console.log('selectAll()...cnum:',cnum);
		$.ajax({
			url:"c_selectAll.do", //잘 넘어가는지는 이 서블릿에서 확인 
 			data:{
 				wnum:${param.wnum},
			},
 			method:'GET',
			dataType:'json',
			success:function(response){
				console.log('ajax...success:',response);
				let tag_vos='';
				//루프돌리는방법1
				for(let i in response){
					let vo = response[i];
					
					//댓글수정용 코드
					let tag_td=`<td>\${vo.content}</td>`;
					//그냥 코드라서 바로 vo.cnum으로 넣는다
					if(cnum==vo.cnum){
						tag_td=`<td>
						<input type="text" value="\${vo.content}" id="input_content">
						<button onclick="updateOK(\${vo.cnum})">수정완료</button>
						</td>`;
					}
					
					//로그인한사람 확인용 코드
					let tag_div= ``;
					//로그인한 사람이 있으면
					if('${user_id}'===vo.writer){
						tag_div= `
						<div>
	 						<button onclick="selectAll(\${vo.cnum})">댓글수정</button>
	 						<button onclick="deleteOK(\${vo.cnum})">댓글삭제</button>
 						</div>
						`;
					}
					
					//본격적인 삽입
					tag_vos+=`
						<tr>
							<td>\${vo.cnum}</td>
	 						\${tag_td}
	 						<td>\${vo.writer}</td>
	 						<td>\${vo.wdate}</td>
	 						<td>\${tag_div}</td>
	 					</tr>
					`;
				}
				
// 				$.each(response,function(index,vo){
// 					console.log(vo);
// 					tag_vos+=`
// 						<tr>
// 							<td>\${vo.cnum}</td>
// 	 						<td>\${vo.writer}</td>
// 	 						<td>\${vo.content}</td>
// 	 						<td>\${vo.wdate}</td>
// 	 						<td><button onclick="deleteOK(\${vo.cnum})">댓글삭제</button></td>
// 	 					</tr>
// 					`;
// 				});
				$('#comm_list').html(tag_vos);
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
		
	}

	function insertOK(){
		console.log('insertOK()....');
		$.ajax({
			url:"c_insertOK.do", //잘 넘어가는지는 이 서블릿에서 확인 
 			data:{
 				wnum:${param.wnum},
 				content:$('#comm_content').val(),
 				writer:'${user_id}'
			},
 			method:'GET',
			dataType:'json',
			success:function(obj){
				console.log('ajax...success:',obj);//{"result":"1"}
				if(obj.result==1) selectAll();
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
		
	}//end insertOK

	
	function updateOK(cnum=0){
		console.log('updateOK()....',cnum);
		console.log('수정된 댓글:',$('#input_content').val());
		
		$.ajax({
			url:"c_updateOK.do", //잘 넘어가는지는 이 서블릿에서 확인 
 			data:{
 				cnum:cnum,
 				content:$('#input_content').val()
			},
 			method:'GET',
			dataType:'json',
			success:function(obj){
				console.log('ajax...success:',obj);//{"result":"1"}
				if(obj.result==1) selectAll();
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
	}//end updateOK
	
	function deleteOK(cnum=0){
		console.log('deleteOK()....',cnum);
		$.ajax({
			url:"c_deleteOK.do", //잘 넘어가는지는 이 서블릿에서 확인 
 			data:{
 				cnum:cnum
			},
 			method:'GET',
			dataType:'json',
			success:function(obj){
				console.log('ajax...success:',obj);//{"result":"1"}
				if(obj.result==1) selectAll();
			},
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});
			
	}//end deleteOK
</script>
<body onload="selectAll()">
	<h1>글 정보</h1>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<table id="memberList">

		<tbody>
			<tr>
				<th>wnum</th>
				<td id="wnum"></td>
			</tr>
			<tr>
				<th>title</th>
				<td id="title"></td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<p id="content"></p>
				</td>
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
			<tr id="b_up_del">
				<td colspan="6">
					<div>
						<a href="b_update.do?wnum=${param.wnum}">글수정</a>
						<a href="b_deleteOK.do?wnum=${param.wnum}">글삭제</a>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	<h3>댓글 작성</h3>
	<table border="1">
	
			<tr>
				<td colspan="2"><input type="text" id="comm_content" value="댓글입니다."></td>
			</tr>
			<tr>
				<td><button onclick="insertOK()">작성완료</button></td>
			</tr>
	</table>
	<hr>
	<h3>댓글 리스트</h3>
	<table border="1">
		<thead>
			<tr>
				<td>댓글번호</td>
				<td>내용</td>
				<td>작성자</td>
				<td>작성시간</td>
				<td></td>
			</tr>
		</thead>
		<tbody id="comm_list">
		
		</tbody>
	</table>
	<script type="text/javascript">
// 		if('${user_id}'==='${vo2.writer}'){ //작정자와 로그인한 사람이 같으면
// 			$('#b_up_del').show();
// 		}else{
// 			$('#b_up_del').hide();
// 		}
	</script>
</body>
</html>