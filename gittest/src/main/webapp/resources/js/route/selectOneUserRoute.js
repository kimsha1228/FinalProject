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
	
	//checkbox event
	$('input[type=checkbox]').change(function() {
		var act_name;
	    var act_id;
	
		//체크한 체크박스에 따라 act_name1~5 act_id1~5가 act_name act_id에 삽입됨
		switch(this.name){
			case "1":
				act_name=act_name1;
				act_id=act_id1;
				break;
			case "2":
				act_name=act_name2;
				act_id=act_id2;
				break;
			case "3":
				act_name=act_name3;
				act_id=act_id3;
				break;
			case "4":
				act_name=act_name4;
				act_id=act_id4;
				break;
			case "5":
				act_name=act_name5;
				act_id=act_id5;
				break;
			default:
				alert("Something wrong..");
		}

        //체크박스 이벤트 핸들러
        if ($(this).is(':checked')) {
        	console.log(act_name);
            alert(`${act_name} is added`);
            
            //삽입할 HTML요소 구성
			var innerHTML = '';
			innerHTML += `<div id="${act_id}">`;
			innerHTML += `<p>${act_name}의 수량 선택</p>`;
			innerHTML += `<input type='hidden' name='act_id' value='${act_id}'/>`;
			innerHTML += `<input type="button" value="-" class="qtyminus minus" data-act-id="${act_id}" />`;
			innerHTML += `<input type="text" name="quantity" value="1" id="quantity" class="qty" />`;
			innerHTML += `<input type="button" value="+" class="qtyplus plus" data-act-id="${act_id}" />`;
			innerHTML += `</div>`;
			
            
            $('#quantityContainer').append(innerHTML);
        }
        else {
            alert(`${act_name} is removed`);
            //해당 id=act_id? 의 div를 지운다
            $('#' + act_id).remove();
        }
    });
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

  // Increment quantity
$(document).on('click', '.qtyplus', function() {
	var act_id = $(this).data('act-id');
	var quantityInput = $('#quantityContainer').find(`#${act_id} input[name=quantity]`);
	var currentQuantity = parseInt(quantityInput.val());
	quantityInput.val(currentQuantity + 1);
});

// Decrement quantity
$(document).on('click', '.qtyminus', function() {
	var act_id = $(this).data('act-id');
	var quantityInput = $('#quantityContainer').find(`#${act_id} input[name=quantity]`);
	var currentQuantity = parseInt(quantityInput.val());
	if (currentQuantity > 0) {
		quantityInput.val(currentQuantity - 1);
	}
});