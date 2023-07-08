<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationComplete</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>reservationSelectAll</h1>



	<table border="1">
		<c:if test="${vos1.size()!=0}">
			<form action="selectAllReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="예약내역">
			</form>
			<form action="selectCancelReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="취소내역">
			</form>
			<c:forEach var="vo" items="${vos1}">
					
				<table>
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td>${vo.res_date}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="selectOne" data-id="${vo.id}" data-user_id="${user_id}">예약상세</button>
						<button id="cancelOne" data-id="${vo.id}" data-user_id="${user_id}">예약취소</button>
					</td>
				</tr>
			</table>
			</c:forEach>
		</c:if>
		<c:if test="${vos1.size()==0}">
			<form action="selectAllReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="예약내역">
			</form>
			<form action="selectCancelReservation.do" method="POST">
				<input type="hidden" name="user_id" id="user_id" value="${user_id}">
				<input type="submit" value="취소내역">
			</form>
			<tr>
				<td>예약한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="home.do">예약하러 가기</a></td>
			</tr>
		</c:if>
		<c:if test="${vos2.size()!=0}">
			<c:forEach var="vo2" items="${vos2}">
				<tr>
					<th>취소번호</th>
					<td>${vo2.id}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><a href="selectOneUserAct.do?id=${vo2.act_id}">${vo2.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="selectOneCancel" data-id="${vo2.id}" data-user_id="${user_id}">취소상세</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${vos2.size()==0}">
			<tr>
				<td>취소한 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=john123">예약내역 보기</a></td>
				<!-- 세션 연결되면 아이디 바꾸기 -->
			</tr>
		</c:if>
	</table>
	
	<!-- 예약상세 form -->
	<form action="selectOneReservation.do" method="post" class="select_form">
		<input type="hidden" name="id" class="select_id">
		<input type="hidden" name="user_id" class="select_user_id">
	</form>	
	
	<!-- 취소상세 form -->
	<form action="selectOneCancelReservation.do" method="post" class="cancel_form">
		<input type="hidden" name="id" class="cancel_id">
		<input type="hidden" name="user_id" class="cancel_user_id">
	</form>	

	<!-- 삭제 form -->
	<form action="cancelReservation.do" method="post" class="delete_form">
		<input type="hidden" name="id" class="delete_id">
		<input type="hidden" name="user_id" class="delete_user_id">
	</form>	
	
	
	<script>
	$("#selectOne").on("click", function(e){
		const id = $(this).data("id");
		const user_id = $(this).data("user_id");
		$(".select_id").val(id);
		$(".select_user_id").val(user_id);
		$(".select_form").submit();
	});

	$("#selectOneCancel").on("click", function(e){
		const id = $(this).data("id");
		const user_id = $(this).data("user_id");
		$(".cancel_id").val(id);
		$(".cancel_user_id").val(user_id);
		$(".cancel_form").submit();
	});
	
	$("#cancelOne").on("click", function(e){
		const id = $(this).data("id");
		const user_id = $(this).data("user_id");
		$(".delete_id").val(id);
		$(".delete_user_id").val(user_id);
		$(".delete_form").submit();
	});
	</script>
</body>
</html>