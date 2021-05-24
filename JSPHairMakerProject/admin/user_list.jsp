<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.*, java.text.*" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="en">

<%
		String id = (String)session.getAttribute("G_ADMIN_ID");
		if (id == null)	
		{
			out.print("<script type=text/javascript>");
			out.print("alert('관리자 로그인을 하시기 바랍니다.!!!');");
			out.print("location.href = 'admin_index.jsp';");
			out.print("</script>");
		}
%>
<head>
  <link href="/chap11/includes/all.css" rel="stylesheet" type="text/css" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>회원 리스트</title>
</head>

<style>
    html,body{margin:0px;}
    h3{left:370px; top:135px; left:50%; transform:translateX(-50%); position:absolute;}
    .contents{top:150px;left:50%; transform:translateX(-50%); position:relative;}
    .top{ left:50%; transform:translateX(-50%); position:relative;}
</style>
<body>
  <table class="top">
   <%@  include file="/chap11/includes/admin_top.inc" %>
  
    <H3>희수 쇼핑몰 회원 리스트</H3>
    <Table class= "contents" border="1" cellspacing= "1" cellpadding="2" width= "600" >
        
    <tr bgcolor="cccccc">
        <th><fontsize="2"><center><b>회원ID</b></center></fontsize></th>
        <th><fontsize="2"><center><b>회원명</b></center></fontsize></th>
        <th><fontsize="2"><center><b>성별</b></center></fontsize></th>
        <th><fontsize="2"><center><b>생년월일</b></center></fontsize></th>
        <th><fontsize="2"><center><b>메일수신여부</b></center></fontsize></th>
    </tr>
    
    <%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=choiheesu;user=chs;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
	ResultSet rs=null;
	
	Statement stmt= con.createStatement();
	
	String SQL = "select userid,usernm,gender,jumin,mailrcv from members order by userid";
	rs=stmt.executeQuery(SQL);
	while(rs.next()){
	
	String userid = rs.getString("userid");
	String usernm = rs.getString("usernm");
	String jumin1 = rs.getString("jumin");
	String jumin2 = "";
	if(jumin1 != null){
	jumin2 = jumin1.substring(0,6);
	}
	String gender = rs.getString("gender");
	
	
	if(gender==null)
	    gender="";
    else if(gender.equals("1"))
        gender="남";
    else if(gender.equals("2"))
        gender="여";
    else
        gender ="기타";
        
        
	String mailrcv = rs.getString("mailrcv");
	
	if(mailrcv==null)
	    mailrcv="";
    else if(mailrcv.equals("Y"))
        mailrcv="동의";
    else if(mailrcv.equals("N"))
        mailrcv="동의안함";
    else 
        mailrcv="";
    
	
%>
   <tr>
       <td><%= userid %></td>
       <td><%= usernm %></td>
       <td><%= gender %></td>
       <td><%= jumin2 %></td>
       <td><%= mailrcv %></td>
   </tr>
<%
}
   stmt.close();
   rs.close();
   con.close();
   
   %> 
      
    </Table>
    </table>
</body>