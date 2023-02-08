<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
background-color: #828282;
margin: 0px auto;
text-align: center;
}
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 8px;
  text-align: center;
}

th {
  background-color: #f2f2f2;
}
</style>
<%
int manager=(int)session.getAttribute("manager");
if(manager<1){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/seesc/index.jsp';
	</script>
	<%
}
%>
<body>
<section>
<h1>관리자페이지</h1>
<article>
	<a href="/seesc/index.jsp"><button><span>홈</span></button></a>
	<a href="boomange.jsp"><button><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button><span>관리권한부여</span></button></a>
	<a href="cancelmng.jsp"><button><span>예약취소관리</span></button></a>
	<a href="coumng.jsp"><button><span>쿠폰관리</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button><span>내정보</span></button></a>
</article>
</section>
</body>
</html>