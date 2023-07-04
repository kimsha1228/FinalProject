//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

//onload...
$(function(){
	//날짜 선택을 오늘로 변경
	var now = new Date();
	now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); //한국시간으로 변경
	document.getElementById('datePicker').value = now.toISOString().slice(0, -14); //자릿수짜르기
});
//end onload

function addWish(user_id,act_id){
	let param_user_id=user_id;
	let param_act_id=act_id;
	console.log("insertWishListOk로 넘겨줄 파라미터",param_user_id,param_act_id);
	$.ajax({
		url : "insertWishListOK.do",
		data:{
			act_id:param_act_id,
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