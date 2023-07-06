<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fxc9ew4qop"></script>
</head>
<body>
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-Map.html" target='_blank'>참고링크</a>
<br>

<div id="map" style="width:40%;height:400px;"></div>

<script>
	//F12 개발자 도구 콘솔에서 만져보자
	
	var map = new naver.maps.Map('map');

	var jeju = new naver.maps.LatLng(33.3590628, 126.534361);
	
	map.setCenter(jeju); // 중심 좌표 이동
	map.setZoom(13);     // 줌 레벨 변경
	
	var seoul = new naver.maps.LatLngBounds(
	    new naver.maps.LatLng(37.42829747263545, 126.76620435615891),
	    new naver.maps.LatLng(37.7010174173061, 127.18379493229875));
	
	map.fitBounds(seoul); // 좌표 경계 이동
	
	map.panBy(new naver.maps.Point(10, 10)); // 오른쪽 아래로 10 픽셀 이동
	
</script>
</body>
</html>