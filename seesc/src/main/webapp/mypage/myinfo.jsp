<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.userinfo.*" %>
    <jsp:useBean id="userdto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
  width: 80%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
  color: black;
}
td{
	display: inline-block;
}
input[type=text], input[type=password], select {
  width: 90%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=tel]{
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=button] {
  width: 100%;
  background-color: #333;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}
input[type=submit] {
  width: 100%;
  background-color: #333;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
.form{
width:60%
}
.outbt{
  width: 10%;
  background-color: #EB0000;
  color: black;
  padding: 10px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  position: absolute;
}
.outbt:hover{
	background-color: #CD0000;
}
.outdiv{
display: inline-block;
margin:0px 80%;
float: left;
}
.telsel{
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
<script>
function open_nicCheck(){
	window.open('/seesc/member/nicCheck.jsp','nicCheck','width=450,height=200')
}
</script>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<br><br>
<h1 class ="h1">마이 페이지</h1>
         <br>
           <hr width="130px">
           <br>
<article>
<div>
	<a href="mypage.jsp"><button class="tbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="tbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="rbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="tbutton"><span>쿠폰함</span></button></a>
	<%
	int user_idx=(int)session.getAttribute("user_idx");
	UserinfoDTO dto=userdao.userInfo(sid);
	%>
	<form name="memberJoin" action="myUpdate.jsp" class="form">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" readonly value="<%=sid%>" name="user_id"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" value="<%=dto.getUser_nic()%>" name="user_nic" readonly></td>
			<td><input type="button" name="idCheck" value="중복확인" onclick="open_nicCheck()"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="user_pwd" required></td>
			
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="user_pwd_ok" required></td>
		</tr>
		<tr>
			<th>성별</th>
			<%if(dto.getUser_se()>0){
				%><td>남자</td><%
			}else{
				%><td>여자</td><%
			}
				%>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" value="<%=dto.getUser_name()%>" name="user_name" readonly></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<%
			String tel=dto.getUser_tel();
			String tel1=tel.substring(0, 3);
			String tel2=tel.substring(4, 8);
			String tel3=tel.substring(9, tel.length());
			%>
			<td><select name="tel1" value="<%=tel1%>" class="telsel">
			<option value = "010">010
			<option value = "016">016
			<option value = "017">017
			<option value = "018">018
			<option value = "019">019
		</select>-<input type="tel" value="<%=tel2%>" name="tel2" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''">-<input type="tel" value="<%=tel3%>" name="tel3" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="<%=dto.getUser_email()%>" name="user_email"></td>
		</tr>
	</table>
	<input type="submit" value="저장하기">
	</form>
	<script>
	function joinout(){
	var result=window.confirm('탈퇴하시겠습니까?');
	if(result){
	location.href='/seesc/mypage/joinout_ok.jsp';
	}
		}
</script>
<div class="outdiv"><a><button onclick="joinout();" class="outbt"><span>회원탈퇴</span></button></a></div>
<br><br><br><br><br>
</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
