<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO" scope="session"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");	
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);	
	
	session.setAttribute("write_idx", idx_s);
	


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h3{
 text-align: center;
}

table {
width: 800px;
margin: 0 auto;
text-align: center;
background-color: white;

}
      
 th {
font-size: 18px;
padding: 10px;
color :black;
text-align : center;
background-color: #4646CD;
        

      }
 td{
color : black;
  background-color: white;
}
.writebutton{/*글쓰기 버튼*/
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
      }
.writebutton:hover {
    background-color: #3e8e41;
}
#undercontent{
	text-align: left;
}

.prbutton1{/*해당페이지 눌렀을때*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 16px;
      }
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #0000CD;
}
#select{
	text-align: right;

}
tfoot{

	text-align: center;
}  


.prbutton1{/*해당페이지 눌렀을때*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 16px;
      }
</style>
</head>


<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>자유게시판 본문</h3>
		<form name="update2" action="community_freecontent_update.jsp" method="post" enctype="multipart/form-data">
		<table>
		
		<%
		
		WriteDTO dto=wdao.contentWrite(idx);
		int ref=dto.getWrite_ref();
		
		

		int totalCnt=wdao.getUnderTotal(ref);//DB로 부터 가져올 정보
		int listSize=5;//사용자 마음
		int pageSize=5;//사용자 마음

		String cp_s=request.getParameter("cp");
		if(cp_s==null||cp_s.equals("")){
			cp_s="1";
		}
		int cp=Integer.parseInt(cp_s);//핵심요소 사용자로부터 가져와야하는 정보

		int totalPage=totalCnt/listSize+1;
		if(totalCnt%listSize==0)totalPage--;

		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;



		%>
		
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<tr>
					<th><%=dto.getWrite_idx() %></th>
					<th><%=dto.getWrite_title() %></th>
					<th><%=dto.getWrite_writer() %></th>
					<th><%=dto.getWrite_wdate() %></th>
				</tr>
			</thead>
			<tbody id="content">
				<tr>
					<td><img alt="등록 이미지" id="img" src="/seesc/community/userFile/writeImg/<%=dto.getWrite_filename() %>"></td>
					<td colspan="3"  ><textarea cols="50" rows="20" readonly><%=dto.getWrite_content() %></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4"  id="select">
						<input type="hidden" name="idx"  value="<%=dto.getWrite_idx()%>">
						<input type="submit" value="수정하기" class="writedel">
						<input type="button" value="목록으로" onclick="location.href='community.jsp'" class="writedel">
						<input type="button" value="삭제하기" onclick="location.href='community_del.jsp?idx=<%=dto.getWrite_idx() %>'" class="writedel">
						<input type="button" value="댓글작성하기" onclick="location.href='community_under.jsp?ref=<%=dto.getWrite_ref() %>&lev=<%=dto.getWrite_lev() %>&step=<%=dto.getWrite_step() %>&idx=<%=dto.getWrite_idx() %>'" class="writedel">						
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		<hr>
		<fieldset>
			<legend>댓글 보이는곳</legend>
			<table border="1">
			<thead>
				<tr>
					<th>작성자</th>
					<th>댓글 내용</th>
					<th colspan="4">선택지</th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<WriteDTO> arr2=wdao.underList(ref,listSize,cp);
			%>
						<%
			if(arr2==null || arr2.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">등록된 댓글이 없습니다.</td>
				</tr>
				<% 
			}else{
				for(int i=0;i<arr2.size();i++){
					%>
					<tr>
						<td align="left">
						<%=arr2.get(i).getWrite_writer() %>
						</td>
						<td id="undercontent">
						<%
						for(int z=0;z<arr2.get(i).getWrite_lev();z++){
							out.print("&nbsp;&nbsp;");
						}
						%>
						<%=arr2.get(i).getWrite_content() %>
						</td>
						<td><input type="button" value="삭제하기" class="writedel" onclick="location.href='under_del.jsp?idx=<%=arr2.get(i).getWrite_idx()%>&write_idx=<%=(String)session.getAttribute("write_idx")%>'"></td>
						<td><input type="button" value="답글하기" class="writedel" onclick="location.href='under_answer.jsp?ref=<%=arr2.get(i).getWrite_ref() %>&lev=<%=arr2.get(i).getWrite_lev() %>&step=<%=arr2.get(i).getWrite_step()%>&write_idx=<%=dto.getWrite_idx() %>&write_content=<%=arr2.get(i).getWrite_content()%>'"></td>
						
					</tr>
					<% 
				}
			}
			%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><!-- 페이징 들어갈 영역 -->
										<%
if(userGroup!=0){
	%><a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
}
%>

<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	%>&nbsp;&nbsp;<a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=i%>" class="prbutton1"><%=i %></a>&nbsp;&nbsp;<% 
	if(i==totalPage)break;
}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a> <%
}

%>
						
						
						</td>
					</tr>
				</tfoot>
			</table>
		</fieldset>
		</article>
		</section>
<%@include file="/footer.jsp" %>
</body>
</html>