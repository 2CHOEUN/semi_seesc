<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
a {
	text-decoration: none;
}

ul {
	list-style: none;
}

.write_title {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

.write_table {
	margin: 0px auto;
	width: 600px;

}
.notice{
color : red;}
</style>

</head>
<%
int user_idx = session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");
int manager = session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");

String listname = request.getParameter("listname");
if(listname==null||listname.equals("")){
	listname = "0";
};
String content = request.getParameter("content");
if(content==null||content.equals("")){
	content = "0";
};

int totalqna = qnadao.getTotalCnt(listname,content);

String writeList_s = request.getParameter("listSize");
if (writeList_s == null || writeList_s.equals("")) {
	writeList_s = "10";
}
int writeList = Integer.parseInt(writeList_s);

int pageList = 5;

String userpage_s = request.getParameter("userpage");
if(userpage_s==null||userpage_s.equals("")){
	userpage_s = "1";
}
int userpage = Integer.parseInt(userpage_s);

int totalpage = totalqna/writeList+1;
if(totalqna%writeList==0){
	totalpage --;
}
int pagegroup = userpage/pageList;
if(userpage%pageList == 0){
	pagegroup --;
}


%>
<body>
	<%@include file="/header.jsp"%>
	<%sid= (String) session.getAttribute("sid");
UserinfoDTO udto = userdao.userInfo(sid); %>
	<section>
		<article>
			<p class="write_title">
				질문과 답변
			</p>
			
			<table class="write_table">
				<thead>
					<tr>
						<td colspan="4" align="left">
						<%String searchmsg = listname.equals("0")?("전체글 : "+qnadao.getTotalCnt(listname,content)+"개 "):("검색 내용 : "+content+" / 검색 결과 : "+qnadao.getTotalCnt(listname,content)+"개");
						%>
						
						<%=searchmsg %>
						</td>
						<td align="right"><select name="writeList"
							onChange="window.location.href=this.value">
								<option>리스트수</option>
								<option value="qna_list.jsp?listSize=5&listname=<%=listname%>&content=<%=content%>">5개씩</option>
								<option value="qna_list.jsp?listSize=10&listname=<%=listname%>&content=<%=content%>">10개씩</option>
								<option value="qna_list.jsp?listSize=15&listname=<%=listname%>&content=<%=content%>">15개씩</option>
								<option value="qna_list.jsp?listSize=30&listname=<%=listname%>&content=<%=content%>">30개씩</option>

						</select></td>

					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<!-- --------------------------------------공지 ----------------------------------------------- -->
					<%
					ArrayList<WriteDTO> notice = qnadao.qna_noticelist();
					if(notice!=null&&notice.size()!=0){
					for(int n=0;n<notice.size();n++){
					%>
						<tr class = "notice">
						<td>공 지</td>
						<td>
						<a href="qna_content.jsp?write_idx=<%=notice.get(n).getWrite_idx()%>"class = "notice"><%=notice.get(n).getWrite_title()%></a></td>
						<td><%=notice.get(n).getWrite_writer()%></td>
						<td><%=notice.get(n).getWrite_wdate()%></td>
						<td><%=notice.get(n).getWrite_readnum()%></td>
					</tr>
						<%}
					}%>
					
					<!-- -------------------------------------- ----------------------------------------------- -->
				
					<!-- --------------------------------------게시물 리스트 출력 ----------------------------------------------- -->
					<%
					ArrayList<WriteDTO> arr = qnadao.writeQnAList(userpage,writeList,listname,content);
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
					
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><%=arr.get(i).getWrite_idx()%></td>
						<td><%
						for(int z=0; z<arr.get(i).getWrite_lev();z++){
							out.println("&nbsp;&nbsp;");
							}
						if(arr.get(i).getWrite_lev()>0){
							out.println("&#8627;");
						}
						if(arr.get(i).getWrite_open()==0){ %>
					
						<a href="qnaOpen_pwd.jsp?write_pwd=<%=arr.get(i).getWrite_pwd()%>&write_idx=<%=arr.get(i).getWrite_idx()%> ">
							<%=arr.get(i).getWrite_title()%>[<%=qnadao.commentNum(arr.get(i).getWrite_idx()) %>]  &#128274;</a>
							<%}else{%>
							<a href="qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>">
								<%=arr.get(i).getWrite_title()%>[<%=qnadao.commentNum(arr.get(i).getWrite_idx()) %>]</a>
							<%} %></td>

						<td><%=arr.get(i).getWrite_writer()%></td>
						<td><%=arr.get(i).getWrite_wdate()%></td>
						<td><%=arr.get(i).getWrite_readnum()%></td>
					</tr>

					<%
					}

					}
					%>

				</tbody>
				<!-- -----------------------------검색-------------------------------------------------------------- -->
				<tfoot>
					<tr>
					<form name = "search_list" action = "qna_list.jsp">
					<input type = "hidden" name = "listsize" value = "<%=writeList %>">
					<input type = "hidden" name = "userpage" value = "<%=userpage %>">
						<td colspan="4" align="center"><select name= "listname">
							<option value ="4">제목+내용</option>
								<option value="1">글제목</option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
						</select> <input type="text" name="content" placeholder="내용입력" required = "required"> 
						<input type="submit" value="검색" ></td>
						</form>
						<td>
						<% String wbutton = manager==0?"qna_upload.jsp":"qna_noticeUpload.jsp"; %>
						<input type="button" value="글작성" onclick= "location.href ='<%=wbutton%>'">
						<input type="button" value="목록" onclick= "location.href ='qna_list.jsp'"></td>
						
					</tr>
						<!-- ------------------------------------------------------------------------------------------- -->
						
						
						<!-- ---------------------------------------페이징---------------------------------------------------- -->
					<tr>
						<td colspan="5" align="center">
						<%if(pagegroup!=0){
							%><a href = "qna_list.jsp?userpage=<%=1 %>&listSize=<%=writeList%>&listname=<%=listname%>&content=<%=content%>">&lt;&lt;</a>
							<a href = "qna_list.jsp?userpage=<%=(pagegroup-1)*pageList+pageList%>&listSize=<%=writeList%>&listname=<%=listname%>&content=<%=content%>">이전</a>
							<%} 	
						
						
							for(int i=pagegroup*pageList+1;i<=pagegroup*pageList+pageList;i++){
								%>
								&nbsp;&nbsp;<a href = "qna_list.jsp?userpage=<%=i%>&listSize=<%=writeList%>&listname=<%=listname%>&content=<%=content%>"><%=i%></a>&nbsp;&nbsp;
								
								<%
							if(i==totalpage)break;
							}
							
							if(pagegroup!=(totalpage/pageList-(totalpage%pageList==0?1:0))){
								%>
								<a href = "qna_list.jsp?userpage=<%=(pagegroup+1)*pageList+1%>&listSize=<%=writeList%>&listname=<%=listname%>&content=<%=content%>">다음</a>
								&nbsp;<a href = "qna_list.jsp?userpage=<%=totalpage%>&listSize=<%=writeList%>&listname=<%=listname%>&content=<%=content%>">&gt;&gt;</a>
							<%}
							%>
				</tfoot>
			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>