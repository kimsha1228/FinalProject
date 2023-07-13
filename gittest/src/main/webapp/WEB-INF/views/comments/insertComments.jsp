<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Comments</title>
</head>
<body>
    <h1>Insert Comments</h1>
    <form action="insertCommentsOK.do" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br><br>
        
        <label for="user_id">USER_ID:</label>
        <input type="text" id="user_id" name="user_id" required><br><br>
        
        <label for="act_id">ACT_ID:</label>
        <input type="text" id="act_id" name="act_id" required><br><br>
        
        <label for="content">Content:</label><br>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea><br><br>
        
        <label for="rate">Rate:</label>
        <select id="rate" name="rate" required>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
