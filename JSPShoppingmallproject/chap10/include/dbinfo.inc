<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433; databaseName=KJH_book;user=KJH;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
%>