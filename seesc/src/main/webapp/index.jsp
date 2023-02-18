<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.thema.*" %>
    <jsp:useBean id="thedto" class="com.esc.thema.ThemaDTO"></jsp:useBean>
    <jsp:useBean id="thedao" class="com.esc.thema.ThemaDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
</head>
<style>
.divh1{
font-size: 32px;
}
h1{
text-align: center;
}
section {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
}
.slider{
	width: 550px;
	height: 600px;
	position: relative;
	margin: 0 auto;
	overflow: hidden;
	top : 20px;
	left : 100px;
}

.notice{
	width: 550px;
	height: 600px;
	position: relative;
	bottom : 30px;
	margin: 0 auto;
	overflow: hidden;
	text-align : center;
}

.slider input[type=radio]{
	display: none;
}

ul.img{
	padding: 0;
	margin: 0;
}
ul.img li{
	position: absolute;
	left: 700px;
	trasition-delay: 1s;
	list-style: none;
	padding: 0;
	margin: 0;
}
.bullets{
	position: absolute;
	right: 50%;
	transform: translateX(-50%);
	bottom: 70px;
	z-index: 2;
}
.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: white;
	width: 20px;
	height: 20px;
	cursor: pointer;
}
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
	background-color: #464646;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
	background-color: #464646;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
	background-color: #464646;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
	background-color: #464646;
}
.slider input[type=radio]:nth-child(1):checked~ul.img>li:nth-child(1){
	left: 0;
	transition: 0.5s;
	z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.img>li:nth-child(2){
	left: 0;
	transition: 0.5s;
	z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.img>li:nth-child(3){
	left: 0;
	transition: 0.5s;
	z-index:1;
}
.slider input[type=radio]:nth-child(4):checked~ul.img>li:nth-child(4){
	left: 0;
	transition: 0.5s;
	z-index:1;
}
.content{
display:block;
text-align:center;
}
</style>
<body>
<%@include file="header.jsp" %>
<br>
<br>
<div class="divh1">
<h1 style = "color :#FF0000;">"숨겨진 단서를 찾아라!"</h1>
<h1>탄탄한 스토리! 재방문 많은 방탈출!</h1>
<h1>초은 재수정 작업 진행</h1>
</div>
<section>
<!-- ----------------------공지사항 부분--------------- -->
<div class = "notice">
<h2>공지사항</h2><br>
<img src="/seesc/img/notice.png" width="450" height="500">
</div>


<!-- ----------------------슬라이드 부분--------------- -->
<div class="slider" style="float: right; text-align: center; padding: 20px;">

	<input type="radio" name="slide" id="slide1" checked>
	<input type="radio" name="slide" id="slide2">
	<input type="radio" name="slide" id="slide3">
	<ul class="img">
		<li><a href="/seesc/community/community_eventcontent_list.jsp"><img src="/seesc/img/moningdc.png" width="450" height="500"></a></li>
		<li><a href="/seesc/community/community_eventcontent_list.jsp"><img src="/seesc/img/event1.png" width="450" height="500"></a></li>
		<li><a href="/seesc/community/community_eventcontent_list.jsp"><img src="/seesc/img/event2.png" width="450" height="500"></a></li>
	</ul>
	<div class="bullets">
		<label for="slide1"></label>
		<label for="slide2"></label>
		<label for="slide3"></label>
	</div>

</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>