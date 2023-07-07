<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project</title>
</head>
<body>
    <h3>화면 테스트용</h3>
    <ul>
    <li><a href="noCart.do">담은 상품 없을 때</a></li>
    <li><a href="cartList.do">담은 상품 있을 때</a></li>
    <li><a href="cart2.do">테스트</a></li>
</ul>

</body>
</html>

<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project</title>
</head>
<body>
    <c:if test="${not empty cartList}">
        <!-- 여기에 cartList를 표시하는 로직 추가 -->
    </c:if>
    <c:if test="${empty cartList}">
        <p>담은 상품이 없습니다.</p>
        <form action="${pageContext.request.contextPath}/selectAllUserAct.do" method="GET">
            <input type="submit" value="상품 보러가기" />
        </form>
    </c:if>
</body>
</html>

 --%>