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
<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="/chap11/icons/main_01.jpg" style="width:100%" alt="First slide">
			<div class="container">
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="/chap11/icons/main_02.jpg" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="/chap11/icons/main_03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
</br></br></br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">
		<table width="815" border="0" cellspacing="0" cellpadding="0">
			<%
				ResultSet rs = null;
				Statement stmt  = con.createStatement();

				String SQL = "select * from goodsinfo a where a.best_YN = 'Y'";
				rs = stmt.executeQuery(SQL);
			%>
      <tr>
        <td height="239" align="center" valign="top">
					<table width="800" border="0" cellspacing="0" cellpadding="0"><!- table32>
		  <tr>
		  <td height="45" align="left" class="new_tit1"></td>
		  <td height="45" colspan="3" align="right" class="new_tit"><form method=post action=/chap11/search.jsp><input type=text id="search" name="search_box" style="width:150px; height:20px; font-size:10px; margin-right:10px; "><input type=image src="/chap11/icons/search_btn.png" style="height:20px; position: absolute;" ></from></td>
		  </tr>
          <tr>
            <td height="45" align="left" class="new_tit1">BEST PRODUCT</td>
            <td height="45" colspan="3" align="right" class="new_tit"><a href="#">more</a></td>
          </tr>
          <tr>
					<%
						int cnt = 0;
						while (rs.next()){
							String goodscd		= rs.getString("goodscd");
							String goodsnm		= rs.getString("goodsnm");

							int unitprice			= rs.getInt("unitprice");
							String goodsimg1	= rs.getString("goodsimg1");
					%>
            <td width="200" align="center" valign="top">
						<table width="190" border="0" cellspacing="0" cellpadding="0"><!- table4>
              <tr>
                <td align="center"><a href="goodsdetail.jsp?pgoodscd=<%= goodscd %>"><img src="/chap11/images/<%= goodsimg1 %>" width="170" height="170" border="0" /></a></td>
              </tr>
              <tr>
                <td height="50" align="center"><a href="/chap11/goodsdetail.jsp?pgoodscd=<%= goodscd %>"><%= goodsnm %><br />
								<% 		
										DecimalFormat df = new DecimalFormat("###,###,##0"); 
										out.println(df.format(unitprice));	
								%>
                  원</a></td>
              </tr>
						</table>
						</td>
					<%
						cnt ++;      // 

						if (cnt == 4)
							out.print("</TR><TR>");
						}

						if (cnt != 4)
							out.print("</TR>");
						if (stmt  != null) stmt.close();
						if (rs    != null) rs.close();
						if (con   != null) con.close();
					%>
					</table>
			</tr>
			
	</table> 
	<%@ include file="/chap11/includes/bottom1.inc" %>
</body>
</html>