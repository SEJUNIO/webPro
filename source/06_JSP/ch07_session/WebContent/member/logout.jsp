<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/main.css" rel="stylesheet" type="text/css">
	<script>
	let id = setTimeout(function(){
      alert('로그아웃 성공!!!');
      location.href="<%=conPath%>/member/main.jsp";
    }, 3000);
    var cnt = 0;
	</script>
</head>
<body>
	<%
		String name = (String)session.getAttribute("name");
		if(name != null){ //로그인 상태
			//session.removeAttribute("name");
			//session.getAttribute("id");
			session.invalidate();
		}else{ //비로그인 상태
			
		}
	%>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainForm_wrap">
		로그아웃중...
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>