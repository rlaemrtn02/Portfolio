<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/chap10/include/dbinfo.inc" %>
<%@ page import="java.io.File, java.io.IOException, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%

		String realFolder = "";
		String saveFolder = "/chap11/member/up/";
		String encType = "utf-8";

		int sizeLimit = 10 * 1024 * 1024;
		realFolder = application.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request,realFolder,sizeLimit,encType);

		Statement stmt = con.createStatement();
		
		String suserid	= multi.getParameter("userid");
		String susernm	= multi.getParameter("usernm");
		String spasswd	= multi.getParameter("passwd");
		// 주민번호 앞 6자와 뒷 7자를 각각  입력받아 합침
		String sjumin	= multi.getParameter("jumin1") + multi.getParameter("jumin2");
		String saddr	= multi.getParameter("addr1") +multi.getParameter("addr2");
		String stel	= multi.getParameter("tel0") + multi.getParameter("tel1") + multi.getParameter("tel2");
		
		String smailrcv	= multi.getParameter("mailrcv");
		if (smailrcv != null && smailrcv.equals("on"))
			smailrcv = "Y";			// 수신을 동의함(체크함)
		else
			smailrcv = "N";			// 수신을 체크하지 않음

		String sgender	= multi.getParameter("gender");
		String sjob		= multi.getParameter("job");
		String sintro	= multi.getParameter("intro").replace("\r\n", "<br>"); // CR, LF를 <br> 태그로 변환
		String simage = multi.getFilesystemName("image");

// 단계5 : ID 중복 체크를 위하여 입력한 ID로 members를 select
		String SQL = "select count(*) cnt from members where userid = '" + suserid + "'";
		ResultSet rs = stmt.executeQuery(SQL);
		rs.next() ;

		if (rs != null) {						
			if (rs.getInt("cnt") > 0) {		// 입력한 ID로 members를 select한 결과가 있다면
				out.println("이 아이디는 이미 다른 사람이 사용하고 있으므로 사용할 수 없습니다.");
			}
			else
			{									// 입력한 ID로 members를 select한 결과가 없다면
				SQL		= "insert into members(userid, usernm, image, passwd, jumin, mailrcv, gender, jobcd, intro, addr, tel) values (";
				SQL		= SQL + "'" + suserid  + "', ";
				SQL		= SQL + "'" + susernm  + "', ";
				SQL		= SQL + "'" + simage  + "', ";
				SQL		= SQL + "'" + spasswd  + "', ";
				SQL		= SQL + "'" + sjumin   + "', ";
				SQL		= SQL + "'" + smailrcv + "', ";
				SQL		= SQL + "'" + sgender  + "', ";
				SQL		= SQL + "'" + sjob     + "', ";
				SQL		= SQL + "'" + sintro   + "', ";
				SQL 	= SQL + "'" + saddr    + "', ";
				SQL 	= SQL + "'" + stel    + "') ";

				stmt.executeUpdate(SQL);

	// 단계7 :객체 종료
				stmt.close();
				con.close();
				
				out.println("<script> alert('가입이 완료되었습니다.');</script>");
			  out.println("<script>location.href='/chap11/index.jsp';</script>");
				
			}
			
		}
		
%>
