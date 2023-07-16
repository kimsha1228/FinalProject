<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert Comments</title>
</head>
<body>
	<h1>Insert Comments</h1>
	<form action="insertCommentsOK.do" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="user_id">USER_ID:</label></td>
				<td><input type="text" id="user_id" name="user_id" value="${user_id}" readonly required>
				<input type="hidden" id="res_id" name="res_id" value="${param.res_id}" required></td>
			</tr>
			<tr>
				<td><label for="act_id">ACT_ID:</label></td>
				<td><input type="text" id="act_id" name="act_id" value="${param.act_id}" required></td>
			</tr>
			<tr>
				<td><label for="content">Content:</label></td>
				<td><textarea id="content" name="content" rows="5" cols="50" required></textarea></td>
			</tr>
			<tr>
				<td><label for="rate">Rate:</label></td>
				<td><select id="rate" name="rate" required>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr id="multiplefiles">
				<td>
				<input type="file" name="file" multiple id="multiplefiles"></td>
			</tr>
		</table>
			<input type="submit" value="Submit">
	</form>
	<script>
			$(function(){
	    	   $("input[type='file']").change(function(event){
	    	      var $fileUpload = $("input[type='file']");
	    	      if (parseInt($fileUpload.get(0).files.length) > 5){ //5개이상이면
	    	         $fileUpload.val('');// 파일선택을 초기화
	    	         alert("이미지는 최대 5장까지만 삽입 가능합니다.");
	    	      }
	    	   });
			});
      </script>
</body>
</html>
