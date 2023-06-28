window.onload = function(){
	console.log('');
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllAct.do",
		//추후 세션의 user_id로 변경 될 예정
		data:{seller_id:'seller01'},
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
	
	console.log("searchList()...",$('#searchKey').val(),$('#searchWord').val());
	
	$.ajax({
		url:"jsonSearchAct.do",
		data:{
			seller_id:'seller01',
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