//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let searchWord = urlParams.get('searchWord');
console.log(searchWord);

window.onload = searchList(searchWord);

function searchList(searchWord){
	
//	console.log("searchList()...",$('#searchKey').val(),$('#searchWord').val());
//	console.log("searchList()...","%"+searchWord+"%");

	$.ajax({
		url:"jsonSearchAct.do",
		data:{
			searchKey:'act_name',
			//홈에서 검색하면서 넘어오면 후자, 검색버튼을 누르면 전자가 삽입됨
			searchWord:searchWord==undefined?$('#searchWord').val():searchWord,
			},
		method:'GET',
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
			console.log(response.length);
			let tag_vos='';
			//루프돌리는방법1
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
					<tr>
 					<td>				
 						<a href="selectOneUserAct.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.act_name}</td>
 					<td>${vo.content}</td>
 					<td>${vo.rate}</td>
 					<td>${vo.vcount}</td>
 					<td>${vo.tag}</td>
 					<td>${vo.add}</td>
 					<td>${vo.price}</td>
 					<td>${vo.act_date}</td>
 					<td>${vo.seller_id}</td>
 					<td>${vo.dest_id}</td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
			
			//검색결과 삽입
			let result=(searchWord==undefined?$('#searchWord').val():searchWord)+"의 검색결과";
			$("#searchresult").text(result);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
};//end searchList()