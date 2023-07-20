<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script
	src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script
	src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script type="text/javascript">
$(function(){
	actSelectOne();
});//end onload...

function actSelectOne(){
	$.ajax({ 
 		url : "jsonActSelectOne.do",
 		data:{id:${param.act_id}},
 		method:'GET',
 		dataType:'json', 
 		success : function(vo2) {
 			let act_name =  `\${vo2.act_name}`;
 			$("#act_name").html(act_name);
 		},
 		error:function(xhr,status,error){
 			console.log('xhr.status:', xhr.status);
 		}
 	});//end $.ajax()...
}//end actSelectOne

</script>
<title>후기</title>
<jsp:include page="../css.jsp"></jsp:include>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px"> <span id="act_name"></span><span> 상품 후기</span></h5>

	<table id="commentsList">
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>평점</th> -->
<!-- 				<th>후기 내용</th> -->
<!-- 				<th>작성일자</th> -->
<!-- 				<th>작성자</th> -->
<!-- 				<th>좋아요</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr style="border-top: 2px solid gray; margin-top: 10px">
					<td style="text-align:left"><p style="margin:5px 0px 5px 5px;">${vo.user_id}</p></td>
					<td style="font-size:13px; color:gray; text-align:right"><p style="margin:5px 0px 5px 5px;"><fmt:formatDate value="${vo.com_date}" pattern="yyyy년 MM월 dd일"/></p></td>
				</tr>
				<tr style="border-top: 1px solid gray;">
					<td colspan="2"><p style="margin:5px 0px 5px 5px;">${vo.rate}점</p></td>
				</tr>
				<tr>
					<td style="width:500px; height:100px; vertical-align : top;"><p style="margin:5px 0px 5px 5px;" >${vo.content}</p></td>
				</tr>
				<tr>
					<td><a href="updateLikes.do?id=${vo.id}&act_id=${vo.act_id}" style="margin:5px 0px 10px 5px;"> 좋아요👍🏻 ${vo.likes}</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>