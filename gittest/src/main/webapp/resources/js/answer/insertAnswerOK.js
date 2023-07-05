window.onload = function(){
insertAnswer(1);
};//end onload

function insertAnswer(value){

	$.ajax({
		url:"jsonSelectAllAct.do",
		data:{
			user_id:user_id,
			act_name: value
		},
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
	
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
};//end insertAnswer()