$(function(){
	$.ajax({
		url : "jsonSelectAllImage.do",
		data:{act_id:act_id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			$.each(arr,function(vo){
// 				console.log(arr[vo].name);
				vos += `	
					<img width="100px" src="resources/uploadimg/thumb_${arr[vo].name}">
				`;
				
			});
			$('#imageList').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
});