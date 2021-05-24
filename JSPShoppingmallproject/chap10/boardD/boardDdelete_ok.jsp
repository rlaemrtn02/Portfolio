<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, java.io.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try
{
	int num		= Integer.parseInt(request.getParameter("pnum"));

	String strSQL 	= "SELECT upfile1, upfile2 FROM boardD WHERE num = ?";
	pstmt = con.prepareStatement(strSQL);
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();

	while (rs.next()){

		String fileName1 = rs.getString("upfile1");
		String fileName2 = rs.getString("upfile2");

		String filePath = getServletContext().getRealPath("/chap10/boardD/upfile") + File.separator + fileName1; 
		File f1 = new File(filePath);

		if (f1.exists()) new File(filePath).delete();

		filePath = getServletContext().getRealPath("/chap10/boardD/upfile")+ File.separator + fileName2; 
		File f2 = new File(filePath);

		if (f2.exists()) new File(filePath).delete();

		strSQL	= "DELETE FROM boardD WHERE num = ?";

		if (pstmt != null) pstmt.close();
		pstmt = con.prepareStatement(strSQL);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();

	}
} //try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (con   != null) con.close();
	
	response.sendRedirect("boardDlist.jsp");
}
%>