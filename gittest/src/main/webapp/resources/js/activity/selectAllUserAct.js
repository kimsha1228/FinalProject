window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectRecommendedAct.do",
		//data:{seller_id:user_id},
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
 					<td>${vo.rate}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.tag}</td>
 					<td>${vo.price}</td>
 					<td><button onclick="addWish(user_id,${vo.id})">♥</button></td>
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
 					<td>${vo.rate}</td>
 					<td>${vo.price}</td>
 					<td><button onclick="addWish(user_id,${vo.id})">♥</button></td>
 				</tr>
				`;
			}
			
			$("#vos2").html(tag_vos);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
};//end searchList()

function addWish(user_id,id){
	let param_user_id=user_id;
	console.log("insertWishListOk로 넘겨줄 파라미터",param_user_id,id);
	$.ajax({
		url : "insertWishListOK.do",
		data:{
			act_id:id,
			user_id:param_user_id
		},
		method:'POST',
		dataType:'json',
		success : function() {
		// TODO addWish Later!
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
}