<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul>
	<li><a href="index.do">홈</a></li>
	<li id="m_insert"><a href="m_insert.do">회원가입</a></li>
	<li id="m_selectAll"><a href="m_selectAll.do">회원목록</a></li>
	<li id="b_insert"><a href="b_insert.do">글쓰기</a></li>
	<li id="b_selectAll"><a href="b_selectAll.do">글목록</a></li>
	<li id="r_insert"><a href="r_insert.do?num=0">영화예매</a></li>
	<li id="r_selectAll"><a href="r_selectAll.do">예매조회</a></li>
	<li id="movie_selectAll"><a href="movie_selectAll.do">영화목록</a></li>
	<li id="login"><a href="login.do">로그인</a></li>
	<li id="logout"><a href="logout.do">로그아웃</a></li>
</ul>
<hr>
<script type="text/javascript">
// 	if('${user_id}'===''){ //로그인이 안되어있으면
// 		$('#login').show();
// 		$('#logout').hide();
// 		$('#r_insert').hide();
// 		$('#r_selectAll').hide();
// 		$('#m_selectAll').hide();
// 		$('#b_selectAll').hide();
// 		$('#b_insert').hide();
// 	}else{
// 		$('#login').hide();
// 		$('#m_insert').hide();
// 		$('#r_insert').show();
// 		$('#r_selectAll').show();
// 		$('#logout').show();
// 		$('#m_selectAll').show();
// 		$('#b_selectAll').show();
// 		$('#b_insert').show();
// 	}
</script>