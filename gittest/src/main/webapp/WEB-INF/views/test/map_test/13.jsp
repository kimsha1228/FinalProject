<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>Geocoder 7 </title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}&submodules=geocoder"></script>
</head>
<body>


<h1>프로젝트에 맞게 개조해보기 5</h1>
<div>
	Geocoder 서브 모듈의 Service 객체를 사용하여<br>
	주소를 마커표시하고 center를 중앙으로 옮기기<br>
	그리고 찍은 순서대로 마커끼리 선으로 연결하기<br>
	<br><br>
	이제 새로 찍을때마다 최단거리로 그려지는걸 보고싶다
	<br><br>
</div>


<button onclick="addAddressToCoordinate('경기 용인시 처인구 포곡읍 전대리 495-5')">클릭1</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 가실리 131-1')">클릭2</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 전대리 157-20')">클릭3</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 유운리 409-3')">클릭4</button>
<br>
<br>
<div>
	<input id="address" type="number" placeholder="제거할 마커 입력"/>
	<input id="submit" type="button" value="제거" />
</div>
<br>
<br>

<div id="map" style="width:100%;height:600px;"></div>
	
<script>
//변수제어용 플래그
let flag = 0;
//id가 map인곳에 지도객체 생성
var map = new naver.maps.Map("map", {
    zoom: 16,
    mapTypeControl: true
});
//마커 저장용 배열
var markerArray = new Array();
//폴리라인 좌표 저장용 배열
var arrayOfCoords = new Array();
//폴리라인 객체
let polyline = new naver.maps.Polyline({
    map: map,
    path: [new naver.maps.LatLng(36.734249797, 127.410516004)], //임의의 값
    startIcon: 3,//시작점은 동그라미
    startIconSize: 20,
    endIcon: 2,//끝점은 화살표
    endIconSize: 20,
});


map.setCursor('pointer');

function addAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('오류!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('검색결과 갯수: ' + response.v2.meta.totalCount);
        }

        var item = response.v2.addresses[0],
        //검색해서 나온 결과의 좌표를 셋팅
            point = new naver.maps.Point(item.x, item.y);
			
		flag=1;
		
		//이미 찍힌 마커인지 체크, 
		for(var i = 0 ; i<markerArray.length;i++){
			if(	(markerArray[i].getPosition().x===point.x)&&
				(markerArray[i].getPosition().y===point.y))
			flag=0;
		}
		
		//찍힌 마커가 없을때만 배열에 새 마커 추가
		if(flag==1){
	        markerArray.push(new naver.maps.Marker({
	        	animation:2,
	            position: new naver.maps.LatLng(point),
	            map: map
	        }));
			//폴리라인 그리기용 푸쉬
			arrayOfCoords.push(markerArray[i].position)
		}
        
        //좌표들을 더해서 중간값 구하기
        var centerX=0;
		var centerY=0;
		//현재 마커배열 길이만큼 반복
		for(var i = 0 ; i<markerArray.length;i++){
			centerX+=markerArray[i].getPosition().x;
			centerY+=markerArray[i].getPosition().y;
		}
		//평균 계산
		centerX=centerX/markerArray.length;
		centerY=centerY/markerArray.length;
		//map에 넣을 좌표 계산
        point = new naver.maps.Point(centerX, centerY);
		
        //맵을 좌표로 셋팅한다
        map.setCenter(point);
        
		//arrayOfCoords에 저장된 좌표들을 가져와서 폴리라인을 그린다
        if(markerArray.length>1){
			polyline.setPath(arrayOfCoords);
        }
        flag=0;
    });
}

function initGeocoder() {
	
	//엔터키만 눌러도 submit이 작동함
    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
        	removeMarker($('#address').val());
        }
    });

	//submit 이벤트
    $('#submit').on('click', function(e) {
        e.preventDefault();
        removeMarker($('#address').val());
    });
	
	addAddressToCoordinate('경기도 용인시 처인구 포곡읍 에버랜드로 199');
}

function removeMarker(value) {
	if(markerArray[value-1]===undefined){
		alert('잘못 입력하셨습니다');	
	}else{
		markerArray[value-1].setMap(null);
		polyline.getPath().removeAt(value-1);
		markerArray.splice(value-1,1);
	}
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>
</body>
</html>