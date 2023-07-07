<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Destination</title>
</head>
<body>
    <h1>Select Destination</h1>

    <ul>
        <c:forEach items="${vos1}" var="vo">
            <li>${vo.id} - ${vo.name} - ${vo.category}</li>
        </c:forEach>
    </ul>

</body>
</html>
