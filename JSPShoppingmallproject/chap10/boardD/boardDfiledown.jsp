<%@ page contentType="application; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.io.*, java.sql.*, java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file = "/chap10/include/dbinfo.inc" %>		
<%
String num   	= request.getParameter("pnum"); 
String ftype 	= request.getParameter("ftype"); 

Statement stmt = null;
ResultSet rs   = null;

try
{

	stmt = con.createStatement();
		
	rs = stmt.executeQuery("SELECT upfile1, upfile2 FROM boardD WHERE num =" + num);
	rs.next();

	String dbfilename = null;

	if (ftype.equals("1")) dbfilename = rs.getString("upfile1");
	if (ftype.equals("2")) dbfilename = rs.getString("upfile2");

	int BUFSIZE = 4096;
	String filePath;
	 
	filePath = getServletContext().getRealPath("/chap10/boardD/upfile")+ File.separator + dbfilename; // + "a.txt";
	File file = new File(filePath);

	int length   = 0;

	out.clear();
	out = pageContext.pushBody();

	ServletOutputStream outStream = response.getOutputStream();
	response.setContentType("text/html");
	response.setContentLength((int)file.length());

	String fileName = (new File(filePath)).getName();

	response.setContentType("application/x-msdownload");
	String convFileName = java.net.URLEncoder.encode(fileName,"UTF-8");    
	response.setHeader("Content-Disposition", "attachment; filename=\"" + convFileName + "\"");
	
	byte[] byteBuffer = new byte[BUFSIZE];
	DataInputStream in = new DataInputStream(new FileInputStream(file));
	 
	while ((in != null) && ((length = in.read(byteBuffer)) != -1))
	{
		outStream.write(byteBuffer, 0,length);
	}
	 
	in.close();
	outStream.close();
	 

} // try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (stmt != null) stmt.close();
	if (rs   != null) rs.close();
	if (con  != null) con.close();
} // finally end
%>
