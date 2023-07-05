window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllRoute.do",
		data:{dest_id:dest_id},
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneUserRoute.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.route_name}</td>
 					<td>${vo.summary}</td>
 					<td>
 				`;
 				
 				//루트들 삽입하는 부분
 				if (vo.act_name1 != null) 
				tag_vos += `${vo.act_name1} → `;
 				if (vo.act_name2 != null) 
				tag_vos += `${vo.act_name2} → `;
 				if (vo.act_name3 != null) 
				tag_vos += `${vo.act_name3} → `;
 				if (vo.act_name4 != null) 
				tag_vos += `${vo.act_name4} → `;
 				if (vo.act_name5 != null) 
				tag_vos += `${vo.act_name5} → `;
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 				</td>
 					<td>${vo.dest_id}</td>
 					<td>${vo.date}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.likes}</td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
			$("#myTable").tablesorter({
		 	})
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
		
	});//end ajax
	
	
};//end onload


//참고한 사이트 https://mottie.github.io/tablesorter/docs/example-trigger-sort.html
function sortFunction(value){
	switch (value) {
		//최근 등록
		case 1:
			//date의 칼럼은 6번째 즉 5다
 			$("#myTable").trigger("sorton", [ [[5,1]] ]);
			break;
			
		//오래된 순
		case 2:
			//date의 칼럼은 6번째 즉 5다
 			$("#myTable").trigger("sorton", [ [[5,0]] ]);
			break;

		//조회순
		case 3:
//   		$("#myTable").find("th:contains(vcount)").trigger("sort");
			$("#myTable").trigger("sorton", [ [[6,1]] ]);
			break;
		
		//추천순
		case 4:
// 			$("#myTable").find("th:contains(likes)").trigger("sort");
 			$("#myTable").trigger("sorton", [ [[7,1]] ]);
 			break;
 			
 		//정렬 초기화
 		case 5:
 			$("#myTable").trigger("sortReset");
 		break;
		default:
    	console.log(`error sorting.`);
	}
}