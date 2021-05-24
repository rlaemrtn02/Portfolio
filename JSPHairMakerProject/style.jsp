<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "dbinfo.inc" %>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
    <h1><a href="index.jsp">hairmaker</a></h1>
    <h2 class="hide">주메뉴</h2>
      <nav class="menu1">
       <ul>
         <li><a href="style.jsp">Style</a></li>
         <li><a href="event.html">Event</a></li>
         <li><a href="shop.html">Shop</a></li>
         <li><a href="test.jsp">Hairstory</a></li>
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
    <!-- search 검색창 -->
        <div class="searchwrap"><form method=post action=/join/style.jsp><input type=text id="search" placeholder="스타일또는 지점을 검색해보세요." name="search_box" style="width:220px; height:35px; font-size:14px; margin-right:10px; "><input class="btn" style="height:40px; width:60px;"type="submit" value="확인" onmouseup="pointer" >
        <a href="style.jsp"><input class="btn" style="height:40px; width:70px;"type="button" value="모두보기" onmouseup="pointer" ></a></form></div>
    <!-- contents 시작 -->
    <style>
        #search:hover{border:2px solid orange; }
        #search{ transition:border .5s;}
        .btn {color:orange; background-color: dimgrey; border:1px solid black;transition:.5s; cursor: pointer;}
        .btn:hover {border: 1px solid orange; display: inline-block;}
        .searchwrap{text-align: center;margin-bottom: 30px; }
        .imagewrap{text-align: center; position: relative;}
        .imgcover{display: inline-block; position: relative}
        .none{display: none;}
        .lasttest{width:300px; height:420px;  position: absolute; z-index: 1000; top:0px; color:transparent;}
        .gle{top:45%; position:relative; font-size:10px; }
        .lasttest:hover{background-color:rgba(0,0,0,.5); color:white; transition:.5s;}
        .lasttest1:hover{background-color:rgba(0,0,0,.5); font-size: 20px; color:white; transition:.5s;}
        .search_result{display: inline-block;}
        .lasttest1{width:400px; height:560px; position:absolute; top:0px; font-size: 0px; color:transparent;}
        .lasttest:hover .gle{font-size:20px;}
        .lasttest1:hover .gle{font-size:20px;}
    </style>
    <div class="imagewrap">
    <%
				ResultSet rs = null;
				ResultSet rs2 = null;
				Statement stmt  = con.createStatement();
				
				String search   = request.getParameter("search_box");
                if(search == ""){
                    out.println("<script> alert('검색어를 입력하세요'); history.back();</script>");
                  }else {
                   out.println("<script>  $('#nosearch').addClass('none'); </script>");
  
                  String SQL = "select a.*, b.* from goodsinfo a inner join category2 b on a.cat2cd   = b.cat2cd where a.goodsnm like '%" + search + "%' or b.cat2nm like '%" + search + "%'";
                  
                  rs = stmt.executeQuery(SQL);
                  if(search!=null)
                       out.println(search);
                out.print("<div class='hi'>");
                  while (rs.next())
                     {
                        String goodscd      = rs.getString("goodscd");
                        String goodsnm      = rs.getString("goodsnm");
   
                        int unitprice         = rs.getInt("unitprice");
                        String goodsimg1   = rs.getString("goodsimg1");
                        String cat2nm  = rs.getString("cat2nm");
                        
            %>
			
                        <div class="search_result imgcover">
                                <a href='goodsdetail.jsp?pgoodscd=<%= goodscd %>'>
                                <img width="400" height="560"src='/join/style/<%= goodsimg1 %>'>
                                    <div class="lasttest1"><span class="gle">#<%= cat2nm %><br><%= goodsnm %></span></div></a>
                        </div>
            <%
                     }
               out.print("</div>");
   
                  }    
                    
                         
                         if(search==null){
                          String SQL1 = "select * from goodsinfo a,category2 b where a.cat2cd=b.cat2cd and a.best_YN = 'Y'";
                          rs2 = stmt.executeQuery(SQL1);
                       while(rs2.next())
                       {
                           String goodscd1 = rs2.getString("goodscd");
                           String goodsimg2	= rs2.getString("goodsimg1");
                           String cat2nm1  = rs2.getString("cat2nm");
                           String goodsnm1 = rs2.getString("goodsnm");
            %>
                       <div class="imgcover" id="nosearch">
                                 <a href="goodsdetail.jsp?pgoodscd=<%= goodscd1 %>">
                                  <img src="/join/style/<%= goodsimg2 %>" width="300" height="420" class="heesu" />
                                 <div class="lasttest"><span class="gle">#<%= cat2nm1 %><br><%= goodsnm1 %></span></div></a>
                       </div> 
            <%             
                            }
                        }
						if (rs2   != null) rs2.close();
						if (stmt  != null) stmt.close();
						if (rs    != null) rs.close();
						if (con   != null) con.close();
					%>
                 
         </div>               
						
             
             
             
             
             
    <footer class="foot">
        <div class="footer">
        <div class="fotleft">
            dqdq4197@naver.com
        </div>
        <div class=fotright>
             html,css,javascript,jsp - 최희수<br>
             jsp,database - 김득수 <br>
             design - 구자훈<br>
        </div>
        </div>
    </footer>
</body>
</html>