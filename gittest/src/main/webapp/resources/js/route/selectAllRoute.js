window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllRoute.do",
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
 						<a href="selectOneRoute.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.route_name}</td>
 					<td>${vo.summary}</td>
 					<td>
 				`;
 				
 				//루트들 삽입하는 부분
 				if (vo.act_name1 != null) 
				tag_vos += `${vo.act_name1} → `;
 				if (vo.act_name2 != null) 
				tag_vos += `${vo.act_name2} → `;
 				if (vo.act_name3 != null) 
				tag_vos += `${vo.act_name3} → `;
 				if (vo.act_name4 != null) 
				tag_vos += `${vo.act_name4} → `;
 				if (vo.act_name5 != null) 
				tag_vos += `${vo.act_name5} → `;
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 				</td>
 					<td>${vo.seller_id}</td>
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

function searchRoute(){
	
	console.log("searchList()...", user_id ,$('#searchKey').val(),$('#searchWord').val());
	
	$.ajax({
		url:"searchRoute.do",
		data:{
			seller_id:user_id,
			searchKey:$('#searchKey').val(),
			searchWord:$('#searchWord').val(),
			},
		method:'GET',
		dataType:'json',
				success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneRoute.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.route_name}</td>
 					<td>${vo.summary}</td>
 					<td>
 				`;
 				
 				//루트들 삽입하는 부분
 				if (vo.act_name1 != null) 
				tag_vos += `${vo.act_name1} → `;
 				if (vo.act_name2 != null) 
				tag_vos += `${vo.act_name2} → `;
 				if (vo.act_name3 != null) 
				tag_vos += `${vo.act_name3} → `;
 				if (vo.act_name4 != null) 
				tag_vos += `${vo.act_name4} → `;
 				if (vo.act_name5 != null) 
				tag_vos += `${vo.act_name5} → `;
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 				</td>
 					<td>${vo.seller_id}</td>
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