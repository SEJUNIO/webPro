<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
			#wrap{
	width:430px;
	border: 1px solid #D4A190;
	margin : 10px auto;
	}
	table{
	width:70%;
	margin : auto;
	}
	td{
	text-align : center;
	padding : 2px 5px;
	margin : auto;
	}
	#msg {color:red; text-align: center;}
	</style>
</head>
<body>
	<%! String msg; %>
	<%
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String msg = request.getParameter("msg");
		if(msg !=null){
			msg = Integer.equls(name);
		msg = "<h2>아이디는"+ name + "<br>";
				
		response.sendRedirect("login.jsp?msg="+msg);
	%>
	<div id="msg">
		<h2>Check the ID and PW<%=msg%></h2>

		<button onclick="location.href='login.jsp'">뒤로가기</button>
	</div>
</body>
</html>