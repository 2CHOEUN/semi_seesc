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
<body>
<section>
<h1>예약취소관리</h1>
<article>
	<a href="boomange.jsp"><button><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button><span>관리권한부여</span></button></a>
	<a href="canclemng.jsp"><button><span>예약취소관리</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button><span>내정보</span></button></a>
	<table>
		<tr>
			<th>취소번호</th>
			<th>예약번호</th>
			<th>회원번호</th>
			<th>예약자이름</th>
			<th>연락처</th>
			<th>결제수단</th>
			<th>결제완료여부</th>
			<th>환불계좌번호</th>
			<th>취소시간</th>
			<th>환불금액</th>
			<th>환불완료여부</th>
			<th>비고</th>
		</tr>
		<%
	ArrayList<CancelDTO> arr=boodao.cancelmng();
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td colspan="12">예약내역이 없습니다.</td>
		</tr>
		<%
	}else{
		String pay=null;
		String pay_ok=null;
		int money=0;
		String cancel_ok=null;
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getCancel_idx() %></td>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%=arr.get(i).getUser_idx() %></td>
				<td><%=arr.get(i).getBooking_name() %></td>
				<td><%=arr.get(i).getBooking_tel() %></td>
				<%
				if(arr.get(i).getBooking_pay()>0){
					pay="현장결제";
				}else{
					pay="무통장";
				}
				%>
				<td><%=pay %></td>
				<%
				if(arr.get(i).getBooking_pay_ok()>0){
					pay_ok="결제미완료";
				}else{
					pay_ok="결제완료";
				}
				%>
				<td><%=pay_ok %></td>
				<td><%=arr.get(i).getCancel_banknum() %></td>
				<td><%=arr.get(i).getCancel_time() %></td>
				<%
				if(pay.equals("현장결제")){
					money=0;
				}else{
					money=arr.get(i).getBooking_money();
				}
				%>
				<td><%=money %></td>
				<%
				if(arr.get(i).getCancel_ok()>0){
					cancel_ok="환불완료";
				}else{
					cancel_ok="환불안됨";
				}
				%>
				<td><%=cancel_ok %></td>
				<%
				if(cancel_ok.equals("환불안됨")){
					%><td><a href="cancelmng_ok.jsp?booking_idx=<%=arr.get(i).getBooking_idx()%>"><input type="button" value="환불"></a></td><%
				}else{
					%><td></td><%
				}
				%>
			</tr>
			<%
		}		
	}
	%>
	</table>
</article>
</section>
</body>
</html>