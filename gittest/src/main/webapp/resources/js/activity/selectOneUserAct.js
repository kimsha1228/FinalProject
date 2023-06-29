//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

$(function(){
	$.ajax({
		url : "jsonSelectAllImage.do",
		data:{act_id:id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			if(arr.length==0){
				vos += `	
					<img src="resources/uploadimg/thumb_default.png">
				`;
			}else{
				$.each(arr,function(vo){
	// 				console.log(arr[vo].name);
					vos += `	
						<img src="resources/uploadimg/thumb_${arr[vo].name}">
					`;
					
				});
			}
			$('#imageList').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
});