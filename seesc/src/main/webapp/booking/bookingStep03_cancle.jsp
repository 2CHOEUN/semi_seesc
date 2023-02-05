<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.esc.booking.*" %>
<jsp:useBean id="bdao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cpdao" class="com.esc.coupon.CouponDAO" scope="session"></jsp:useBean>
<%
String booking_idx_s=request.getParameter("booking_idx");
int booking_idx=Integer.parseInt(booking_idx_s);
BookingDTO dto=bdao.one_bookingList(booking_idx);
String cancel_banknum=request.getParameter("bank")+"-"+request.getParameter("cacle_banknum")+"-"+request.getParameter("depositor");

int coupon_idx=bdao.bookingCouponIdx(booking_idx);

if(coupon_idx!=0) {
	bdao.bookingCouponUse_R(coupon_idx);
}

int result=bdao.bookingDelete(booking_idx,dto,cancel_banknum);

if (result==1) {%>
	<script>
	window.alert('취소가 완료되었습니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	
	</script>
<%}else {%>
	<script>
	window.alert('예약취소에 실패하였습니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	</script>
<%}%>