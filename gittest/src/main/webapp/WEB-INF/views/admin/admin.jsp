<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1><a href="selectAllUser.do">판매자목록</a></h1>
	
	<div style="padding:5px">
		<form action="searchSellerList.do">
			<select name="searchKey" id="searchKey">
				<option value="user_id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="" placeholder="검색어 입력">
			<input type="submit" value="검색">
		</form>
	</div>

	<table border="1">
	<thead>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>승인여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="selectOneSeller.do?user_id=${vo.user_id}">${vo.id}</a></td>
				<td>${vo.user_id}</td>
				<td>${vo.name}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
				<td>${vo.type}</td>
			</tr>
		</c:forEach>
	</tbody>
<!-- 	<tfoot> -->
<!-- 		<tr> -->
<!-- 			<td colspan="5">1 2 3 4 5</td> -->
<!-- 		</tr> -->
<!-- 	</tfoot> -->
	</table>
=======
<title>관리자 페이지</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1><a href="insertAct.do">상품등록</a></h1>
	<h1><a href="selectAllAct.do">상품목록</a></h1>
	<h1><a href="insertRoute.do">루트등록</a></h1>
	<h1><a href="selectAllRoute.do">루트목록</a></h1>
	<h1><a href="selectAllCoupon.do">쿠폰목록</a></h1>
	<h1><a href="selectAllSeller.do">판매자목록</a></h1>
	<h1><a href="selectAllUser.do">회원목록</a></h1>
	<h1><a href="selectAllFaq.do">고객센터</a></h1>
	<h1><a href="selectAllContact.do">문의글목록</a></h1>
	
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
</body>
</html>