<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>MORESS</TITLE>
 </HEAD>

<script language=javascript>
function valid_check()
{

	if (document.frm1.userid.value == "")
	{
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.frm1.userid.focus();
		return false;
	}

	if (document.frm1.userid.value.length < 4)
	{
		alert("아이디는 4자 이상입니다.");
		document.frm1.userid.focus();
		return false;
	}

	if (document.frm1.usernm.value == "")
	{
		alert("이름을 입력하여 주시기 바랍니다.");
		document.frm1.usernm.focus();
		return false;
	}

	if (document.frm1.passwd.value == "")
	{
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.frm1.passwd.focus();
		return false;
	}

	if (document.frm1.passwd.value != document.frm1.passwd2.value)
	{
		alert("비밀번호를 확인하여 주시기 바랍니다.");
		document.frm1.passwd.focus();
		return false;
	}

	if (document.frm1.jumin1.value.length != 6)
	{
		alert("주민번호 앞 자릿수는 6자입니다.");
		document.frm1.jumin1.focus();
		return false;
	}

	if (document.frm1.jumin2.value.length != 7)
	{
		alert("주민번호 뒷 자릿수는 7자입니다.");
		document.frm1.jumin2.focus();
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

function cursor_move(a)
{

	if ( a == 1 )
	{
		var str = document.frm1.jumin1.value.length;
		if (str == 6) 
			document.frm1.jumin2.focus();
	}	
	else if ( a == 2 )
	{
		var str = document.frm1.jumin2.value.length;
		if (str == 7) 
			document.frm1.mailrcv.focus();
	}

}

function check_id() 
{
		var JSPName = "id_check.jsp";
		browsing_window = window.open(JSPName, "_idcheck","height=220,width=520, menubar=no,directories=no,resizable=no,status=yes,scrollbars=no , toolbar=no");
		browsing_window.focus();
}
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }

</script>

<h3>회원 가입</h3>
<BODY>
<FORM NAME = "frm1" ACTION = "/chap11/member/mem_join_ok.jsp" METHOD = "post" enctype="multipart/form-data">
<TABLE WIDTH = "500" BORDER = "1" CellPadding = "0" CellSpacing = "0">
	<TR>
		<TD WIDTH = "40%" ALIGN = "left" >아이디</TD>
		<TD width = "80%" ALIGN = "left" >
			<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "userid" readonly>
			<INPUT TYPE=button VALUE="ID Check" onclick="check_id()"  onmouseover="this.style.cursor='hand';">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">이름</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "text" SIZE = "15" MAXLENGTH = "10" NAME = "usernm">
		</TD>
	</TR>
    <TR>
		<TD WIDTH = "40%" ALIGN = "left">프로필 사진</TD>
		<TD WIDTH = "60%" ALIGN = "left">
        	<input type="file" name="image"></td>
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">비밀번호</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">비밀번호확인</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE = "password" SIZE = "10" MAXLENGTH = "10" NAME = "passwd2">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">주민번호</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<INPUT TYPE ="text" NAME="jumin1" SIZE = "6" MAXLENGTH = "6" onKeyDown="KeyNumber()" onKeyup="cursor_move(1)">-
			<INPUT TYPE ="text" NAME="jumin2" SIZE = "7" MAXLENGTH = "7" onKeyDown="KeyNumber()" onKeyup="cursor_move(2)">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">메일수신여부</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			동의함 <INPUT TYPE ="checkbox" NAME="mailrcv">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">성별</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			남<INPUT TYPE ="radio" NAME="gender" VALUE="1">여<INPUT TYPE ="radio" NAME="gender" VALUE="2">
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">직업</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			 <SELECT NAME="job">
				<OPTION VALUE="">==직업을 선택하세요==</OPTION>
				<OPTION VALUE="1">학생</OPTION>
				<OPTION VALUE="2">회사원</OPTION>
				<OPTION VALUE="3">군인</OPTION>
				<OPTION VALUE="9">기타</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">자기소개</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<TEXTAREA NAME="intro" ROWS=5 COLS=50></TEXTAREA>
		</TD>
	</TR>
	
		<TR>
	<TD WIDTH = "40%" ALIGN = "left" >주소</TD>
	<TD width = "80%" ALIGN = "left" >
	<input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" NAME="addr1" id= "addr1" placeholder="주소">
	<input type="text" NAME="addr2" id= "addr2" placeholder="상세주소">

	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	</TD>
	
	</TR>
	<TR>
	<TD WIDTH = "40%" ALIGN = "left">핸드폰 번호</TD>
		<TD WIDTH = "60%" ALIGN = "left">
		    <select name="tel0" onKeyDown="KeyNumber()">
              <option value=''>선택</option>
              <option value='010'>010</option>
              <option value='011'>011</option>
              <option value='016'>016</option>
              <option value='017'>017</option>
              <option value='018'>018</option>
              <option value='019'>019</option>
             </select>-
			<INPUT TYPE ="text" NAME="tel1" SIZE = "4" MAXLENGTH = "4" onKeyDown="KeyNumber()" > -
			<INPUT TYPE ="text" NAME="tel2" SIZE = "4" MAXLENGTH = "4" onKeyDown="KeyNumber()" >
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "100%" ALIGN = "center" COLSPAN = "2">
			<INPUT TYPE = "button" VALUE = "가입" onclick="valid_check()">
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>