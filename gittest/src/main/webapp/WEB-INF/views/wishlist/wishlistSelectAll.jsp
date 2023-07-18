<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>wishlistComplete</title>
    <jsp:include page="../css.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

 	
        
    </style>
</head>
<body>
<<<<<<< HEAD
<jsp:include page="../top_menu.jsp"></jsp:include>
<h1>WishList</h1>

<form action="${pageContext.request.contextPath}/selectAllUserAct.do" method="GET">
    <input type="submit" value="상품 보러가기" />
</form>

<br>

<table>
    <c:if test="${not empty vos1}">
        <c:forEach var="vo" items="${vos1}">
            
            <tr>
                <td>
                    <b>상품명:</b>
                    <a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a>
                </td>
                <td class="image-cell">
                    <img src="resources/uploadimg/thumb_${vo.img_name}" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="deleteOK.do?act_id=${vo.act_id}&user_id=${vo.user_id}">
                        위시리스트 삭제
                    </a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty vos1}">
        <tr>
            <td colspan="2">
                위시리스트에 담긴 상품이 없습니다.
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="home.do">홈화면으로 가기</a>
            </td>
        </tr>
    </c:if>
</table>
=======
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="wishform">
	<h3>WishList</h3>
<%-- 	<form action="${pageContext.request.contextPath}/selectAllUserAct.do" --%>
<!-- 		method="GET"> -->
<!-- 		<input type="submit" value="상품 보러가기" /> -->
<!-- 	</form> -->
	<table id="wishtable">
		<c:if test="${not empty vos1}">

			<c:forEach var="vo" items="${vos1}">

				<tr>
					<th>상품</th>
					<td><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
					<td><a href="deleteOK.do?act_id=${vo.act_id}&user_id=${vo.user_id}">삭제</a></td>
				</tr>

			</c:forEach>
		</c:if>
		<c:if test="${empty vos1}">
			<tr>
				<td>위시리스트에 담긴 상품이 없습니다.</td>
			</tr>
			<tr>
				<td><a href="home.do">홈화면으로 가기</a></td>
			</tr>
		</c:if>
<%-- 		<c:if test="${not empty vos2}"> --%>
<%-- 			<c:forEach var="vo2" items="${vos2}"> --%>
<!-- 				<tr> -->
<!-- 					<th>회원번호</th> -->
<%-- 					<td>${vo2.user_id}</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>상품번호</th> -->
<%-- 					<td><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<%-- 		</c:if> --%>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
>>>>>>> f2f7bb44833cd8ddc90bc0a5ab825cda7a8148ae
</body>
</html>
