<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.booking.*" %>
    <jsp:useBean id="boodao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.cbutton {
	display: inline-block;
	width: 150px;
	height: 54px;
	text-align: center;
	text-decoration: none;
	line-height: 54px;
	outline: none;
}
.cbutton::before,
.cbutton::after {
	position: absolute;
	z-index: -1;
	display: block;
	content: '';
}
.cbutton,
.cbutton::before,
.cbutton::after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}


.cbutton {
	background-color: #aaaaaa;
	color: #black;
}
.cbutton:hover {
	letter-spacing: 5px;
}
table {
  width: 100%;
  border-collapse: collapse;
  border-bottom: 1px dashed white;
}
th, td {
  padding: 8px;
  text-align: center;
}

th {
  background-color: #f2f2f2;
  color: black;
}
.tfoot{
	margin: 0px auto;
	text-align: center;
}
.tfoot td{
	margin: 0px auto;
	text-align: center;
}
</style>
<%
int user_idx=(int)session.getAttribute("user_idx");
int totalCnt=boodao.getTotalCnt(user_idx);
int listSize=5;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;


int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/button.css">
<body>
<%@include file="/header.jsp" %>
<%
    if(sid==null){
    	%>
    	<script>
    	window.alert('로그인 후 이용가능하십니다.');
    	location.href='/seesc/index.jsp';
    	</script>
    	<%
    	return;
    }
	int manager=(int)session.getAttribute("manager");
	if(manager>0){
		%>
		<script>
		location.href='/seesc/mypage/manage/managepage.jsp';
		</script>
		<%
	}
    %>
<section>
<br><br>
<h1 class ="h1">마이 페이지</h1>
         <br>
           <hr width="130px">
           <br>
<article>
	<a href="mypage.jsp"><button class="rbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="tbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="tbutton"><span>쿠폰함</span></button></a>
	<table>
	<tfoot class="tfoot">
			<tr>
				<td colspan="5">
				<!-- ---------------- -->
				<%
				if(userGroup!=0){
					%><a href="mypage.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>"><button class="onebutton">&lt;&lt;</button></a><%
				}
				%>
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
					if(cp==i){
						%>&nbsp;&nbsp;<a href="mypage.jsp?cp=<%=i%>"><button class = "prbutton"><%=i %></button></a>&nbsp;&nbsp;<%
					}else{
						%>&nbsp;&nbsp;<a href="mypage.jsp?cp=<%=i%>"><button class = "pagebutton"><%=i %></button></a>&nbsp;&nbsp;<%
					}
					
					if(i==totalPage)break;
				}
				%>
				<%
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					%><a href="mypage.jsp?cp=<%=(userGroup+1)*pageSize+1%>"><button class="nextbutton">&gt;&gt;</button></a><%
				}
				%>
				<!-- ---------------- -->
				</td>
			</tr>
		</tfoot>
		<tr>
			<th>No</th>
			<th>예약날짜</th>
			<th>참여인원</th>
			<th>예약상태</th>
			<th>비고</th>
		</tr>
		<%
	ArrayList<BookingDTO> arr=boodao.myBooking(user_idx,listSize,cp);
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td colspan="5">예약정보가 없습니다.</td>
		</tr>
		<%
	}else{
		String pay_ok=null;
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%=arr.get(i).getBooking_time() %></td>
				<td><%=arr.get(i).getBooking_num() %></td>
				<%
				if(arr.get(i).getBooking_pay_ok()>0){
					pay_ok="결제미완료";
				}else{
					pay_ok="결제완료";
				}
				%>
				<td><%=pay_ok %></td>
				<%
				if(pay_ok.equals("결제완료")){
					%><td><a href="/seesc/booking/bookingCancle.jsp?user_idx=<%=user_idx %>&booking_idx=<%=arr.get(i).getBooking_idx()%>"><button class="cbutton">취소</button></a><td><%
				}else{
					%><script>
							function cancel(){
							var result=window.confirm('취소하시겠습니까?');
							if(result){
							location.href='/seesc/mypage/mypage_ok.jsp?user_idx=<%=user_idx %>&booking_idx=<%=arr.get(i).getBooking_idx()%>';
						}
							}
					</script>
					<td><a><button onclick="cancel();" class="cbutton">취소</button></a><td><%
				}
				%>
				
			</tr>
			<%
		}
	}
	%>
		<tr>
			<td></td>
		</tr>
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>


