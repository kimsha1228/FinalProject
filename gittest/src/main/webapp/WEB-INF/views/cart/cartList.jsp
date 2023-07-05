<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project - 장바구니</title>
</head>
<body>
    <h1>장바구니</h1>
    
    <c:forEach items="${cartList}" var="activity">
        <div style="border: 1px solid black; padding: 10px; margin-bottom: 10px;">
            <div style="float: left;">
                <input type="checkbox" name="selectedActivities" value="${activity.id}">
            </div>
            <div style="float: right;">
                <a href="${pageContext.request.contextPath}/deleteOneCart.do?num=${activity.id}">삭제</a>
            </div>
            <div style="clear: both;"></div>
            <p>${activity.act_name}</p>
            <p>가격: ${activity.price}</p>
            <!-- 추가적인 필드들의 데이터 표시 -->
            <div style="text-align: center;">
                <form action="${pageContext.request.contextPath}/reserveActivity.do" method="POST">
                    <input type="hidden" name="activityId" value="${activity.id}">
                    <input type="submit" value="예약하기">
                </form>
            </div>
        </div>
    </c:forEach>
    
    <form action="${pageContext.request.contextPath}/deleteManyCart.do" method="POST">
        <input type="submit" value="선택 삭제">
        <c:forEach items="${cartList}" var="activity">
            <input type="checkbox" name="selectedActivities" value="${activity.id}">
        </c:forEach>
    </form>
</body>
</html>
