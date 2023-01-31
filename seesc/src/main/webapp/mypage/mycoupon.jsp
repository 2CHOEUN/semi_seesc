<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button><span>예약내역</span></button></a>
	<a href="payment.jsp"><button><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button><span>쿠폰함</span></button></a>
	<a href="cafeorderinfo.jsp"><button><span>카페주문내역</span></button></a>
	<table>
		<tr>
			<th>No</th>
			<th>쿠폰명</th>
			<th>할인금액</th>
			<th>발급일</th>
			<th>만료일</th>
			<th>사용여부</th>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>