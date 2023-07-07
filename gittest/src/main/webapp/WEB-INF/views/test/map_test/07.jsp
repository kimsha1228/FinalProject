<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>Geocoder 서브 모듈1 </title>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fxc9ew4qop&submodules=geocoder"></script>
</head>
<body>
<pre>
주소 -> 좌표 검색(geocode) API 호출

Geocoder를 활용한 주소 JSON으로 받기
개발자 도구 콘솔에서 결과를 확인할것
</pre>
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-Geocoder-Geocoding.html" target='_blank'>링크</a>
<br>
<div id="map" style="width:40%;height:400px;"></div>
<script>
var result;
var items;

var map = naver.maps.Service.geocode({
	//검색할
    query: '경기 용인시 처인구 포곡읍 에버랜드로 199'
}, function(status, response) {
	//불러오는데 실패했을경우
    if (status !== naver.maps.Service.Status.OK) {
        return alert('Something wrong!');
    }
	
    console.log(response); //결과 전체 출력
    result = response.v2, // 검색 결과의 컨테이너
    items = result.addresses; // 검색 결과의 배열
	console.log(result);
	console.log(items);
    // do Something
});

console.log(items[0].roadAddress); //도로명 주소
console.log(items[0].jibunAddress); //지번 주소
console.log(items[0].x); //latlng의 lat
console.log(items[0].y); //latlng의 lng

</script>
</body>
</html>