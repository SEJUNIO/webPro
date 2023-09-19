<%@page import="com.lec.customer.CustomerDao"%>
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
	<jsp:useBean id="dto" class="com.lec.customer.CustomerDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		String tempCbirth = request.getParameter("tempCbirth");
		if(!tempCbirth.equals("")){
			dto.setCbirth(Date.valueOf(tempCbirth));
		}
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.confirmId(dto.getCid());
		if(result == CustomerDao.CUSTOMER_NONEXISTENT){
			result = cDao.joinCustomer(dto);
			if(result==CustomerDao.SUCCESS){
				session.setAttribute("cid", dto.getCid());
	%>
		<script>
			alert('<%=dto.getCname()%>님 회원가입 감사합니다');
			location.href = 'loginForm.jsp';
		</script>
	<%}else{%>
		<script>
			alert('회원가입이 실패되었습니다. 길이 제한이 있습니다.');
			history.back();
			location.href= 'joinForm.jsp';
		</script>
	<%}%>
	<%}else{ // 중복된 id라서 이전페이지로%>
		<script>
			alert('중복된 ID입니다. 다른 아이디를 부탁합니다');
			history.back();
		</script>
	<%}%>
</body>
</html>