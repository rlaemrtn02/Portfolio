<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <TITLE> 상품등록(1)</TITLE>
	<link href="/join/hairstory.css" rel="stylesheet" type="text/css" />
</HEAD>
<%
		String id = (String)session.getAttribute("G_ADMIN_ID");
		if (id == null)	
		{
			out.print("<script type=text/javascript>");
			out.print("alert('관리자 로그인을 하시기 바랍니다.!!!');");
			out.print("location.href = 'admin_login.jsp';");
			out.print("</script>");
		}
%>

<script language=javascript>
function valid_check()
{

	if (document.frm1.cat1cd.value == "")
	{
		alert("대분류를 선택하여 주시기 바랍니다.");
		document.frm1.cat1cd.focus();
		return false;
	}

	if (document.frm1.cat2cd.value == "")
	{
		alert("중분류를 선택하여 주시기 바랍니다.");
		document.frm1.cat2cd.focus();
		return false;
	}

	document.frm1.submit();

}

function KeyNumber()
{
	var event_key = event.keyCode;	

	if((event_key < 48 || event_key > 57) && (event_key != 8 && event_key != 46))
	{
		event.returnValue=false;
	}
}

function cat1cd_Change() {
	var x					= document.frm1.cat1cd.options.selectedIndex;
	var cat1size	= document.frm1.cat1cd.options.length;  //6
	var cat2G			= new Array(cat1size);

	for (i = 0; i < cat1size; i++)
		cat2G[i] = new Array();

	cat2G[0][0]	=	new Option("대분류를 먼저 선택하세요","");
	cat2G[1][0]	=	new Option("==중분류를 선택하세요==","");
	cat2G[1][1]	=	new Option("레이어드컷",		"AA");
	cat2G[1][2]	=	new Option("뱅헤어",				"AB");
	cat2G[1][3]	=	new Option("비대칭컷",				"AC");
	cat2G[1][4]	=	new Option("샤기컷",				"AD");
	cat2G[1][5]	=	new Option("보브컷",				"AE");
	cat2G[1][6]	=	new Option("원랭스컷",				"AF");
	cat2G[1][7]	=	new Option("머쉬룸컷",				"AG");

	cat2G[2][0]	=	new Option("==중분류를 선택하세요==","");
	cat2G[2][1]	=	new Option("C컬펌",				"BA");
	cat2G[2][2]	=	new Option("S컬펌",			"BB");
	cat2G[2][3]	=	new Option("내츄럴펌",				"BC");
	cat2G[2][4]	=	new Option("글램펌",				"BD");
	cat2G[2][5]	=	new Option("볼륨펌",				"BE");
	cat2G[2][6]	=	new Option("아이롱펌",				"BF");

	cat2G[3][0]	=	new Option("==중분류를 선택하세요==","");
	cat2G[3][1]	=	new Option("다크브라운",				"CA");
	cat2G[3][2]	=	new Option("레드브라운",		"CB");
	cat2G[3][3]	=	new Option("밀크브라운",				"CC");
	cat2G[3][4]	=	new Option("카키브라운",			"CD");
    
    cat2G[4][0]	=	new Option("==중분류를 선택하세요==","");
	cat2G[4][1]	=	new Option("포니테일",				"DA");
	cat2G[4][2]	=	new Option("땋은머리",		"DB");
	cat2G[4][3]	=	new Option("번헤어",				"DC");
    
    cat2G[5][0]	=	new Option("==중분류를 선택하세요==","");
	cat2G[5][1]	=	new Option("웨딩",				"FA");
	cat2G[5][2]	=	new Option("혼주",		"FB");
	cat2G[5][3]	=	new Option("돌잔치",				"FC");
	cat2G[5][4]	=	new Option("프로필",				"FD");


	temp = document.frm1.cat2cd;
	for (m = temp.options.length - 1; m > 0; m--)
	 temp.options[m] = null;

	 for (i = 0; i < cat2G[x].length; i++){
		temp.options[i] = new Option(cat2G[x][i].text, cat2G[x][i].value);
	 }

	 temp.options[0].selected = true;
}

</script>

<BODY>

    <h1><a href="index.jsp">hairmaker</a></h1>
    <h2 class="hide">주메뉴</h2>
      <nav class="menu1">
       <ul>
         <li><a href="style.jsp">Style</a></li>
         <li><a href="event.html">Event</a></li>
         <li><a href="shop.html">Shop</a></li>
         <li><a href="admin/goodsinfo_insert1.jsp">Hairstory</a></li>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
		<table width="815" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="top"><table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="547" height="45" align="left" class="new_tit">상품등록</td>
          </tr>
          <tr>
						<FORM NAME = "frm1" ACTION = "goodsinfo_insert1_ok.jsp" METHOD = "post" enctype="multipart/form-data">
            <td align="center">
							<table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">대분류</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
										<SELECT NAME="cat1cd" onChange="cat1cd_Change();">
											<OPTION VALUE="">==대분류를 선택하세요==</OPTION>
											<OPTION VALUE="A">커트</OPTION>
											<OPTION VALUE="B">펌</OPTION>
											<OPTION VALUE="C">염색</OPTION>
											<OPTION VALUE="D">스타일링</OPTION>
											<OPTION VALUE="E">메이크업</OPTION>
										</SELECT>
									</td>
								</tr>
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">중분류</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
										<SELECT NAME="cat2cd">
										</SELECT>
									</td>
								</tr>
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">지점명</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE = "text" SIZE = "30" MAXLENGTH = "50" NAME = "goodsnm"></td>
								</tr>
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">판매단가</td>
			 						<td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE = "text" SIZE = "10" MAXLENGTH = "7" NAME = "unitprice" onKeyDown = "KeyNumber()"></td>
								</tr>
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">베스트스타일여부</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE = "checkbox" NAME = "best_yn"></td>
								</tr>
								<tr>
									<td width="24%" align="left" bgcolor="#EEEEEE">이미지</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE = "file" NAME = "goodsimg1" size = 50></td>
								</tr>
								<tr>
									<td colspan=2 align=center  bgcolor="#FFFFFF"><INPUT TYPE = "button" VALUE = "등록" onclick="valid_check()"></td>
								</tr>
						</FORM >
          <tr>
        </td>
      </tr>
		</table>
    </td>
  </tr>
</table>
</BODY>
</HTML>