<%@page import="com.lec.ex.Member"%>
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
	<%
		Member member = new Member("aaa", "111", "홍길동");
		//세션에 테이터를 저장 == 세션에 속성을 추가
		session.setAttribute("sessionName", "session Value");
		session.setAttribute("sessionNum", 111);
		session.setAttribute("member", member);
		//jsp에서는 session이 내부객체라서 바로 사용 가능하다. 자바(서블릿)에서는 session을 사용하려면
		HttpSession session2 = request.getSession();
	%>
	<h2>session의 sessionName 속성값 : <%=session.getAttribute("sessionName") %></h2>
	<h2>session의 sessionNum 속성값 : <%=session.getAttribute("sessionNum") %></h2>
	<h2>session의 member 속성값 : <%=session.getAttribute("member") %></h2>
	<hr>
	<h2>세션 ID : <%=session.getId() %></h2>
	<h2>세션 유효시간 : <%=session.getMaxInactiveInterval() %></h2>
	<hr>
	<a href="ex1_sessionAddAttr.jsp">1. 세션 데이터 추가</a><br>
	<a href="ex2_sessionGet.jsp">2. 특정 세션 get</a><br>
	<a href="ex3_sessionList.jsp">3. 세션의 모든 데이터 리스트</a><br>
	<a href="ex4_sessionRemove.jsp">4. 세션 삭제(특정 세션 데이터나 모든 세선 데이터)</a>
	
	

</body>
</html>