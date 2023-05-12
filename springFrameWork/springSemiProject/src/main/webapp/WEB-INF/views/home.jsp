<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P> The time on the server is ${serverTime}. </P>
<a href="index.do">index.do</a>
<a href="json_vo.do">json_vo.do</a>
<a href="json_selectOne.do?num=1">json_selectOne.do</a>
<a href="json_vos.do">json_vos.do</a>
<a href="json_selectAll.do">json_selectAll.do</a>
<!-- <a href="json_map.do">json_map.do</a> -->
<a href="json_result.do">json_result.do</a>
<a href="json_idCheck.do?id=tester">json_idCheck.do</a>
<a href="json_insertOK.do?id=tester367&password=hi11&name=han&tel=031">json_insertOK.do</a>
<a href="json_searchList.do?searchKey=name&searchWord=Kim">json_searchList.do</a>
</body>
</html>
