<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project</title>
</head>
<body>
    
    <p>담은 상품이 없습니다.</p>
    <form action="${pageContext.request.contextPath}/selectAllUserAct.do" method="GET">
        <input type="submit" value="상품 보러가기" />
    </form>
</body>
</html>
