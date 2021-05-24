<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	boolean fnd = false;

	if (id == null)
		id = "";
	else
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=KJH_book;user=kjh;password=00";
		Connection con = DriverManager.getConnection(connectionURL);
		ResultSet rs = null;

		Statement stmt	= con.createStatement();
		String strSQL	= "SELECT userid FROM members WHERE userid='" + id + "'";
		rs = stmt.executeQuery(strSQL);

		if (rs.next()) fnd = true;   // select 된 결과 행이 있음

		stmt.close();
		con.close();
	}
%>

<HTML>
<HEAD><TITLE>id check</TITLE></HEAD>

<script language="JavaScript">
function id_search() 
{
	if(document.form1.id.value=="") 
	{
		alert("ID를 입력해 주세요.");
		document.form1.id.focus();
	}
	else
	{
		document.form1.submit();
	}
}

function id_ok(a)
{
  opener.document.frm1.userid.value=a;
  self.close();   
}
</script>

<BODY>
<CENTER>
<BR>
<P align="center">사용하고자 하는 ID를 검색 버튼을 누르세요</P>
<FORM NAME = "form1" ACTION = "id_check.jsp" METHOD = "POST" >
  <TABLE WIDTH="200">
    <TR>
      <TD WIDTH="150">ID</TD>
      <TD WIDTH="100"><INPUT TYPE="text"   NAME="id"  size="20" VALUE=<%= id %>></TD>
      <TD WIDTH="40" ><INPUT TYPE="button" VALUE="검색" onClick="javascript:id_search()"></TD>
    </TR>
  </TABLE>
</FORM>
<% 
	if (id != "" && fnd == false)  
	{ 
%>
		사용 가능한 ID 입니다<P>
		확인을 누르시면 회원등록 화면으로 돌아갑니다.

		<A  HREF="javascript:id_ok('<%= id %>')"</A>확인
<% 
	}
	else if (id != "" && fnd == true)
	{ 
%>
		이미 사용 중인 ID 입니다.
<%
	}
%>
</CENTER>
</BODY>
</HTML>