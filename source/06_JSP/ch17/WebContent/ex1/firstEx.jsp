<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1><a href="../insert.do">INSERT</a></h1>
	<h1><a href="http://localhost:8090/ch17/select.do">SELECT</a></h1>
	<h1><a href="/ch17/update.do">UPDATE</a></h1>
	<h1><a href="${conPath }/delete.do">DELETE</a></h1>
</body>
</html>