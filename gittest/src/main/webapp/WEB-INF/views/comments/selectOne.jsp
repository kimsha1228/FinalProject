<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <h1>영화정보</h1>

    <table id="commentsList">
        <thead>
            <tr>
                <th>act_num</th>
                <th>id</th>
                <th>rate</th>
                <th>content</th>
                <th>com_date</th>
                <th>likes</th>
                <th>user_id</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${vo2.act_num}</td>
                <td>${vo2.id}</td>
                <td>${vo2.rate}</td>
                <td>${vo2.content}</td>
                <td>${vo2.com_date}</td>
                <td>${vo2.likes}</td>
                <td>${vo2.user_id}</td>
            </tr>
            <tr>
                <td colspan="5"><img width="300px" src="resources/uploadimg/${vo2.act_num}"></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4"><a href="updateComments.do?act_num=${param.act_num}" class="myButton">리뷰수정</a> <a href="deleteCommentsOK.do?act_num=${param.act_num}" class="myButton">리뷰삭제</a></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
