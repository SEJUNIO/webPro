<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:useBean id="p" class="com.lec.quiz.Student" scope="request"/>
	<jsp:setProperty  name="p" property="*"/>
	<jsp:forward page="studentResult.jsp"/>
</body>
</html>