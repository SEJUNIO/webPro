<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="join.css" rel="stylesheet">
</head>
<body>
	
	<% 
		String name     = request.getParameter("name");  
		String id       = request.getParameter("id");
		String pw       = request.getParameter("pw");
		String birth    = request.getParameter("birth");
		String hobby    = request.getParameter("hobby");
		String gender   = request.getParameter("gender");
		String email = request.getParameter("email");
		String mailSend = request.getParameter("mailsend");
	%>
	<div id="joinForm_wrap">
	<div id="join_title">회원 가입 정보</div>
	<h2>이름 : <%=name %></h2><br>
	<h2>아이디 : <%=id %></h2><br>
	<h2>비밀번호 : <%=pw %></h2><br>
	<h2>생년월일 : <%=birth %></h2><br>
	<h2>취미 : <%=hobby %></h2><br>
	<h2>성별 : <%=gender %></h2><br>
	<h2>이메일 : <%=email %></h2><br>
	<h2>메일확인 : <%=mailSend %></h2><br> 
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>