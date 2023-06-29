<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    지금 로그인 되어있는 아이디 ${user_id} ${requestScope.user_id } ${sessionScope.user_id} ${applicationScope.user_id }
<ul>
	<li><a href="home.do">HOME</a></li>
	<li><a href="insertAct.do">insertAct.do</a></li>
	<li><a href="selectAllAct.do">selectAllAct.do</a></li>
	<li><a href="selectAllUserAct.do">selectAllUserAct.do</a></li>
	<li><a href="selectOneUserAct.do">selectOneUserAct.do</a></li>
	<li><a href="searchActHome.do">searchActHome.do</a></li>
	<li><a href="jsonSelectAllAct.do?seller_id=seller01">jsonSelectAllAct.do</a></li>
	<li><a href="jsonSearchAct.do?seller_id=seller01&searchKey=act_name&searchWord=에버랜드">jsonSearchAct.do</a></li>
</ul>