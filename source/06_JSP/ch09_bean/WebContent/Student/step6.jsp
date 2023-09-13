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
	<jsp:useBean id="p" class="com.lec.quiz.Student" scope="page"/>
	<jsp:setProperty property="studentNum" name="p"/>
	<jsp:setProperty property="name" name="p"/>
	<jsp:setProperty property="grade" name="p"/>
	<jsp:setProperty property="className" name="p"/>
	<jsp:setProperty property="score" name="p"/>
	<h2>입력받은 Student정보</h2>
	<p>학번<jsp:getProperty property="studentNum" name="p"/></p>
	<p>이름<jsp:getProperty property="name" name="p"/></p>
	<p>학년<jsp:getProperty property="grade" name="p"/></p>
	<p>반<jsp:getProperty property="className" name="p"/></p>
	<p>점수<jsp:getProperty property="score" name="p"/></p>
</body>
</html>