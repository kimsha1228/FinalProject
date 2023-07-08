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
<div id="map" style="width:40%;height:400px;"></div>

<script>
	//id=map에 바로 집어넣기
	/* MapTypeId:
			NORMAL
			일반 지도 유형 id로 일반 이미지 지도를 보여주는 지도 유형입니다.
	
			TERRAIN		
			지형도 유형 id로 지형의 높낮이를 함께 보여주는 지도 유형입니다.
	
			SATELLITE
			위성 지도 유형 id로 위성 이미지 지도를 보여주는 지도 유형입니다.
	
			HYBRID	
			겹쳐보기 지도 유형 id로 위성 이미지 지도 위에 주요 도로와 주기를 함께 보여주는 지도 유형입니다.
	*/
	var map = new naver.maps.Map('map', {
		mapTypeId: naver.maps.MapTypeId.HYBRID,
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	});
	
</script>
</body>
</html>