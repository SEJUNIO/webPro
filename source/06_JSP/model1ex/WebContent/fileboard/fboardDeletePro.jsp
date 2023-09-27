<%@page import="com.lec.fileboard.FileBoardDao"%>
<%@page import="com.lec.fileboard.FileBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		int fid = Integer.parseInt(request.getParameter("fid"));
		String fpw = request.getParameter("fpw");
		FileBoardDao fbDao = FileBoardDao.getInstance();
		int result = fbDao.deleteFileBoard(fid, fpw);
		if(result==FileBoardDao.SUCCESS){
	%>
			<script>
				alert('<%=fid%>번 글 삭제성공');
				location.href = 'fboardList.jsp?pageNum=<%=pageNum%>';
			</script>		
	<%}else{%>
			<script>
				alert('<%=fid%>번 글 삭제실패. 비밀번호 확인하세요');
				history.go(-1);
			</script>	
	<%}%>
</body>
</html>