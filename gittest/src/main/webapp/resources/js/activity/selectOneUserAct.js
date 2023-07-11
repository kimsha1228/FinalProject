//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

//onload...
$(function(){

	//현재 상품의 이미지들 출력
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
	
	//후기 한개 출력용
	$.ajax({
		url : "json_selectOneComment.do",
		data:{act_id:id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			if(arr.length==0){
				vos += `	
					<span>후기가 비어있네요</span>
				`;
			}else{
				$.each(arr,function(vo){
	// 				console.log(arr[vo].name);
					vos += `	
						<span>후기가 있네요</span>
					`;
					
				});
			}
			$('#OneComment').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
			$('#OneComment').html('<p>댓글 불러오기 실패</p>');
		}
	});//end $.ajax()...
	
	//날짜 선택을 오늘로 변경
	var now = new Date();
	now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); //한국시간으로 변경
	document.getElementById('datePicker').value = now.toISOString().slice(0, 10); //자릿수짜르기
	document.getElementById('datePicker').setAttribute("min", now); //오늘 이전 날짜 설정 못하게
	
});
//end onload


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

function addWish(user_id){
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

function incrementQuantity() {
	var quantityInput = document.getElementById('quantity');
	var currentQuantity = parseInt(quantityInput.value);
	quantityInput.value = currentQuantity + 1;
}
function decrementQuantity() {
	var quantityInput = document.getElementById('quantity');
	var currentQuantity = parseInt(quantityInput.value);
	if (currentQuantity > 0) {
		quantityInput.value = currentQuantity - 1;
	}
}