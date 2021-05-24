<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=project;user=chs;password=00";
Connection con = DriverManager.getConnection(connectionURL);
PreparedStatement pstmt = null;
ResultSet rs= null;


String suserID = request.getParameter("userID");
String suserPassword = request.getParameter("userPassword");


String SQL="select userName from members where userID=? and userPassword=?";
pstmt=con.prepareStatement(SQL);

pstmt.setString(1, suserID);
pstmt.setString(2, suserPassword);


rs=pstmt.executeQuery();


if(rs.next() == true){
   session.setAttribute("ID",suserID);
   session.setAttribute("Name",rs.getString(1));
   session.setMaxInactiveInterval(60 * 60);
   
   response.sendRedirect("index.jsp");
   }
else 
   %>
    <script>
      alert("아이디 또는 비밀번호가 틀렸습니다.");
      location.href("login.jsp");
     </script>
<% 

pstmt.close();
rs.close();
con.close();
%>