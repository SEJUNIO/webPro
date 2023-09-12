<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body { background-color: lightyellow;}
		td{text-align: center; padding:2px 5px;}
		#msg {color:red; text-align: center;}
	</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id==null || !id.equals("aaa") || pw==null || !pw.equals("111")){
			//String msg = "Check the ID and PW";
			String msg = "<b>아이디와 비밀번호를<br> 확인하세요<b>";
			msg = URLEncoder.encode(msg, "utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}/* else{
			out.println("<h2>ID는 "+id +"이고<br> 비밀번호는 " + pw +"입니다<br><br>");
			out.println("반갑습니다</h2>");
		} */
	%>
	<h2>
		ID는 <%=id %>이고<br> 비밀번호는 <%=pw %>입니다<br><br>
		반갑습니다.
	</h2>
</body>
</html>