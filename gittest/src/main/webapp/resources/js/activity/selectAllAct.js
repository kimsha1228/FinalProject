window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllAct.do",
		//세션에서 아이디를 가져온다!
		data:{seller_id:user_id},
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneAct.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.act_name}</td>
 					<td>${vo.content}</td>
 					<td>${vo.rate}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.tag}</td>
 					<td>${vo.add}</td>
 					<td>${vo.price}</td>
 					<td>${vo.act_date}</td>
 					<td>${vo.seller_id}</td>
 					<td>${vo.dest_id}</td>
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
	
	console.log("searchList()...", user_id ,$('#searchKey').val(),$('#searchWord').val());
	
	$.ajax({
		url:"jsonSearchAct.do",
		data:{
			seller_id:user_id,
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
 						<a href="selectOneAct.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.act_name}</td>
 					<td>${vo.content}</td>
 					<td>${vo.rate}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.tag}</td>
 					<td>${vo.add}</td>
 					<td>${vo.price}</td>
 					<td>${vo.act_date}</td>
 					<td>${vo.seller_id}</td>
 					<td>${vo.dest_id}</td>
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