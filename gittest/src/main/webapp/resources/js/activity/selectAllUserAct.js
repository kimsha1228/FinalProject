//추천리스트 행수 갯수세기용
let rowCount=0;

$(function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectRecommendedAct.do",
		//data:{seller_id:user_id},
		dataType:'json',
		async : false,
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				rowCount++;
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneUserAct.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.act_name}</td>
 					<td>${vo.rate}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.tag}</td>
 					<td>${vo.price}</td>
 					<td><button class="wish" data-act_id="${vo.id}" data-arg1='${user_id}' data-arg2= '${vo.id}' data-arg3=${i})>♡</button></td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
	
	//초기 위시리스트 하트 빈하트 여부 확인
	$.ajax({
		url : "jsonselectAllWishList.do",
		data:{
			user_id:user_id
		},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			//사용자의 위시리스트 만큼 반복
			for(let i in response){
				let vo = response[i];
				
				//추천 리스트내의 요소에서 확인
				for(let j=0;j<rowCount;j++){
					if($(`.wish:eq(${j})`).attr('data-act_id')==vo.act_id){
					    $(`.wish:eq(${j})`).text('♥');
					}
				}
				
				//테이블내의 요소에서 확인
				for(let j=0;j<$("#vos2 tr").length;j++){
					if($(`#vos2 tr:eq(${j}) button`).attr('data-act_id')==vo.act_id){
					    $(`#vos2 tr:eq(${j}) button`).text('♥');
					}
				}
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
	//테이블을 간단하게 페이징 해주는 api
	$('#tableContainer table').DataTable({
		
	});
	
	//위시리스트 추가 함수
	$('.wish').click(function(){
		let param_user_id=$(this).data('arg1');
		let param_act_id=$(this).data('arg2');
		let $wishelement=$(this); //클릭한
	//$(this).text()=='♡'?$(this).text('♥'):$(this).text('♡');
		console.log("insertWishListOk로 넘겨줄 파라미터",param_user_id,param_act_id);
		$.ajax({
			url : "insertWishListOK.do",
			data:{
				act_id:param_act_id,
				user_id:param_user_id
			},
			method:'POST',
			dataType:'json',
			success : function(response) {
				console.log(response);
				if(response.result==='OK'){
					alert("위시리스트에 추가했습니다");
					$wishelement.text('♥');
				}else{
					alert("위시리스트에 제거했습니다");
					$wishelement.text('♡');
				}
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
		
	});
	
});
//end onload

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
 					<td><button id="wish${i}" class="${vo.id}" onclick="addWish('${user_id}','${vo.id}',${i})">♡</button></td>
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



// 테이블 클릭할때
$('#DataTables_Table_0_paginate').click(function(){
    
    //버튼을 클릭할떄
    $('#vos2 button').click(function(){
    console.log('haha5');
	});
	
	$.ajax({
		url : "jsonselectAllWishList.do",
		data:{
			user_id:user_id
		},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			//사용자의 위시리스트 만큼 반복
			console.log(rowCount);
			for(let i in response){
				let vo = response[i];
						console.log("확인1");
						console.log(vo);
						console.log(vo.act_id);
				//페이지내의 요소에서 확인
				for(let j=0;j<rowCount;j++){
					if($(`.wish:eq(${j})`).attr('data-act_id')==vo.act_id){
						console.log("확인2");
					    $(`.wish:eq(${j})`).text('♥');
					}
				}
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
	
});
//이하 페이징처리
//end 페이징