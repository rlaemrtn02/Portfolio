﻿<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>파일 업로드</TITLE>
 </HEAD>

<script language=javascript>
function valid_check()
{

	if (document.frm1.writername.value == "")
	{
		alert("작성자명을 입력바랍니다.");
		document.frm1.writername.focus(); 
		return false;
	}

	if (document.frm1.title.value == "") 
	{
		alert("제목을 입력바랍니다.");
		document.frm1.title.focus(); 
		return false;
	}

	if (document.frm1.contents.value == "") 
	{
		alert("내용을 입력바랍니다.");
		document.frm1.contents.focus(); 
		return false;
	}

	document.frm1.submit();
}

function submit_list()
{
	document.frm1.action = "boardDlist.jsp";
	document.frm1.submit();
}

 </script>
<h3>파일 업로드</h3>
<BODY>
<FORM NAME = "frm1" ACTION = "boardDwrite_ok.jsp" METHOD = "post" ENCTYPE="multipart/form-data">
<TABLE WIDTH = "500" BORDER = "1" CellPadding = "0" CellSpacing = "0">
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">작성자명</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "writername">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">제목</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="text" NAME="title" SIZE = "50" MAXLENGTH = "50">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">내용</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<TEXTAREA NAME="contents" ROWS=5 COLS=50></TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">첨부파일1</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="file" NAME="file1" >
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">첨부파일2</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="file" NAME="file2" >
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
		<TABLE>
			<TR>
				<TD WIDTH = "33%" ALIGN = "center">
					<INPUT TYPE = "reset" VALUE = "다시 작성">
				</TD>
				<TD WIDTH = "34%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "등록" onClick="valid_check()">
				</TD>
				<TD WIDTH = "33%" ALIGN = "center">
					<INPUT TYPE = "button" VALUE = "목록으로" onClick = "submit_list()">
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>