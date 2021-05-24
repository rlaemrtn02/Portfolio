<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>

<head>
<link href="/chap11/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>쇼핑몰 모형</title>

<link href="/chap11/includes/all.css" rel="stylesheet" type="text/css" />

</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
		<table width="815" border="0" cellspacing="0" cellpadding="0">
			<%@ include file="/chap11/includes/top.inc" %>
		</table>
	</td>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">
		<table width="815" border="0" cellspacing="0" cellpadding="0">
<div class="wrap">
	 <div class="a" style="margin-bottom:100px">
			<div class="a_sec"> &nbsp;&nbsp;<b>검색결과</b>&nbsp;&nbsp; </div>
            <%
						ResultSet rs = null;
						ResultSet rs2 = null;
						Statement stmt  = con.createStatement();
						
						String search	= request.getParameter("search_box");
						
						if(search == ""){
						  out.println("<script> alert('검색어를 입력하세요'); history.back();</script>");
						}else {
						String SQL = "select a.*, b.* from goodsinfo a inner join category2 b on a.cat2cd	= b.cat2cd where a.goodsnm like '%" + search + "%' or b.cat2nm like '%" + search + "%'";
						rs = stmt.executeQuery(SQL);
						
						if(rs.next() == false)
						{
                            out.println("검색결과가 없습니다.");
						}else
						{
							SQL = "select * from goodsinfo a inner join category2 b on a.cat2cd	= b.cat2cd where a.goodsnm like '%" + search + "%' or b.cat2nm like '%" + search + "%'";
							rs = stmt.executeQuery(SQL);
							while (rs.next())
							{
								String goodscd		= rs.getString("goodscd");
								String goodsnm		= rs.getString("goodsnm");
	
								int unitprice			= rs.getInt("unitprice");
								String goodsimg1	= rs.getString("goodsimg1");
								
				%>
								<div class="b_cnt1">
								<a href='goodsdetail.jsp?pgoodscd=<%= goodscd %>'><img src='/chap11/images/<%= goodsimg1 %>'></a>
								<div class='most_name'><%= goodsnm %></div>
								<div class='most_type'>
								<% 		
									DecimalFormat df = new DecimalFormat("###,###,##0"); 
									out.println(df.format(unitprice));	
								%>
								</div>
								</div>
				<%
							}
	
						}
						}		
				%>			
							
	</div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
</table>
<%@ include file="/chap11/includes/bottom1.inc" %>
</table>    
</td>
</tr>
</table>
</body>
</html>
<%
if (stmt  != null) stmt.close();
if (rs    != null) rs.close();
if (rs2    != null) rs2.close();
if (con   != null) con.close();
%>
</BODY>