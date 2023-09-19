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
	<h1>테스트 페이지</h1>
	<% 
	CustomerDao cDao = CustomerDao.getInstance();
	String cid = "bbb";
	int result = cDao.confirmId(cid);
	if(result == CustomerDao.CUSTOMER_EXISTENT){
		out.print("<h3>1. confirmID 결과 :"+ cid + "는 중복된 아이디로 회원가입 불가합니다.</h3>");
	}else{
		out.print("<h3>1. confirmID 결과 :"+ cid + "는 가능한 아이디입니다</h3>");
		CustomerDto dto = new CustomerDto(cid, "111", "박", null, "a@hong.com", "서울", null, null, null );
		result = cDao.joinCustomer(dto);
		if(result == CustomerDao.SUCCESS){
			out.print("<h3>2. join결과 :" + cid + "로 회원가입 성공</h3>");
		}else{
			out.print("<h3>2. join결과 : 회원가입 실패</h3>");
		}
	}
	
	out.print("<h3>3. loginCheck 결과</h3>");
	cid = "aaa"; String cpw = "1111";
	result = cDao.loginCheck(cid, cpw);
	if(result == CustomerDao.LOGIN_SUCCESS){
		out.print("cid는" + cid + ", cpw는" + cpw + "로그인성공</br>" );
	}else if(result == CustomerDao.LOGIN_FAIL){
		out.print("cid는" + cid + ", cpw는" + cpw + "로그인 실패<br>");
	}
	
	cid = "xx"; cpw = "111";
	result = cDao.loginCheck(cid, cpw);
	if(result == CustomerDao.LOGIN_SUCCESS){
		out.print("id는 " + cid +", pw는 " + cpw + " : 로그인 성공<br>");
	}else if(result == CustomerDao.LOGIN_FAIL){
		out.print("id는 " + cid +", pw는 " + cpw + " : 로그인 실패<br>");
	}
	
	out.print("<h3>4. cid로 dto가져오기</h3>");
	CustomerDto dto = cDao.getCustomer("aaa");
	out.print("cid=aaa인 dto :" + dto + "<br>");
	out.print("id=zzz인 customer :" + dto + "<br>");
	
	out.print("<h3>5. 정보수정</h3>");
	dto.setCname("남궁세준");
	dto.setCaddress("엘가시아");
	result = cDao.modifyCustomer(dto);
	if(result == CustomerDao.SUCCESS){
		out.println("수정완료<br>");
		out.println("db의 수정된 데이터 :" + cDao.getCustomer(dto.getCid()) +"<br>");
	}else{
		out.print(dto.getCid() + "수정 실패");
	}
	%>
</body>
</html>