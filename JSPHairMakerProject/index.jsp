<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="main.css">
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
                <%
                String id = (String)session.getAttribute("ID");
		        String nm = (String)session.getAttribute("Name");
                String admin_id = (String)session.getAttribute("G_ADMIN_ID");
                   if (id == null){
                %>
		             <a class="menu_login" href="login.jsp"><span>login</span></a>
                <%
		         }
		         else
		         {
                %>
                   <a  class="menu_login" href="logout.jsp">logout</a>
               <%			
		         }
                   if( admin_id==null){     %>
                      <a class="menu_login" href="admin/admin_login.jsp"> ㅣ<span >admin-login</span></a>
                <%
                   }else{
                %>
                      <a class="menu_login" href="admin/admin_logout.jsp"> ㅣ<span >admin-logout</span></a>
                <%
                }
                %>
           </div>
       </ul>
   </div>
    <h2 class="hide">사이드메뉴</h2>
        <nav class="menu2">
         <ul>
            <li><a href="https://www.instagram.com">instargram</a></li>
            
            
        <%
		

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
         <!--  <div class="con">
               <div class="slide">
                  <div>
                   SUPPORT YOUR<br>
                   CONFIDENCE
                      <p>HAIRMAKER가 당신의 자신감을 응원합니다!</p>
                  </div>
               </div>
           </div>-->
    </section>
    <section class="style">
        <div class="case">
            <div class="title">
                <h1>STYLE GALLERY</h1>
            </div>
            <ul> <!-- 박승철 헤어스투디오 사진 -->
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style1.jpg">
                      <div class="cap">
                          <span># 쁘띠펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style2.jpg">
                      <div class="cap">
                          <span>#&nbsp;winter&nbsp;collection</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style3.jpg">
                      <div class="cap">
                          <span># 플라이펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style4.jpg">
                      <div class="cap">
                          <span># 쁘띠펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style5.jpg">
                      <div class="cap">
                          <span># 니트펌 미디움</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style6.jpg">
                      <div class="cap">
                          <span># 내추럴 드라이펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style7.jpg">
                      <div class="cap">
                          <span># 레이니 콜드펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style8.jpg">
                      <div class="cap">
                          <span># 푸딩펌</span>
                      </div>
                  </a>
              </li>
              <li class="capwrap">
                  <a href="#a">
                     <img src= "image/style9.jpg">
                      <div class="cap">
                          <span># 플라이펌</span>
                      </div>
                  </a>
              </li>
            </ul>
        </div>
    </section>
    <footer class="foot">
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
    </footer>
</body>
</html>