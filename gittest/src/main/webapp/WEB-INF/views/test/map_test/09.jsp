<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>Geocoder 서브 모듈 3 </title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fxc9ew4qop&submodules=geocoder"></script>
</head>
<body>


<h1>프로젝트에 맞게 개조해보기 1</h1>
<pre>
Geocoder 서브 모듈의 Service 객체를 사용하여 
주소로 좌표를 검색(Geocode)
</pre>
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-3-geocoder-geocoding.example.html" target='_blank'> 튜토리얼 링크 </a><br>
<br>
<div class="search" style="">
	<input id="address" type="text" placeholder="검색할 주소" value="경기도 용인시 처인구 포곡읍 에버랜드로 199" />
	<input id="submit" type="button" value="주소 검색" />
</div>

<div id="map" style="width:100%;height:600px;"></div>
	
<script>

//id가 map인곳에 지도객체 생성
var map = new naver.maps.Map("map", {
    zoom: 16,
    mapTypeControl: true
});
var marker = new naver.maps.Marker({
    map: map
});

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

function initGeocoder() {
	
	//id가 address인 검색창
    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

	//id가 submit인 type=버튼인 input에 반응
    $('#submit').on('click', function(e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
    });

    searchAddressToCoordinate('경기도 용인시 처인구 포곡읍 에버랜드로 199');
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>
</body>
</html>