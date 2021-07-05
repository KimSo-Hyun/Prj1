<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8");%>
<%  
String title=request.getParameter("title");
String content=request.getParameter("content");
String seq=request.getParameter("c");

NoticeDao dao=new NoticeDao();
//int af=dao.update(title, content, seq);
Notice n=new Notice();

n.setSeq(seq);
n.setTitle(title);
n.setContent(content);

int af=dao.update(n);

//dao.update(title, content, seq);

if(af>0)
	response.sendRedirect("noticeDetail.jsp?c="+seq);
else
	out.write("수정오류");
%>



<%-- <%
String sql="update notices set title=?, content=? where seq=?";

//DB connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");
// 접속
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setString(3, seq);

//결과 
pstmt.executeUpdate();
response.sendRedirect("noticeDetail.jsp?c="+seq);


%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeEditProc.jsp</title>
</head>
<body>

<h3>noticeEditProc.jsp</h3>
<%=seq %>

</body>
</html>