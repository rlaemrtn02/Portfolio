<%@ page language="java" import="java.util.*,java.io.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=KJH_book;user=kjh;password=00";
	Connection con = java.sql.DriverManager.getConnection(connectionURL);

	PreparedStatement pstmt = null;
	String realFolder = "";
	String saveFolder = "/chap11/member/up/";
	String encType = "utf-8";

	int sizeLimit = 10 * 1024 * 1024;
	realFolder = application.getRealPath(saveFolder);
	MultipartRequest multi	= new MultipartRequest(request,realFolder,sizeLimit,encType);
	
	String suserid = multi.getParameter("userid");
	String susernm = multi.getParameter("usernm");
	String simage	= multi.getFilesystemName("image");
	String spasswd = multi.getParameter("passwd");
	String sjumin = multi.getParameter("jumin1") + multi.getParameter("jumin2");
	String smailrcv = multi.getParameter("mailrcv");
	if(smailrcv != null && smailrcv.equals("on"))
		smailrcv="Y";
	else
		smailrcv="N";
	String sgender = multi.getParameter("gender");
	String sjob = multi.getParameter("job");
	String sintro = multi.getParameter("intro").replace("\r\n","<br>");
	
	String SQL = "update members set usernm=?";
	if (simage != null)
		SQL		=  SQL + ", image	= ? ";
	SQL = SQL + ", jumin=?, mailrcv=?, gender=?, jobcd=?, intro=? where userid=? ";
	pstmt = con.prepareStatement(SQL);
	
	if (simage != null)
	{
		pstmt.setString(1,susernm);
		pstmt.setString(2,simage);
		pstmt.setString(3,sjumin);
		pstmt.setString(4,smailrcv);
		pstmt.setString(5,sgender);
		pstmt.setString(6,sjob);
		pstmt.setString(7,sintro);
		pstmt.setString(8,suserid);
	}else
	{
		pstmt.setString(1,susernm);
		pstmt.setString(2,sjumin);
		pstmt.setString(3,smailrcv);
		pstmt.setString(4,sgender);
		pstmt.setString(5,sjob);
		pstmt.setString(6,sintro);
		pstmt.setString(7,suserid);
	}
	
	int cnt = pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	out.println("<script>alert('변경이 완료 되었습니다.');</script>");
	out.println("<script>location.href='/chap11/index.jsp';</script>");
%>
