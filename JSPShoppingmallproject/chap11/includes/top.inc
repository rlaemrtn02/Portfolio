<%@ page contentType="text/html; charset=utf-8" language="java"  %>
      <tr>
        <td height="67"><table width="815" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="223" height="67" rowspan="2" align="center"><a href="index.jsp"><img src="/chap11/icons/logo.JPG" width=60% border="0" /></a></td>
            <td width="592" height="30" align="right">
	    
<%
		String id = (String)session.getAttribute("G_ID");
		String nm = (String)session.getAttribute("G_NM");

		if (id == null)	
		{
%>
		    <a href="/chap11/member/mem_join.jsp">회원가입</a>| <a href="login.jsp">로그인</a>
<%
		}
		else
		{
%>
			<a href="/chap11/mem_upd2_1.jsp">회원정보변경</a> | <%= nm %> 님 환영합니다. | <a href="logout.jsp">로그아웃</a>
<%			
		}
%>
	    
	    
	    | <a href="/chap11/goodsCart.jsp">장바구니</a> | <a href="/chap11/goodsOrderPageC.jsp">주문배송조회</a> | <a href="#">마이페이지</a> </td>
          </tr>
          <tr>
            <td>
            <ul class="ul">
             <li class="list">| <a href="goodsdisplay.jsp?pcat1=B" class="navi">BOTTOM</a></li>
             <li class="list">| <a href="goodsdisplay.jsp?pcat1=O" class="navi">OUTER</a></li>
             <li class="list">| <a href="goodsdisplay.jsp?pcat1=T" class="navi">TOP</a></li>
             <li class="list">| <a href="/chap11/admin/admin_login.jsp" class="navi">관리자페이지</a></li>
          </td>
          </tr>
        </table></td>
      </tr>