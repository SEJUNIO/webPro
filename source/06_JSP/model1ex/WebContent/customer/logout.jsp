<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet" type="text/css">
	<style>
	#mainForm_wrap{
			width:1000px; margin: 10px auto; height: 600px; 
			border: 1px solid #005500;
			line-height: 600px;
			text-align: center;
			font-size: 3em; color: #005500;
			font-weight: bold;
		}
	</style>
	
	<script>
		setTimeout(() => {
			alert('로그아웃 성공!!!');
			location.href='../main/main.jsp';
		}, 2000);
	</script>
</head>
<body>
	<%
		if(session.getAttribute("customer")!=null){
			session.invalidate();
		}else{
			//out.print("<h2>로그인 상태가 아닙니다. 잠시후 메인 페이지로 이동합니다.</h2>");
		}
	%>
	<jsp:include page="../main/header.jsp"/>
	<div id="mainForm_wrap">
			로그아웃중....!
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>