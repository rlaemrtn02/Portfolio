<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!docutype html>
<script language=javascript>
	function valid_check(){
		if(document.frm1.userid.value == ""){
			alert("아이디를 입력해 주세요.");
			document.frm1.userid.focus();
			return false;
		}
		if(document.frm1.usernm.value == ""){
			alert("이름을 입력해 주세요.");
			document.frm1.usernm.focus();
			return false;
		}
		if(document.frm1.passwd1.value == ""){
			alert("비밀번호를 입력해 주세요.");
			document.frm1.passwd1.focus();
			return false;
		}
		if(document.frm1.passwd1.value != document.frm1.passwd2.value){
			alert("비밀번호를 확인해 주세요.");
			document.frm1.passwd1.focus();
			return false;
		}
		if(document.frm1.jumin1.value.length != 6){
			alert("주민번호 앞자리는 6자입니다.");
			document.frm1.jumin1.focus();
			return false;
		}
		if(document.frm1.jumin2.value.length != 7){
			alert("주민번호 뒷자리는 7자입니다.");
			document.frm1.jumin2.focus();
			return false;
		}
		for(var i=0;i<document.frm1.jumin1.value.length;i++){
			if(document.frm1.jumin1.value.charAt(i)<"0" || document.frm1.jumin1.value.charAt(i)>"9"){
				alert("주민번호는 숫자만 가능합니다.");
				document.frm1.jumin1.focus();
				return false;
			}
		}
		for(var i=0;i<document.frm1.jumin2.value.length;i++){
			if(document.frm1.jumin2.value.charAt(i)<"0" || document.frm1.jumin2.value.charAt(i)>"9"){
				alert("주민번호는 숫자만 가능합니다.");
				document.frm1.jumin2.focus();
				return false;
			}
		}
		
		document.frm1.submit();
	}
	
	function KeyNumber(){
		var enent_key = event.keyCode;
		
		if((enent_key<48 || enent_key>57) && (enent_key!=8 && enent_key!=46)){
			event.returnValue=false;
		}
	}
	
	function cursor_move(a){
		if(a==1){
			var str = document.frm1.jumin1.value.length;
			if(str==6){
				document.frm1.jumin2.focus();
			}
		}else if(a==2){
			var str = document.frm1.jumin2.value.length;
			if(str==7){
				document.frm1.mailrcv.focus();
			}
		}		
	}
	
	function valid_check2(){
		if(document.frm1.passwd1.value == ""){
			alert("비밀번호를 입력해 주세요.");
			document.frm1.passwd1.focus();
			return false;
		}
		if(document.frm1.passwd1.value != document.frm1.passwd2.value){
			alert("비밀번호를 확인해 주세요.");
			document.frm1.passwd1.focus();
			return false;
		}
		
	  document.frm2.submit();
	}
</script>
<%
	String in_userid = (String)session.getAttribute("G_ID");
    
    if(in_userid == null)
        out.print("로그인 후에 회원정보를 변경 바랍니다.");
    else
    {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=KJH_BOOK;user=kjh;password=00";
	Connection con = java.sql.DriverManager.getConnection(connectionURL);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String SQL = "select * from members where userid = ?";
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1,in_userid);
	rs = pstmt.executeQuery();
    
    rs.next();

        String usernm = rs.getString("usernm");
		String image = rs.getString("image");
		String jumin = rs.getString("jumin");
		String jumin1 = "";
		String jumin2 = "";
		if(jumin != null){
			jumin1 = jumin.substring(0,6);
			jumin2 = jumin.substring(6);
		}
		String mailrcv = rs.getString("mailrcv");
		if(mailrcv == null) mailrcv="N";
		String gender = rs.getString("gender");
		if(gender == null) gender="";
		String job = rs.getString("jobcd");
		if(job == null) job="";
        String intro = rs.getString("intro");
        if(intro != null) intro = intro.replace("<br>", "\r\n");
		
		
	
%> 
<html>
	<haed>
		<title>Dressing</title>
	</head>
		
	<body>
	<h3><%=usernm%>님  정보 변경<h3>
		<form name="frm1" action="mem_upd1_4_ok.jsp" method="post" enctype = "multipart/form-data">
			<table width="500" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%" align="left">아이디</td>
				<td width="60%" align="left"><input type="text" name="userid" value="<%=in_userid%>" Readonly size=15 maxlength=10></td>
			</tr>
			<tr>
				<td width="40%" align="left">이름</td>
				<td width="60%" align="left"><input type="text" name="usernm" value="<%=usernm%>" size=10 maxlength=10></td>
			</tr>
			<tr>
				<td width="40%" align="left">프로필 사진</td>
				<td width="60%" align="left"><INPUT TYPE = "file" NAME = "image" size = 50></td>
			</tr>
			<tr>
				<td width="40%" align="left">비밀번호</td>
				<td width="60%" align="left"><input type="password" name="passwd1" size=10 maxlength=10></td>
			</tr>
			<tr>
				<td width="40%" align="left">비밀번호 확인</td>
				<td width="60%" align="left"><input type="password" name="passwd2" size=10 maxlength=10></td>
			</tr>
			<tr>
				<td width="40%" align="left">주민번호</td>
				<td width="60%" align="left"><input type="text" name="jumin1" value="<%=jumin1%>" size=6 maxlength=6 onKeyDown="KeyNumber()" onKeyUp="cursor_move(1)"> - 
											<input type="text" name="jumin2" value="<%=jumin2%>" size=7 maxlength=7 maxlength=6 onKeyDown="KeyNumber()" onKeyUp="cursor_move(2)"></td>
			</tr>
			<tr>
				<td width="40%" align="left">메일수신여부</td>
				<td width="60%" align="left"><input type="checkbox" name="mailrcv" <% if(mailrcv.equals("Y")) out.print("checked"); %> size=15 maxlength=10></td>
			</tr>
			<tr>
				<td width="40%" align="left">성별</td>
				<td width="60%" align="left">남<input type="radio" name="gender" value="1" <% if(gender.equals("1")) out.print("checked"); %> >
				  여<input type="radio" name="gender" value="2" <% if(gender.equals("2")) out.print("checked"); %> ></td>
			</tr>
			<tr>
				<td width="40%" align="left">직업</td>
				<td width="60%" align="left">
				<select name="job" size=5 multiple>
					<option value="">===직업을 선택하세요===</option>
					<option value="1" <% if(job.equals("1")) out.print("selected"); %>>학생 </option>
					<option value="2" <% if(job.equals("2")) out.print("selected"); %>>회사원</option>
					<option value="3" <% if(job.equals("3")) out.print("selected"); %>>군인</option>
					<option value="9" <% if(job.equals("9")) out.print("selected"); %>>기타</option>
				</select></td>
			</tr>
			<tr>
				<td width="40%" align="left">자기소개</td>
				<td width="60%" align="left"><textarea name="intro" rows=5 cols=50><%=intro%></textarea></td>
			</tr>
			<tr>
				<td width="60%" align="center" colspan="2"><input type="button" value="변경" onClick="valid_check()">
				</form>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		 <form name="frm2" action="mem_del.jsp" method="post" >
				  <input type="button" value="탈퇴" onClick="valid_check2()">
		 </form>
	</body>
	<% } %>
</html>	