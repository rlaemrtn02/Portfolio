<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=project;user=chs;password=00";
Connection con = DriverManager.getConnection(connectionURL);
PreparedStatement pstmt = null;

String suserID = request.getParameter("userID");
String suserName = request.getParameter("userName");
String suserPassword = request.getParameter("userPassword");
String suserGender = request.getParameter("userGender");
String suserEmail = request.getParameter("userEmail");

String SQL= "insert into members(userID,userName,userPassword,userGender,userEmail) values(?,?,?,?,?)";
pstmt=con.prepareStatement(SQL);

pstmt.setString(1, suserID);
pstmt.setString(2, suserName);
pstmt.setString(3, suserPassword);
pstmt.setString(4, suserGender);
pstmt.setString(5, suserEmail);

pstmt.executeUpdate();
pstmt.close();
con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <script>
			location.href='login.jsp';
        alert("가입 완료");
	</script>
</body>
</html>