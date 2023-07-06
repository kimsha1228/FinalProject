<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>Geocoder 4 </title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fxc9ew4qop&submodules=geocoder"></script>
</head>
<body>


<h1>프로젝트에 맞게 개조해보기 2</h1>
<pre>
Geocoder 서브 모듈의 Service 객체를 사용하여 
두 주소를 마커표시하고 center를 중앙으로 옮기기
</pre>
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-3-geocoder-geocoding.example.html" target='_blank'> 튜토리얼 링크 </a><br>
<button onclick="addAddressToCoordinate('경기 용인시 처인구 포곡읍 전대리 495-5')">클릭1</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 가실리 131-1')">클릭2</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 전대리 157-20')">클릭3</button>
<button onclick="addAddressToCoordinate('경기도 용인시 처인구 포곡읍 유운리 409-3')">클릭4</button>
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

var marker = new naver.maps.Marker({
    map: map
});
var markerArray = new Array();

map.setCursor('pointer');

function searchAddressToCoordinate(address) {
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
            point = new naver.maps.Point(item.x, item.y);

        map.setCenter(point);
        marker.setPosition(point);
    });
}

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
            point = new naver.maps.Point(item.x, item.y);
			console.log(point);
		for(var i = 0 ; i<markerArray.length;i++){
			if(point==)
		}
		if(flag==1){
	        markerArray.push(new naver.maps.Marker({
	        	animation:2,
	            position: new naver.maps.LatLng(point),
	            map: map
	        }));
		}
        
        //두 좌표를 더해서 중간값으로 나눠보기
        var centerX = markerArray[0].getPosition().x + marker.getPosition().x;
//         console.log(marker2.getPosition().x);
//         console.log(marker.getPosition().x);
//         console.log(centerX);
//         console.log(centerX/2);
        var centerY = markerArray[0].getPosition().y + marker.getPosition().y;
//         console.log(marker2.getPosition().y);
//         console.log(marker.getPosition().y);
//         console.log(centerY);
//         console.log(centerY/2);
        point = new naver.maps.Point(centerX/2, centerY/2);
        
        //맵을 중앙으로 셋팅한다
        map.setCenter(point);
        
        flag=0;
    });
}

function initGeocoder() {
    searchAddressToCoordinate('경기도 용인시 처인구 포곡읍 에버랜드로 199');
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>
</body>
</html>