<%@page import="com.lec.dao.EmpDao"%>
<%@page import="com.lec.dto.EmpDto"%>
<%@page import="java.util.ArrayList"%>
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
	<table>
	<%
		String deptnoStr = request.getParameter("deptno"); //파라미터 받기
		if(deptnoStr == null){            //받은게 널이면 0으로 변환
			deptnoStr = "0";
		}
		int deptnoInput = Integer.parseInt(deptnoStr); //받은걸 숫자로 변환
		EmpDao eDao = EmpDao.getInstance();
		ArrayList<EmpDto> empList = eDao.deptnoEmpList(deptnoInput);
		//empList 출력하기
		if(empList.size()!=0){
			for(int idx=0; idx<empList.size(); idx++){
				out.print("<tr><td>" + empList.get(idx).getEmpno() + "</td>"
										+	"<td>" + empList.get(idx).getEname() + "</td>"
										+	"<td>" + empList.get(idx).getJob() + "</td>"
										+	"<td>" + empList.get(idx).getDeptno() + "</td>");
				
			}
			out.print("<tr><td colspan='4'>이상 총" + empList.size() + "명</td></tr>");
		}else{
			out.print("<tr><td colspan='4'>해당 부서번호의 사원이 없습니다</td></tr>");
		}
	%>
	</table>
</body>
</html>