<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function logoutProc(){
	location.href="login/logoutProc.jsp";
}
</script>
</head>
<body>
<b><font size="5" color="skyblue">메인화면입니다</font></b><br /><br />
<%
if(session.getAttribute("sessionID")==null)//로그인이 안된상태
{
	response.sendRedirect("login/loginForm.jsp");
}else{ //로그인이 된상태
	%>
	<h3>
	<font color="red"><%=session.getAttribute("sessionID") %></font>
	님 로그인 되었습니다
	</h3><br /><br />
	<input type="button" value="logout" onclick="logoutProc();" />
	<% 
}
%>
</body>
</html>