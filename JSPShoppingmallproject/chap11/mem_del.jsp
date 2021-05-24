<%@ page language="java" import="java.util.*,java.io.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<%
  String in_userid = (String)session.getAttribute("G_ID");
  
  String realFolder = "";
	String saveFolder = "/chap11/member/up";
	String encType = "utf-8";

	
  ResultSet rs = null;
	
	Statement stmt  = con.createStatement();

	
  	try{
      String SQL = "select * from members where userid = '" + in_userid + "'";
    	rs = stmt.executeQuery(SQL);
    
    	if(rs.next()){
    		String goodsimg1	= rs.getString("image");
    		String filePath1		= getServletContext().getRealPath(saveFolder) + File.separator + goodsimg1;
    		File f1 = new File(filePath1);
    		
    		if (f1.exists()) new File(filePath1).delete();
    	}
  	
  	  SQL = "Delete from members where userid = '" + in_userid + "'";
  	  stmt.executeUpdate(SQL);
  	  
  	  session.invalidate();
  	  
  	  out.println("<script> alert('회원탈퇴 되었습니다. 다음에 또 뵈어요:)');</script>");
  	  out.println("<script>location.href='/chap11/index.jsp';</script>");
  	}
    catch(SQLException e1){
    	e1.printStackTrace();
    } // catch SQLException end
    
    catch(Exception e2){
    	e2.printStackTrace();
    } // catch Exception end
	  

	%>
	<%
  if (stmt  != null) stmt.close();
  if (rs    != null) rs.close();
  if (con   != null) con.close();
  %>
	