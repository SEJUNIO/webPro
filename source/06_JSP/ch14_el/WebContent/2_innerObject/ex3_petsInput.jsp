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
	<form action="ex4_petsResult.jsp">
	ID<input type="text" name="id"><br>
	키우는 애완동물을 선택하세요
	<input type="checkbox" name="pets" value="강아지">강아지
	<input type="checkbox" name="pets" value="고양이">고양이
	<input type="checkbox" name="pets" value="앵무새">앵무새
	<input type="checkbox" name="pets" value="열대어">열대어
	<input type="checkbox" name="pets" value="거북이">거북이
	</form>
</body>
</html>