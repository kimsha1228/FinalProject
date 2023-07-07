<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wishlistComplete</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <%@ include file="../top_menu.jsp" %>
    <h1>Destination</h1>

    <form action="${pageContext.request.contextPath}/selectAllDestination.do" method="GET">
        <input type="hidden" name="category" value="city" /> <!-- Add this line for 'city' category -->
        <input type="submit" value="City" />
    </form>

    <form action="${pageContext.request.contextPath}/selectAllDestination.do" method="GET">
        <input type="hidden" name="category" value="beach" /> <!-- Add this line for 'beach' category -->
        <input type="submit" value="Beach" />
    </form>

    <br>

    <c:forEach items="${vos1}" var="vo">
        <p>${vo.id} - ${vo.name}</p>
    </c:forEach>

</body>
</html>
