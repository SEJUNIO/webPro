<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
	String agree = request.getParameter("agree"); // "y", "n" null 3개중 하나 들어옴
	if("y".equals(agree)){
		//약관에 동의한 경우 : 세션 속성값(id, pw, name) 받아 파일저장. 세션 속성값(pw, name)삭제 -> result.jsp?msg=sucess)
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String name = (String)session.getAttribute("name");
		//파일에 저장(소프폴더의 webContent/WEB-INF/id.txt)
		String filePath = "D:/webpro/source/06_JSP/ch07_session/WebContent/WEB-INF/"+id+".txt";
		PrintWriter writer = new PrintWriter(filePath);
		writer.write("오늘은 DB에 insert하는 대신 파일 출력\n");
		writer.println("id : " + id);
		writer.println("pw : " + pw);
		writer.println("name : " + name);
		writer.close(); // ★close생략시 저장 안됨.
		session.removeAttribute("pw");
		session.removeAttribute("name");
		//세션에 id속성은 유지(로그인 페이지 사용 예정)
		response.sendRedirect("result.jsp?msg=success");
	}else{
		//약관에 동의하지 않았거나 이 파일부터 실행한 경우 : 세션날림 -> 다음페이지로(result.jsp?msg=fail)
		session.invalidate();
		response.sendRedirect("result.jsp?msg=fail");
	}
	%>
</body>
</html>