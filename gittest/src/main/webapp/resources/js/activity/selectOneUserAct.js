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

//클릭시 현재 주소를 복사 
//https://developer.mozilla.org/en-US/docs/Web/API/Clipboard/write 참조함
function copyLink() {
  const type = "text/plain";
  const blob = new Blob([window.location.href], { type });
  const data = [new ClipboardItem({ [type]: blob })];

  navigator.clipboard.write(data).then(
    () => {
      window.alert('클립보드에 복사 했습니다');
    },
    () => {
      window.alert('클립보드 복사 실패');
    }
  );
}

function addWish(){
	$.ajax({
		url : "insertWishListOK.do",
		data:{
			act_id:id,
			user_id:user_id
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