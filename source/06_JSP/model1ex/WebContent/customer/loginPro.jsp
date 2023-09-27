<%@page import="java.net.URLEncoder"%>
<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="com.lec.customer.CustomerDao"%>
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
		request.setCharacterEncoding("utf-8");
		String msg = "";
		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");
		String method = request.getParameter("method");
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.loginCheck(cid, cpw);
		if(result == CustomerDao.LOGIN_SUCCESS){
			CustomerDto customer = cDao.getCustomer(cid);
			session.setAttribute("customer", customer);
			if(method.equals("null")){
				response.sendRedirect(conPath + "/main/main.jsp");
			}else{
				response.sendRedirect(conPath + "/" + method + ".jsp");
			}
		}else if(result == CustomerDao.LOGIN_FAIL){			
			response.sendRedirect("loginForm.jsp?msg="+msg);
	%>
		<script>
		alert("비밀번호를 확인하세요");
		history.back();
		</script>
	<%}else if(result == CustomerDao.LOGIN_FAIL){ %>
		<script>
		alert("회원가입이 실패되었습니다.다시시도하세요");
		location.href='loginForm.jsp';
		</script>
	<%}%>
</body>
</html>