<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이용 후기 수정</title>
    <jsp:include page="../css.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <div id="commentsform">
    <h3>후기 수정</h3>
    <form action="updateCommentsOK.do" method="post" enctype="multipart/form-data">
        <table id="commentstable">
            <tr>
                <td style="width:80px;"><label for="act_id">상품명</label></td>
                <td>${vo2.act_name}</td>
            </tr>
       <%--      <tr>
                <td><label for="rate">평점</label></td>
                <td>${vo.rate}</td>
            </tr> --%>
            <tr>
                <td><label for="content">내용</label></td>
                <td>
                    <textarea id="content" name="content" rows="15" cols="50" required>${vo2.content}</textarea>
                    <input type="hidden" id="user_id" name="user_id" value="${user.user_id}" required>
                    <input type="hidden" id="res_id" name="res_id" value="${vo2.res_id}" required>
                    <input type="hidden" id="id" name="id" value="${vo2.id}" required>
                </td>
            </tr>
            <tr>
                <td><label for="file">후기 사진</label></td>
                <td>
                    <c:forEach var="vo" items="${vos}">
                        <img width="100px" height="100px" src="resources/uploadimg/${vo.name}">
                    </c:forEach>
                    <input style="border-color: blue;" type="file" name="file" multiple>
                </td>
            </tr>
        </table>
        <input type="submit" value="수정" class="myButton">
    </form>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
