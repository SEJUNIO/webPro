<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% //세션에 추가한 모든 데이터 list
	Enumeration<String> sAttrNames= session.getAttributeNames();
	int cnt = 0;
	while(sAttrNames.hasMoreElements()){
		cnt++;
		String sname = sAttrNames.nextElement();
		String svalue = session.getAttribute(sname).toString();
		out.println("<h2>" + cnt + "." + sname + "(세션속성이름):" + svalue + "(세션값)</h2>");
	}//while
		if(cnt==0){
			out.println("<h2>세션 속성이 없습니다</h2>");
		}
	%>
	<jsp:include page="../member/header.jsp"/>
		<div id="mainForm_wrap">

		</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>