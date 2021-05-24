<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try
{
	String writername	= request.getParameter("writername");  
	String title		= request.getParameter("title");
	String pwd_chk		= request.getParameter("pwd_chk");
	if (pwd_chk == null) pwd_chk = "N";
	String pwd		= request.getParameter("pwd");
	String contents		= request.getParameter("contents");
		
	String strSQL = "select isnull(max(num), 0) from boardC";
	pstmt = con.prepareStatement(strSQL);

	rs = pstmt.executeQuery();

	rs.next();

	int maxnum = rs.getInt(1) + 1;

	strSQL ="INSERT INTO boardC(num, mgrp, mseq, mlvl, title, contents, lock_yn, pwd, writer, writedtm, updatedtm) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(strSQL);

	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))		+ "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1)	+ "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE))		+ " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY))	+ ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE))		+ ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

	pstmt.setInt   (1, maxnum);
	pstmt.setInt   (2, maxnum);
	pstmt.setInt   (3, 0);
	pstmt.setInt   (4, 0);

	pstmt.setString(5, title);
	pstmt.setString(6, contents);
	pstmt.setString(7, pwd_chk);
	pstmt.setString(8, pwd);
	pstmt.setString(9, writername);
	pstmt.setString(10, indate);
	pstmt.setString(11, indate);

	pstmt.executeUpdate();

} // try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (rs    != null) rs.close();
	if (con   != null) con.close();

	response.sendRedirect("boardClist.jsp");
} // finally end
%>