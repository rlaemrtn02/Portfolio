<%@ page language="java" import="java.util.*,java.io.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<%
  String realFolder = "";
	String saveFolder = "/chap11/images/";
	String encType = "utf-8";

	
  ResultSet rs = null;
	
	Statement stmt  = con.createStatement();

	String input1 =  request.getParameter("main");
	String input2 =  request.getParameter("sub");
	
	if(!input1.equals("") && !input2.equals(""))
	{
  	try{
  
    	String SQL = "Select * from goodsinfo where cat1cd LIKE '" + input1 + "' and cat2cd LIKE '" + input2 + "'";
    	rs = stmt.executeQuery(SQL);
    
    	while(rs.next()){
    		String goodsimg1	= rs.getString("goodsimg1");
    		String filePath1		= getServletContext().getRealPath(saveFolder) + File.separator + goodsimg1;
    		File f1 = new File(filePath1);
    		
    		if (f1.exists()) new File(filePath1).delete();
    		
    	}
  	
  	  SQL = "Delete from goodsinfo where cat1cd LIKE '" + input1 + "' and cat2cd LIKE '" + input2 + "'";
  	  stmt.executeUpdate(SQL);
  	  
  	  out.println("<script> alert('그룹이 삭제되었습니다.'); history.back();</script>");
  	  out.println("<script>location.href='/khm/admin/goodslist.jsp';</script>");
  	}
    catch(SQLException e1){
    	e1.printStackTrace();
    } // catch SQLException end
    
    catch(Exception e2){
    	e2.printStackTrace();
    } // catch Exception end
	}else if(!input1.equals(""))
	{
	  try{
  
    	String SQL = "Select * from goodsinfo where cat1cd LIKE '" + input1 + "'";
    	rs = stmt.executeQuery(SQL);
      while(rs.next()) {
        String goodsimg1	= rs.getString("goodsimg1");
      	String filePath1		= getServletContext().getRealPath(saveFolder) + File.separator + goodsimg1;
      	File f1 = new File(filePath1);
      		
      	if (f1.exists()) new File(filePath1).delete();
      		
      	
      }
  	
  	  SQL = "Delete from goodsinfo where cat1cd LIKE '" + input1 + "'";
  	  stmt.executeUpdate(SQL);
  	  
  	  out.println("<script> alert('그룹이 삭제되었습니다.'); history.back();</script>");
  	}
    catch(SQLException e1){
    	e1.printStackTrace();
    } // catch SQLException end
    
    catch(Exception e2){
    	e2.printStackTrace();
    } // catch Exception end
	}else if(!input2.equals(""))
	{
	  try{
  
    	String SQL = "Select * from goodsinfo where cat1cd LIKE '" + input2 + "'";
    	rs = stmt.executeQuery(SQL);
    
    	while(rs.next()){
    		String goodsimg1	= rs.getString("goodsimg1");
    		String filePath1		= getServletContext().getRealPath(saveFolder) + File.separator + goodsimg1;
    		File f1 = new File(filePath1);
    		
    		if (f1.exists()) new File(filePath1).delete();
    		
    	}
  	
  	  SQL = "Delete from goodsinfo where cat1cd LIKE '" + input2 + "'";
  	  stmt.executeUpdate(SQL);
  	  
  	  out.println("<script> alert('그룹이 삭제되었습니다.'); history.back();</script>");
  	}
    catch(SQLException e1){
    	e1.printStackTrace();
    } // catch SQLException end
    
    catch(Exception e2){
    	e2.printStackTrace();
    } // catch Exception end
	}else
	{
	  out.println("<script> alert('카테고리를 제대로 선택해주세요.'); history.back();</script>");
	}
	%>
	<%
  if (stmt  != null) stmt.close();
  if (rs    != null) rs.close();
  if (con   != null) con.close();
  %>
	