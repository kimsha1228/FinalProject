$(function(){
	//인기 액티비티 (조회수순)
	$.ajax({
		url:"jsonSelectPopularAct.do",
		//data:{seller_id:user_id},
		dataType:'json',
		success:function(response){
			let tag_vos='';
			tag_vos+=`
					<h3>인기 액티비티(조회수순)</h3>
					<div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
			`;
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<a class="col-3" href="selectOneUserAct.do?id=${vo.id}">
					<div class="card card-block" style="align-items: center;">
						<img class="card-img-top" width='150px' height='150px' src="resources/uploadimg/thumb_${vo.eng_name}">
						<div class="card-act-name" style="align-self: normal;">${vo.act_name}</div>
						<span class="stars">${vo.rate}</span>
						<div>${vo.price}원</div>
					</div>
				</a>
				`;
			}
			tag_vos+=`
			</div>
			`;
			$("#recommended").html(tag_vos);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
	
	
	//모든 상품 출력
	$.ajax({
		url:"jsonSelectAllUserActImg.do",
		dataType:'json',
		success:function(response){
			let tag_vos='';
			tag_vos+=`
					<h3>모든 상품입니다</h3>
					<div class="scrolling-wrapper row flex-row mt-4 pb-4 pt-2" 
						 style="max-height: 500px; overflow-y: scroll;"
					>			
			`;
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<a class="col-3" href="selectOneUserAct.do?id=${vo.id}">
					<div class="card card-block" style="align-items: center;">
						<img class="card-img-top" width='150px' height='150px' src="resources/uploadimg/thumb_${vo.eng_name}">
						<div class="card-act-name" style="align-self: normal;">${vo.act_name}</div>
						<span class="stars">${vo.rate}</span>
						<div>${vo.price}원</div>
					</div>
				</a>
				`;
			}
			
			tag_vos+=`
			</div>
			`;
			$("#allAct").html(tag_vos);
			
			//별을 적용
			$('span.stars').stars();
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
		
});
//end onload

	$.fn.stars = function() {
	    return $(this).each(function() {
	        // Get the value
	        var val = parseFloat($(this).html());
	        // Make sure that the value is in 0 - 5 range, multiply to get width
	        var size = Math.max(0, (Math.min(5, val))) * 16;
	        // Create stars holder
	        var $span = $('<span />').width(size);
	        // Replace the numerical value with stars
	        $(this).html($span);
	    });
	}