<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}"></script>
</head>
<body>
<p>다음 예제는 지도를 클릭했을 때, 마커가 있는 위치로 이동하며 줌 레벨을 변경하는 예제입니다.</p>
<a href="https://navermaps.github.io/maps.js.ncp/docs/tutorial-DOM-Event.html" target='_blank'>이벤트 리스너</a>

<div id="map" style="width:40%;height:400px;"></div>

<script>
/*
 * 이벤트 리스너를 등록 해제하면 더 이상 DOM 이벤트를 수신하지 않습니다. removeDOMListener 메서드를 이용해 등록한 리스너를 제거합니다.
 	이때, 인수로 DOMEventListener 객체(또는 객체 배열)를 전달할 수 있습니다.

 	다음 예제는 지도를 클릭했을 때, 마커가 있는 위치로 이동하며 줌 레벨을 변경하는 예제입니다.
 */
	var mapOptions = {
	    zoom: 4,
	    center: new naver.maps.LatLng(37.3614483, 127.1114883)
	};

	var map = new naver.maps.Map('map', mapOptions);

	var markerOptions = {
	    position: map.getCenter(),
	    map: map,
	    title: 'Click to zoom'
	};

	var marker = new naver.maps.Marker(markerOptions);

	var mapElement = map.getElement();

	var listener = naver.maps.Event.addDOMListener(mapElement, 'click', function() {
	    map.setZoom(15);
	    map.setCenter(marker.getPosition());

	    naver.maps.Event.removeDOMListener(listener);
	});
</script>
</body>
</html>