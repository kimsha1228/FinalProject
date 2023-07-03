window.onload = function(){
selectDest(1);
};//end onload

function selectDest(value){

	//셀러아이디와 선택된 여행지 아이디 기준으로 검색
	$.ajax({
		url:"jsonSelectAllAct.do",
		data:{
			seller_id:user_id,
			dest_id: value
		},
		dataType:'json',
		async:false,
		success:function(response){
			console.log('ajax...success:',response);
		
			let tag_vos='';
			tag_vos+='<select id="multiselect" name="rts" multiple>';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
					<option value="${vo.id}">${vo.act_name}</option>
				`;
			}
			tag_vos+='</select>';
	
	    	$('#rts').html(tag_vos);
		  
			//만약 추후 jquery multiselect 플러그인을 바꿀거면 여기를 바꾸면 됨
	    	$('#multiselect').multiSelect();
	      
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
};//end selectDest()