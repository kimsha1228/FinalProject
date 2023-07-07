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
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-4-Shape.html" target='_blank'>선긋기</a>
<a href="https://navermaps.github.io/maps.js.ncp/docs/naver.maps.Polyline.html#toc25__anchor" target='_blank'>폴리라인 옵션들</a>
<br>
<div id="map" style="width:40%;height:400px;"></div>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3700065, 127.121359),
    zoom: 14
});

var polyline = new naver.maps.Polyline({
    map: map,
    path: [
        new naver.maps.LatLng(37.359924641705476, 127.1148204803467),
        new naver.maps.LatLng(37.36343797188166, 127.11486339569092),
        new naver.maps.LatLng(37.368520071054576, 127.11473464965819),
        new naver.maps.LatLng(37.3685882848096, 127.1088123321533),
        new naver.maps.LatLng(37.37295383612657, 127.10876941680907),
    ],
	startIcon:1,
	endIcon:2
});

var polygon = new naver.maps.Polygon({
    map: map,
    paths: [
        [
            new naver.maps.LatLng(37.37544345085402, 127.11224555969238),
            new naver.maps.LatLng(37.37230584065902, 127.10791110992432),
            new naver.maps.LatLng(37.35975408751081, 127.10795402526855),
            new naver.maps.LatLng(37.359924641705476, 127.11576461791992),
            new naver.maps.LatLng(37.35931064479073, 127.12211608886719),
            new naver.maps.LatLng(37.36043630196386, 127.12293148040771),
            new naver.maps.LatLng(37.36354029942161, 127.12310314178465),
            new naver.maps.LatLng(37.365211629488016, 127.12456226348876),
            new naver.maps.LatLng(37.37544345085402, 127.11224555969238)
        ]
    ],
    fillColor: '#ff0000',
    fillOpacity: 0.2,
    strokeColor: '#ff0000',
    strokeOpacity: 0.6,
    strokeWeight: 3
});
</script>
</body>
</html>