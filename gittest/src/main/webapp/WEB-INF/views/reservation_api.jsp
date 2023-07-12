<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
<ul>
	<li><a href="selectAllReservation.do?user_id=john123">예약 내역 페이지로</a></li>
	
	<li><a href="selectAllReservation.do?user_id=${user_id}">예약 내역 페이지로(세션)</a></li>
</ul>

</body>
</html>
