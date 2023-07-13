//추천리스트 행수 갯수세기용
let rowCount=0;

//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let param_searchWord = urlParams.get('searchWord');
console.log(param_searchWord);

window.onload = function(){
	searchList('');
	$('.search').val(param_searchWord);
	 // **********************************
	 //  tablesorter 페이징 옵션 변수
	 // **********************************
	  var pagerOptions = {
	
	    // target the pager markup - see the HTML block below
	    container: $(".tableContainer"),
	
	    // output string - default is '{page}/{totalPages}'
	    // possible variables: {size}, {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
	    // also {page:input} & {startRow:input} will add a modifiable input in place of the value
	    // In v2.27.7, this can be set as a function
	    // output: function(table, pager) { return 'page ' + pager.startRow + ' - ' + pager.endRow; }
	    output: '{startRow:input} – {endRow} / {totalRows} 번째',
	
	    // apply disabled classname (cssDisabled option) to the pager arrows when the rows
	    // are at either extreme is visible; default is true
	    updateArrows: true,
	
	    // starting page of the pager (zero based index)
	    page: 0,
	
	    // Number of visible rows - default is 10
	    size: 5,
	
	    // Save pager page & size if the storage script is loaded (requires $.tablesorter.storage in jquery.tablesorter.widgets.js)
	    savePages : true,
	
	    // Saves tablesorter paging to custom key if defined.
	    // Key parameter name used by the $.tablesorter.storage function.
	    // Useful if you have multiple tables defined
	    storageKey:'tablesorter-pager',
	
	    // Reset pager to this page after filtering; set to desired page number (zero-based index),
	    // or false to not change page at filter start
	    pageReset: 0,
	
	    // if true, the table will remain the same height no matter how many records are displayed. The space is made up by an empty
	    // table row set to a height to compensate; default is false
	    fixedHeight: false,
	
	    // remove rows from the table to speed up the sort of large tables.
	    // setting this to false, only hides the non-visible rows
	    // needed if you plan to add/remove rows with the pager enabled.
	    removeRows: false,
	
	    // If true, child rows will be counted towards the pager set size
	    countChildRows: false,
	
	    // css class names of pager arrows
	    cssNext: '.next', // next page arrow
	    cssPrev: '.prev', // previous page arrow
	    cssFirst: '.first', // go to first page arrow
	    cssLast: '.last', // go to last page arrow
	    cssGoto: '.gotoPage', // select dropdown to allow choosing a page
	
	    cssPageDisplay: '.pagedisplay', // location of where the "output" is displayed
	    cssPageSize: '.pagesize', // page size selector - select dropdown that sets the "size" option
	
	    // class added to arrows when at the extremes (i.e. prev/first arrows are "disabled" when on the first page)
	    cssDisabled: 'disabled', // Note there is no period "." in front of this class name
	    cssErrorRow: 'tablesorter-errorRow' // ajax error information row
	
	  };//end 페이징변수
	
	
	//테이블을 간단하게 페이징 해주는 api
	$("#tableContainer").tablesorter({
		widgets: ["filter"],
	    widgetOptions : {
		    // filter_anyMatch replaced! Instead use the filter_external option
		    // Set to use a jQuery selector (or jQuery object) pointing to the
		    // external filter (column specific or any match)
		    filter_external : '.search',
		    // add a default type search to the first name column
		    filter_defaultFilter: { 1 : '~{query}' },
		    // include column filters
		    filter_columnFilters: false,
		    filter_placeholder: { search : 'Search...' },
		    filter_saveFilters : true,
		    filter_reset: '.reset'
    	}
	})
    // bind to pager events
    // *********************
    .bind('pagerChange pagerComplete pagerInitialized pageMoved', function(e, c) {
      var msg = '"</span> event triggered, ' + (e.type === 'pagerChange' ? 'going to' : 'now on') +
        ' page <span class="typ">' + (c.page + 1) + '/' + c.totalPages + '</span>';
      $('#display')
        .append('<li><span class="str">"' + e.type + msg + '</li>')
        .find('li:first').remove();
    })

    // initialize the pager plugin
    // ****************************
    .tablesorterPager(pagerOptions);
	
	//tablesorter 내장 검색 옵션
	$('button[data-column]').on('click', function() {
	    var $this = $(this),
		totalColumns = $table[0].config.columns,
		col = $this.data('column'), // zero-based index or "all"
		filter = [];
	
	    // text to add to filter
		filter[ col === 'all' ? totalColumns : col ] = $this.text();
		$table.trigger('search', [ filter ]);
		return false;
	});
	
	
	//위시리스트 추가 함수
	$(document).on('click', '.wish', function() {
	  let param_user_id = $(this).data('arg1');
	  let param_act_id = $(this).data('arg2');
	  let $wishelement = $(this);
	
	  console.log("insertWishListOk로 넘겨줄 파라미터", param_user_id, param_act_id);
	
	  $.ajax({
	    url: "insertWishListOK.do",
	    data: {
	      act_id: param_act_id,
	      user_id: param_user_id
	    },
	    method: 'POST',
	    dataType: 'json',
	    success: function(response) {
	      console.log(response);
	      if (response.result === 'OK') {
	        alert("위시리스트에 추가했습니다");
	        $wishelement.text('♥');
	      } else {
	        alert("위시리스트에 제거했습니다");
	        $wishelement.text('♡');
	      }
	    },
	    error: function(xhr, status, error) {
	      console.log('xhr.status:', xhr.status);
	    }
	  });
	});
	
	//엔터키만 눌러도 searchList가 작동
	$('#searchWord').on('keydown', function(e) {
	    var keyCode = e.which;
	
	    if (keyCode === 13) { // Enter Key
	    	searchList();
	    }
	});
	
	$('button[data-column]').trigger("click");	
};//end onload

function searchList(searchWord){
	
	$.ajax({
		url:"jsonSearchAct.do",
		data:{
			searchKey:'act_name',
			//홈에서 검색하면서 넘어오면 후자, 검색버튼을 누르면 전자가 삽입됨
			searchWord:searchWord==undefined?$('#searchWord').val():searchWord,
			},
		method:'GET',
		dataType:'json',
		async : false,
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			//루프돌리는방법1
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
					<tr>
 					<td>				
 						<a href="selectOneAct.do?id=${vo.id}">${vo.id}</a>
 					</td>
 					<td>${vo.act_name}</td>
 					<td>${vo.rate}</td>
 					<td>${vo.price}</td>
 					<td><button class="wish" data-act_id="${vo.id}" data-arg1='${user_id}' data-arg2= '${vo.id}' data-arg3=${i})>♡</button></td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
			
			//검색결과 삽입
			console.log("asdf",param_searchWord);
			let result=param_searchWord+"의 검색결과";
			$("#searchresult").text(result);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
	});//end ajax
	
	//다시 위시리스트 하트 빈하트 여부 확인
	$.ajax({
		url : "jsonselectAllWishList.do",
		data:{
			user_id:user_id
		},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			console.log('WishList ajax...success:',response);
			//사용자의 위시리스트 만큼 반복
			for(let i in response){
				let vo = response[i];
				
				//테이블내의 요소에서 확인
				for(let j=0;j<$("#vos tr").length;j++){
					if($(`#vos tr:eq(${j}) button`).attr('data-act_id')==vo.act_id){
					    $(`#vos tr:eq(${j}) button`).text('♥');
					}
				}
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
};//end searchList()