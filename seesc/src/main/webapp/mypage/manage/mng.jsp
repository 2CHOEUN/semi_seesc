<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.userinfo.*" %>
    <jsp:useBean id="userdto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
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
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<h1>권한관리페이지</h1>
<section>
	<a href="/seesc/index.jsp"><button class="tbutton"><span>홈</span></button></a>
	<a href="/seesc/mypage/manage/managepage.jsp"><button class="tbutton"><span>관리자페이지</span></button></a>
	<a href="boomange.jsp"><button class="tbutton"><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button class="rbutton"><span>관리권한부여</span></button></a>
	<a href="cancelmng.jsp"><button class="tbutton"><span>예약취소관리</span></button></a>
	<a href="coumng.jsp"><button class="tbutton"><span>쿠폰관리</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
<table>
<tr>
	<th>회원번호</th>
	<th>관리자</th>
	<th>회원아이디</th>
	<th>회원닉네임</th>
	<th>회원성별</th>
	<th>회원이름</th>
	<th>회원생일</th>
	<th>회원전화번호</th>
	<th>회원이메일</th>
	<th>회원가입일</th>
	<th></th>
</tr>
<%
int user_idx=(int)session.getAttribute("user_idx");
ArrayList<UserinfoDTO> arr=userdao.alluserinfo();
String manage;
String user_se;
for(int i=0;i<arr.size();i++){
	if(user_idx==arr.get(i).getUser_idx())continue;
	%>
	<tr>
		<td><%=arr.get(i).getUser_idx() %></td>
		<%
		if(arr.get(i).getManager()>0){
			manage="관리자";
			}else{
				manage="일반회원";
				} 
				%>
		<td><%=manage %></td>
		<td><%=arr.get(i).getUser_id() %></td>
		<td><%=arr.get(i).getUser_nic() %></td>
		<%
		if(arr.get(i).getUser_se()>0){
			user_se="남자";
		}else{
			user_se="여자";
		}
		%>
		<td><%=user_se %></td>
		<td><%=arr.get(i).getUser_name() %></td>
		<td><%=arr.get(i).getUser_birth() %></td>
		<td><%=arr.get(i).getUser_tel()%></td>
		<td><%=arr.get(i).getUser_email() %></td>
		<td><%=arr.get(i).getUser_date() %></td>
		<td>
			<a href="/seesc/mypage/manage/mng_ok.jsp?idx=<%=arr.get(i).getUser_idx()%>&manager=<%=arr.get(i).getManager()%>"><button class="tbutton"><span><%
		if(manage.equals("관리자")){
			%>
			권한철회
			<%
		}else{
			%>관리자권한부여<%
		}
		%></span></button></a></td>
	</tr>
	<%
}
%>
</table>
</section>
</body>
</html>