//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let answer_num = urlParams.get('num');
console.log(answer_num);

$(function(){
	$.ajax({
		url : "jsonSelectAllImage.do",
		data:{answer_num:answer_num},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			if(arr.length==0){
				vos += `	
					<li><img src="resources/uploadimg/thumb_default.png"></li>
				`;
			}else{
				$.each(arr,function(vo){
	// 				console.log(arr[vo].name);
					vos += `	
						<li><img src="resources/uploadimg/thumb_${arr[vo].name}"></li>
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