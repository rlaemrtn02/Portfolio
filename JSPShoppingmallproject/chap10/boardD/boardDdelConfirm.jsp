<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>파일 게시판 삭제 확인</TITLE>
 </HEAD>

<script language=javascript>
function submit_delete()
{
	document.frm1.action = "boardDdelete_ok.jsp";
	document.frm1.submit();
}

function submit_list()
{
	document.frm1.action = "boardDlist.jsp";
	document.frm1.submit();
}

</script>

<%@ include file = "/chap10/include/dbinfo.inc" %>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try
{
	int num = Integer.parseInt(request.getParameter("pnum"));

	String strSQL = "SELECT num, title, contents, writer, upfile1, upfile2 FROM boardD WHERE num = ?";
	pstmt = con.prepareStatement(strSQL);
	pstmt.setInt(1, num);
	rs = pstmt.executeQuery();

	if (rs.next() == false)
		out.print("게시글이 없습니다.");
	else
	{
		String writer		= rs.getString("writer");
		String title		= rs.getString("title");
		String contents = rs.getString("contents");
		String upfile1  = rs.getString("upfile1");
		String upfile2  = rs.getString("upfile2");
		String ext1     = null;
		if (upfile1 != null) {
			ext1 =  upfile1.substring(upfile1.indexOf(".") + 1);
		}
		String ext2     = null;
		if (upfile2 != null) {
			ext2 =  upfile2.substring(upfile2.indexOf(".") + 1);
		}
%>
		<h3>파일 게시판 삭제 확인</h3>
		<BODY>
		<FORM NAME = "frm1" METHOD = "post">
		<INPUT TYPE = "hidden" NAME = pnum VALUE = <%= num %>>
		<TABLE WIDTH = "500" BORDER = "1" CellPadding = "0" CellSpacing = "0">
			<TR>
				<TD WIDTH = "40%" ALIGN = "left">번호</TD>
				<TD WIDTH = "60%" ALIGN = "left"><%= num %></TD>
				<INPUT TYPE = "hidden" NAME = "pnum" VALUE = <%= num %>>		
			</TR>
			<TR>
				<TD WIDTH = "40%" ALIGN = "left">작성자명</TD>
				<TD WIDTH = "60%" ALIGN = "left"><%= writer %></TD>
			</TR>
			<TR>
				<TD WIDTH = "40%" ALIGN = "left">제목</TD>
				<TD WIDTH = "60%" ALIGN = "left"><%= title %></TD>
			</TR>
			<TR>
				<TD WIDTH = "40%" ALIGN = "left">첨부</TD>
				<TD WIDTH = "60%" ALIGN = "left">
<%
				if (upfile1 != null) {
					ext1 = ext1.toLowerCase();
					if (ext1.equals("jpg") || ext1.equals("bmp") || ext1.equals("gif") || ext1.equals("png"))
						out.print ("<IMG SRC='/chap10/boardD/upfile/" + upfile1 +"' WIDETH = 100 HEIGHT = 100>");
					else
						out.print ("<IMG SRC='/chap10/boardD/icon_file.gif'> " + upfile1);
				}
				if (upfile2 != null) {
					ext2 = ext2.toLowerCase();
					if (ext2.equals("jpg") || ext2.equals("bmp") || ext2.equals("gif") || ext2.equals("png"))
						out.print ("<BR><IMG SRC='/chap10/boardD/upfile/" + upfile2 +"' WIDETH = 100 HEIGHT = 100>");
					else
						out.print ("<BR><IMG SRC='/chap10/boardD/icon_file.gif'> " + upfile2);
				}
%>
				</TD>
			</TR>
			<TR>
				<TD WIDTH = "40%" ALIGN = "left">내용</TD>
				<TD WIDTH = "60%" ALIGN = "left"><%= contents %></TD>
			</TR>
			<TR>
				<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
				<TABLE>
					<TR>
						<TD WIDTH = "50%" ALIGN = "center">
							<INPUT TYPE = "button" VALUE = "삭제완료" onclick = "submit_delete()">
						</TD>
						<TD WIDTH = "50%" ALIGN = "center">
							<INPUT TYPE = "button" VALUE = "목록으로" onclick = "submit_list()">
						</TD>
					</TR>
				</TABLE>
				</FORM>
				</TD>
			</TR>
		</TABLE>
		</BODY>
<%
	} // if (rs.next() == false) else end
} //try end

catch(SQLException e1){
	out.println(e1.getMessage());
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
	if (pstmt != null) pstmt.close();
	if (rs    != null) rs.close();
	if (con   != null) con.close();
} // finally end
%>
</HTML>