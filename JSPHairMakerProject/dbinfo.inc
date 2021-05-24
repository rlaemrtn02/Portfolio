<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=project;user=chs;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
%>