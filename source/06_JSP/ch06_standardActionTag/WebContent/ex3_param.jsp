<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
 <%-- 요청url : ex3_param.jsp?n=1 --%>
 <h1>ex3_param.jsp페이지입니다.</h1>
 <jsp:forward page="ex4.jsp">
 		<jsp:param value="id" name="aaa"/>
 		<jsp:param value="111" name="pw"/>
 </jsp:forward>
</body>
</html>