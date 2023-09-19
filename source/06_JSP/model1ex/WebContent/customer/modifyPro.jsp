<%@page import="com.lec.customer.CustomerDao"%>
<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.sql.Date"%>
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
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.lec.customer.CustomerDto"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		String tempCbirth = request.getParameter("tempCbirth");
	if(!tempCbirth.equals("")){
		dto.setCbirth(Date.valueOf(tempCbirth));
	}
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	String sessioncpw = null;
	if(customer!=null){
		sessioncpw = customer.getCpw();
	}
	String oldCpw = request.getParameter("oldCpw");
	if(sessioncpw.equals(oldCpw)){
		if(dto.getCpw() == null){
			dto.setCpw(oldCpw);
		}
	CustomerDao cDao = CustomerDao.getInstance();
	int result = cDao.modifyCustomer(dto);
	if(result == CustomerDao.SUCCESS){
		session.setAttribute("customer", dto);
	%>
		<script>
			alert('정보수정 완료!');
			location.href = '../main/main.jsp';
		</script>
	<%}else{%>
		<script>
			alert('정보수정 실패!. 정보가 너무 깁니다.');
			location.href = 'modifyForm.jsp';
		</script>
		<%}%>
	<%}else{%>
		<script>
			alert('현 비밀번호가 바르지 않습니다. 확인하세요.');
			history.back();
		</script>
	<%}%>
</body>
</html>