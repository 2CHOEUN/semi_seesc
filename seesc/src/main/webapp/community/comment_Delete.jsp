<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%
int comm_idx=0;

String userinputpwd = request.getParameter("userinputpwd");
String comm_pwd = request.getParameter("comm_pwd");
String flag = request.getParameter("flag");
if(request.getParameter("comm_idx")==null||request.getParameter("comm_idx").equals("")){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href = 'qna_list.jsp';
	</script> 
<%
return;}

/**비회원일경우 비밀번호 일치하는지 확인*/
if(userinputpwd!=null&&userinputpwd.equals(comm_pwd)){
	comm_idx = Integer.parseInt(request.getParameter("comm_idx"));
	int result = qnadao.comment_Delete(comm_idx);
	if(result<0){
		%>
		<script>
		window.alert('댓글 삭제에 실패하였습니다.');
		history.back();
		</script>
		<%
	}else{
	%>
	<script>
	window.alert('댓글을 삭제하였습니다.');
	location.href = 'qna_content.jsp?write_idx=<%=request.getParameter("write_idx")%>';
	</script>
<%}
}else if(flag!=null&&flag.equals("commdel")){
	comm_idx = Integer.parseInt(request.getParameter("comm_idx"));
	int result = qnadao.comment_Delete(comm_idx);
	%>
	<script>
	location.href = 'qna_content.jsp?write_idx=<%=request.getParameter("write_idx")%>';
	</script>
	<%
}else{%>
			<script>
		window.alert('비밀번호가 일치하지 않습니다.');
		history.back();
		</script>
<%} %>
