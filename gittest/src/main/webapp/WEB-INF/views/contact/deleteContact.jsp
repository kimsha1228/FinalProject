<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/deleteContact.js"></script>
</head>
<body>
  <jsp:include page="../top_menu.jsp"></jsp:include>
  <h1>글 삭제</h1>
  
  <form action="deleteContactOK.do" method="get"> 
    <table>
      <tr>
        <td><label for="id">id:</label></td>
        <td>${vo2.id}
        <input type="hidden" id="id" name="id" value="${vo2.id}">
        </td>
      </tr>
      <tr>
        <td><label for="title">title:</label></td>
        <td>${vo2.title}</td>
      </tr>
      <tr>
        <td><label for="content">content:</label></td>
        <td>${vo2.content}</td>
      </tr>
      <tr>
        <td><label for="writer">writer:</label></td>
        <td>${vo2.writer}</td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="삭제" class="myButton"></td>
      </tr>
    </table>
  </form>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
