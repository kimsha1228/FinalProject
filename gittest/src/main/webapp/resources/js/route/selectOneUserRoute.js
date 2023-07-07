//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

let result;

//onload...
$(function(){

	$.ajax({
		url : "jsonSelectOneRoute.do",
		data:{id:id},
		method:'GET',
		dataType:'json',
		success : function(response) {
			console.log('ajax...success:', response);
			result=response;
			let vo = ``;
			
			vo += `
				<tr>
					<td>${response.id}</td>
					<td>${response.route_name}</td>
					<td>
			`;
			
			response.actVos.forEach(function(e){
			   if (e.act_name != null) 
				 vo += `${e.act_name} → `;
			});
			
			// 마지막 화살표 날리기
 			vo = vo.substring(0, vo.length - 3);
			
			vo+= `</td>
					<td>${response.vcount}</td>
					<td>${response.likes}</td>
				</tr>
			`;
			
			$('#vos').html(vo); //테이블 띄우기
			
			//초기화
			vo=``;
			
			//체크박스 생성용
			response.actVos.forEach(function(e, index){
				if(index==0){
					vo += `
						<div>
							<label for="act${index+1}">${e.act_name}</label>
							<input type="checkbox" id="act${index+1}" name="${index+1}" checked>
							<button onclick="addWish('${user_id}',${e.id})">♥</button>
						</div>
					`;
				}else{
					vo += `
						<div>
							<label for="act${index+1}">${e.act_name}</label>
							<input type="checkbox" id="act${index+1}" name="${index+1}">
							<button onclick="addWish('${user_id}',${e.id})">♥</button>
						</div>
					`;
				}
			});
			
			$('#act_container').html(vo); //체크박스 띄우기
			
			//초기화
			vo=`
			루트 소개:<br>
				${response.content}
			`;
			$('#route_content').html(vo); //루트 소개 띄우기
			
			//checkbox event
			$('input[type=checkbox]').change(function() {
				var act_name;
			    var act_id;
			    var act_add;
				//체크한 체크박스에 따라 act_name1~5 act_id1~5가 act_name act_id에 삽입됨
				switch(this.name){
					case "1":
						act_name=response.actVos[0].act_name;
						act_id=response.actVos[0].id;
						act_add=response.actVos[0].add;
						break;
					case "2":
						act_name=response.actVos[1].act_name;
						act_id=response.actVos[1].id;
						act_add=response.actVos[1].add;
						break;
					case "3":
						act_name=response.actVos[2].act_name;
						act_id=response.actVos[2].id;
						act_add=response.actVos[2].add;
						break;
					case "4":
						act_name=response.actVos[3].act_name;
						act_id=response.actVos[3].id;
						act_add=response.actVos[3].add;
						break;
					case "5":
						act_name=response.actVos[4].act_name;
						act_id=response.actVos[4].id;
						act_add=response.actVos[4].add;
						break;
					default:
						alert("Something wrong..");
				}
		
			        //체크박스 이벤트 핸들러
			        if ($(this).is(':checked')) {
			            
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
			            addAddressToCoordinate(act_add,this.name);
			        }
			        else {
			            //해당 id=act_id? 의 div를 지운다
			            $('#' + act_id).remove();
			            
			           for(var i =0 ;i<orders.length;i++){
						    if(orders[i]==(this.name)){
						        removeMarker(i);
						        orders.splice(i,1);
						    }
						}
			        }
			    });
				    
			$('#act1').trigger('change');
		}, //end success
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end ajax()...

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

function likeUpRoute(value){
	console.log(value);
	$.ajax({
	    url: "likeUpRoute.do",
	    data: {id: value},
		method:'GET',
	    dataType:'json',
	    success: function(response) {
	        console.log("ajax success",response,response.result);
	        if(response.result=="NotOK"){
	        	alert("추천은 10초에 한번만 가능합니다");
	        }else if(response.result=="OK"){
	        	alert("루트를 추천했습니다");
	        }
	    },
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
}


