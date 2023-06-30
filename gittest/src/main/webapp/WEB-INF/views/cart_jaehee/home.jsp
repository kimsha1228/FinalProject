<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project</title>
</head>
<body>
    <h1>Welcome to the Cart Project!</h1>
    <p>This is the home page.</p>
  
     
<%--     <% if (cartItems.isEmpty()) { %> --%>
<!--         장바구니에 상품이 없는 경우 -->
<!--         <form action="selectAllUserAct.do" method="GET"> -->
<!--             <input type="submit" value="상품 보러가기" /> -->
<!--         </form> -->
<%--     <% } else { %> --%>
<!--         장바구니에 상품이 있는 경우 -->
<!--         상품 목록을 표시하거나 다른 내용을 추가 -->
<%--         <jsp:include page="cartList.jsp" /> --%>
<%--     <% } %> --%>
    
    <a href="carttest.do?user_id=john123">장바구니</a>
</body>
</html>
