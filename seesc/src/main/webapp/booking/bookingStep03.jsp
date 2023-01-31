<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{width:1200px;margin:0px auto;}
#a1{margin:0px 100px;}
#a1-0{background:lightgray;}
#a1-1{margin:40px auto;}
.a2{font-size:17px;}
#a2-1{margin:0px auto;}
#d1{margin:40px 270px;}
</style>
</head>
<body>
<section>
<hr width="1100">
 <article>
 <h2 id="a1">예약완료</h2>
 <br>
 <h4 align="center">STEP01 날짜/테마 선택 &nbsp; STEP02 정보입력 &nbsp; <label id="a1-0">STEP03 예약확인</label></h4>
 <br><br>
 </article>
 <article>
 <table id="a1-1" border="1" cellspacing="0">
 	<tr height="40">
 		<td width="200" align="center" class="a2"><b>테마 (Room)</b></td>
 		<td width="600">&nbsp;&nbsp;테마 이름</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약일 (Date)</b></td>
 		<td>&nbsp;&nbsp;2023-01-30 월요일</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약시간</b></td>
 		<td>&nbsp;&nbsp;12:00</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>게임시간</b></td>
 		<td>&nbsp;&nbsp;100분</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>인원 (Player)</b></td>
 		<td>&nbsp;&nbsp;2명 (44,000원)</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약자</b></td>
 		<td>&nbsp;&nbsp;김둘리</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>연락처</b></td>
 		<td>&nbsp;&nbsp;010-1111-1111</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>쿠폰 사용</b></td>
 		<td>&nbsp;&nbsp;할인금액 1,000원</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>참가요금</b></td>
 		<td>&nbsp;&nbsp;<b>43,000원</b> [예약금: 20,000원]</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>결제방식</b></td>
 		<td>&nbsp;&nbsp;현장결제</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약 비밀번호</b></td>
 		<td>&nbsp;&nbsp;1234</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>전달메세지</b></td>
 		<td>&nbsp;&nbsp;10분 전에 도착할 것 같아요~</td>
 	</tr>
 </table>
 </article>
 <article>
 <div id="d1">
 ※ 테마 예약 후 24시간 이내로 예약금 3만원을 넣어주셔야 예약확정됩니다.<br>
 ※ 24시간 이내 예약금 확인 불가시 통보없이 예약이 취소될 수 있으니 양해 부탁드립니다.<br>
 ※ 테마 예약 당일에는 취소가 불가능하며, 예약하신 시간 10분 전까지는 도착해주세요.<br>
 </div>
 <table id="a2-1">
 	<tr>
 		<td>
 			<input type="button" value="예약 취소하기"> <input type="button" value="돌아가기"> <input type="button" value="카페 주문하기">
 		</td>
 	</tr>
 </table>
 <br>
 </article>
 <hr width="1100">
</section>
</body>
</html>