<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String msg = "";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id!=null && id.equals("aaa")){
			//유효한 ID를 입력한 경우
			if(pw!=null && pw.equals("111")){
				// 로그인 처리(세션에 속성 추가)
				session.setAttribute("id", id);
				session.setAttribute("name", "홍길동");
				response.sendRedirect("main.jsp");
			}else{
				//pw를 틀린경우
				msg = URLEncoder.encode("pw를 체크하세요", "utf-8");
				response.sendRedirect("login.jsp?msg="+msg);
			}
		}else{
			//유효하지 않는 ID를 입력한 경우
			msg = URLEncoder.encode("id를 체크하세요", "utf-8"); //한글처리
			response.sendRedirect("login.jsp?msg="+msg);
		}
	%>
	<br><br><br><br><br><br>
	<div id="loginForm_wrap">
		<div id="login_title">로그인 결과</div>
		<div id="login_join">로그인 성공</div>
	</div>
	<br><br><br><br><br><br>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>















