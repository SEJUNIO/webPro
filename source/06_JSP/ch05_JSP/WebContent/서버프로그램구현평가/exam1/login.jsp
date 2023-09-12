<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	#wrap{
	width:430px;
	border: 1px solid #D4A190;
	margin : 10px auto;
	}
	table{
	width:70%;
	margin : auto;
	}
	td{
	text-align : center;
	padding : 2px 5px;
	margin : auto;
	}
	</style>
</head>
<body>
 <div id="wrap">
 <form action="loginPro.jsp">
 	<table>
 		<tr>
 		<td>아이디</td>
 		<td><input type="text" name="name"></td>
 		</tr>
 		
 		<tr>
 		<td>패스워드</td>
 		<td><input type="password" name="pw"></td>
 		</tr>
 		
 		<tr>
 		<td>
 		</td>
 		</tr>
 		
 		<tr>
 		<td colspan="3">
 		<input type="submit" value="로그인">
 		</td>
 		</tr>
 	</table>
</form>
 </div>
</body>
</html>