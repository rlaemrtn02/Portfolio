<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "dbinfo.inc" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">  <!--폰트-->
    <link href="https://fonts.googleapis.com/css?family=Kurale|Libre+Baskerville|Nanum+Brush+Script|Song+Myung" rel="stylesheet">
    <title>hairmake</title>
</head>
<body>

<!--  <script>
            $(document).ready(function(){
                $("#list1").click(function(){
                    $(".sl-wrap").animate({left:0%});
                });
            });
        </script>-->
    
   <header>
    <h1><a href="index.html">hairmaker</a></h1>
    <h2 class="hide">주메뉴</h2>
      <nav class="menu1">
       <ul>
         <li><a href="style.jsp">Style</a></li>
         <li><a href="event.html">Event</a></li>
         <li><a href="shop.html">Shop</a></li>
         <li><a href="#a">Hairstory</a></li>
         <li><a href="#a">Item</a></li>
       </ul>
      </nav>
      <input type="checkbox" id="hambug">
      <div class=side-wrap>
   <label for="hambug">
       <span></span>
       <span></span>
       <span></span>
   </label>
   </div>
   <div class="menu-slide">
       <ul class="menu-slide-ul">
           <a href="style.jsp"><li class="menu-slide-li">Style</li></a>
         <a href="event.html"><li class="menu-slide-li">Event</li></a>
           <a href="shop.html"><li class="menu-slide-li">Shop</li></a>
           <a href=#a><li class="menu-slide-li">Hairstory</li></a>
           <a href=#a><li class="menu-slide-li">Item</li></a>
           <a href="map.html"><li class="menu-slide-li">map</li></a>
           <div>
               <a class="menu_login" href="login.jsp"> <span >login</span></a>
           </div>
       </ul>
   </div>
    <h2 class="hide">사이드메뉴</h2>
        <nav class="menu2">
         <ul>
            <li><a href="https://www.instagram.com">instargram</a></li>
            
            
        <%
		String id = (String)session.getAttribute("ID");
		String nm = (String)session.getAttribute("Name");

		if (id == null)	
		{
         %>
		    <li><a href="login.jsp">login</a></li>
            <%
		}
		else
		{
        %>
            <li><a href="logout.jsp">logout</a></li>
        <%			
		}
        %>

            
            
         </ul>
        </nav>
    </header>
    <section class="bannel">
       <h2 class="hide">광고</h2>
       <div class="container">
        <figure class="sl-wrap">
            <div class="sl"><img src="image/bannel1.jpg"></div>
            <div class="sl"><img src="image/bannel2.jpg"></div> 
            <div class="sl"><img src="image/bannel5.jpg"></div>                
            <div class="sl"><img src="image/bannel2.jpg"></div>                
            <div class="sl"><img src="image/bannel1.jpg"></div>                
        </figure>                
       </div>
       <div class="control">
         <div>
          <div>
           <a href="#a" class="start">시작</a>
           <a href="#a" class="pause">일시정지</a>
          </div>
          <ul>
              <li id="list1"><a href="#a">배너1</a></li>
              <li id="list2"><a href="#a">배너2</a></li>
              <li id="list3"><a href="#a">배너3</a></li>
              <li id="list4"><a href="#a">배너4</a></li>
              <li id="list5"><a href="#a">배너5</a></li>
          </ul>
        </div>
       
       </div>
    </section>
    <!-- contents 시작 -->
    <style>
        .imgcover{display: inline-block;position: relative;text-align: center;}
    </style>
    <%
				ResultSet rs = null;
				Statement stmt  = con.createStatement();

				String SQL = "select * from goodsinfo a where a.best_YN = 'Y'";
				rs = stmt.executeQuery(SQL);
				int cnt = 0;
						while (rs.next()){
							String goodscd		= rs.getString("goodscd");
							String goodsnm		= rs.getString("goodsnm");

							int unitprice			= rs.getInt("unitprice");
							String goodsimg1	= rs.getString("goodsimg1");
							%>
			
    <div class="imgcover">
            <a href="goodsdetail.jsp?pgoodscd=<%= goodscd %>">
           
                        <!--<%
						    cnt ++;      // s
                            
						    if (cnt == 1)
						    	out.print("<div class='test1'>");
						 %>-->
             <img src="/join/style/<%= goodsimg1 %>" width="300" height="420" class="heesu" />
            </a>
            
                   <%
                    cnt ++;      // s

						if (cnt == 3)
							out.print("</TR><TR>");
						}

						if (cnt != 3)
							out.print("</TR>");
						if (stmt  != null) stmt.close();
						if (rs    != null) rs.close();
						if (con   != null) con.close();
					%>

            </div>      
                        
						
             
             
             
             
             
<!--    <footer class="foot">
        <div class="footer">
        <div class="fotleft">
            dqdq4197@naver.com
        </div>
        <div class=fotright>
             html,css,javascript - 최희수<br>
             php,database - 김득수 <br>
             design - 구자훈<br>
        </div>
        </div>
    </footer>-->
</body>
</html>