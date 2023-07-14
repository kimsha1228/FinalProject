//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

//지우자
let temp;

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
		url : "json_comments_selectOne.do",
		data:{act_id:id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			temp=arr;
			let vos = ``;
			if(arr.id===0){
				vos += `	
					<span>후기가 비어있네요</span>
				`;
			}else{
				// 타임스탬프를 Date 객체로 변환
				const date = new Date(arr.com_date);
				// 년, 월, 일 추출
				const year = date.getFullYear();
				const month = String(date.getMonth() + 1).padStart(2, '0');
				const day = String(date.getDate()).padStart(2, '0');
				// 출력 형식에 맞게 조정
				const formattedDate = `${year}-${month}-${day}`;
				
				//객체에 삽입
				vos += `	
					<p>작성일자:${formattedDate}</p>
					<p>${arr.user_id}님: ${arr.content}</p>
					<p>♥:${arr.likes}</p>
				`;
			}
			$('#OneComment').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
			$('#OneComment').html('<p>댓글 불러오기 실패</p>');
		}
	});//end $.ajax()...
	
	//초기 위시리스트 하트 빈하트 여부 확인
	$.ajax({
		url : "jsonselectAllWishList.do",
		data:{
			user_id:user_id
		},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			//사용자의 위시리스트 만큼 반복
			for(let i in response){
				let vo = response[i];
				if($('#wish').attr('class')==vo.act_id){
				    $('#wish').text('♥');
				}
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
	//날짜 선택을 오늘로 변경
	var now = new Date();
	now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); //한국시간으로 변경
	document.getElementById('datePicker').value = now.toISOString().slice(0, 10); //자릿수짜르기
	document.getElementById('datePicker').setAttribute("min", now); //오늘 이전 날짜 설정 못하게
	
	//날짜를 제한하는
	var now_utc = Date.now(); //밀리초
	var timeOff = new Date().getTimezoneOffset()*60000; //분단위를 밀리초로 변환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0]; //오늘 날짜를 구함
	document.getElementById("datePicker").setAttribute("min", today); //date의 min 속성을 이용해 오늘 이전은 선택 불가능하게 설정
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
		success : function(response) {
			console.log(response);
			if(response.result==='OK'){
				alert("위시리스트에 추가했습니다");
				$('#wish').text('♥');
			}else{
				alert("위시리스트에 제거했습니다");
				$('#wish').text('♡');
			}
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

function insertOneCart() {
	//폼 id를 불러옴
	var form = document.getElementById("Reservation");
	var formData = new FormData(form);
	
	//ajax로 폼을 보냄
	$.ajax({
	  url: "insertOneCart.do",
	  data: formData,
	  dataType: 'json',
	  method: 'POST',
	  processData: false,
	  contentType: false,
	  success: function(response) {
	    console.log(response);
	    if(response.result=='OK'){
	    	alert("장바구니에 추가했습니다");
	    }else{
	    	alert("장바구니 넣는데 실패했습니다");
	    }
	  },
	  error: function(xhr, status, error) {
	    console.log('xhr.status:', xhr.status);
	    alert("장바구니 넣는데 실패했습니다");
	  }
	});

}