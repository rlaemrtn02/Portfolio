<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.text.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<HTML>
<HEAD>
  <TITLE>MORESS</TITLE>

<link href="/chap11/includes/all.css" rel="stylesheet" type="text/css" />

</HEAD>
<body>
<%

String userid			=	(String)session.getAttribute("G_ID");
String addr				= request.getParameter("addr");
String telno			= request.getParameter("tel");
String usernm2		= request.getParameter("usernm2");
String addr2			= request.getParameter("addr2");
String telno2			= request.getParameter("tel2");
String goodscd		= "";
String goodsnm		= "";
String colornm		= "";
String sizenm			= "";
String colorcd		= "";
String sizecd			= "";
String goodsimg1	= "";
String usernm			= "";

int unitPrice			= 0;
int qty						= 0;
int amt						= 0;
int totAmt				= 0;

DecimalFormat df1	= new DecimalFormat("00"); 
DecimalFormat df2	= new DecimalFormat("###,###,##0"); 

String newOrdNo		= "";

Statement stmt		= con.createStatement();
Statement stmt2		= con.createStatement();
Statement stmt3		= con.createStatement();
ResultSet rs			= null, rs2 = null;

try{		

	String strSQL = "select sum(unitprice * qty) tot from cart ";
	strSQL	= strSQL + " where userid = '" + userid + "' and chkYN = 'Y'";

	rs			= stmt.executeQuery(strSQL);

	

%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
		<table width="815" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <%@ include file="/chap11/includes/top.inc" %>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="547" height="45" align="left" class="new_tit">주문 완료</td>
            <td width="253" align="right">HOME &lt; 주문 완료</td>
            </tr>
          <tr>
            <td colspan="2" align="left" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
              <tr>
                <td width="10%" align="center" bgcolor="#EEEEEE">상품이미지</td>
                <td width="20%" align="center" bgcolor="#EEEEEE">상품코드</td>
                <td width="20%" align="center" bgcolor="#EEEEEE">상품명</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">상품색상</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">상품크기</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">단가</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">수량</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">금액</td>
              </tr>
							
<%

strSQL = "select a.*, b.*, c.goodsnm, c.goodsimg1, d.colornm, e.sizenm, f.usernm from order_H a ";
strSQL = strSQL + " inner join order_D		b on a.ordNo		= b.ordNo ";
strSQL = strSQL + " inner join goodsinfo	c on b.goodscd	= c.goodscd ";
strSQL = strSQL + " inner join colorinfo	d on b.color		= d.colorcd ";
strSQL = strSQL + " inner join sizeinfo		e on b.size			= e.sizecd ";
strSQL = strSQL + " inner join members		f on a.userid		= f.userid ";
strSQL = strSQL + " where a.userid = '" + userid + "'";
strSQL = strSQL + " order by ordSeq";

rs = stmt.executeQuery(strSQL);

if(rs.next())
{
  while(rs.next()){

	goodscd			= rs.getString("goodscd");
	goodsnm			= rs.getString("goodsnm");
	colornm			= rs.getString("colornm");
	sizenm			= rs.getString("sizenm");
	unitPrice		= rs.getInt("unitprice");
	qty					= rs.getInt("ordQty");
	amt					= rs.getInt("ordAmt");
	goodsimg1		= rs.getString("goodsimg1");
	totAmt			= totAmt + amt;

	usernm			= rs.getString("usernm");
	addr				=	rs.getString("addr");
	telno				= rs.getString("telno");
	usernm2			= rs.getString("deliUserName");
	addr2				=	rs.getString("deliAddr");
	telno2			=	rs.getString("deliTelno");

%>
              <tr>

                <td align="center" bgcolor="#FFFFFF"><img src="/chap11/images/<%= goodsimg1 %>" width="40" height="40" /></td>
                <td align="center" bgcolor="#FFFFFF"><%= goodscd					%></td>
                <td align="center" bgcolor="#FFFFFF"><%= goodsnm					%></td>
                <td align="center" bgcolor="#FFFFFF"><%= colornm					%></td>
                <td align="center" bgcolor="#FFFFFF"><%= sizenm						%></td>
                <td align="center" bgcolor="#FFFFFF"><%= df2.format(unitPrice)%></td>
                <td align="center" bgcolor="#FFFFFF"><%= qty							%></td>
                <td align="center" bgcolor="#FFFFFF"><%= df2.format(amt)	%></td>
              </tr>

<%
}
%>
            </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center">합계 <SPAN id = "totAmtView"><%= df2.format(totAmt) %></SPAN>0원</td>
      </tr>

<FORM NAME = frm1 ACTION = "index.jsp" METHOD = POST>
      <tr>
        <td align="center"><table width="800" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
          <tr>
            <td colspan="2" align="left" bgcolor="#EEEEEE">주문자 정보</td>
            </tr>
          <tr>
            <td width="24%" align="left" bgcolor="#FFFFFF">주문자 성명</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= usernm %></td>
            </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF">주문자 주소</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= addr %></td>
          </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF">주문자 전화</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= telno %></td>
          </tr>
          <tr>
            <td colspan="2" align="left" bgcolor="#EEEEEE">받는자 정보</td>
            </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF">받는자 성명</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= usernm2 %></td>
          </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF">받는자 주소</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= addr2 %></td>
          </tr>
          <tr>
            <td align="left" bgcolor="#FFFFFF">받는자 전화</td>
            <td width="76%" align="left" bgcolor="#FFFFFF"><%= telno2 %></td>
          </tr>
        </table></td>
      </tr>

      <tr>
        <td height="50" align="center">
          <input type="submit" id="button2" value="메인으로 이동"/>
        </td>
      </tr>
<%@ include file="includes/bottom.inc" %>
      <tr>
      </tr>
    </table></td>
  </tr>
</table>
<%
}else{
%>
  <tr><center><주문한 상품이 없습니다.></center></tr>
</table></td>
</tr>
</table></td>
</tr>
</table></td>
</tr>
</table>
<%
}
%>

</body>
</html>
<%
} //try end

catch(SQLException e1){
	e1.printStackTrace();
} // catch SQLException end

catch(Exception e2){
	e2.printStackTrace();
} // catch Exception end

finally{
if (stmt  != null) stmt.close();
if (stmt2 != null) stmt2.close();
if (rs    != null) rs.close();
if (rs2   != null) rs2.close();
if (con   != null) con.close();
}
%>