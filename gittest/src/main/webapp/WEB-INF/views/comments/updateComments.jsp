<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Comments</title>
    <jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <h1>이용 후기 수정</h1>
    
    <form action="updateCommentsOK.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${vo2.id}" />
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="4" cols="50">${vo2.content}</textarea><br>
        
        <label for="image">이미지 첨부:</label><br>
        <input type="file" id="image" name="file" accept="image/*"><br>
        
        <input type="submit" value="수정">
    </form>
</body>
</html>
