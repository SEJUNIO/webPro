<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="join.css">
</head>
<body>
 <div id="joinForm_wrap">
 	<div id="join_title">회원가입</div>
<form action="joinPro.jsp" method="post">
	<table>
		<tr>
		<td>이름</td>
		<td><input type="text" name="name" class="name" required="required"></td>
		</tr>
		
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" class="id" required="required"/></td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" class="pw" required="required"/></td>
	</tr>
	
	<tr>
		<td>비밀번호확인</td>
		<td><input type="password" name="pwChk" class="pwChk" required="required"/></td>
	</tr>
	
	<tr>
		<td>생년월일</td>
		<td><input type="date" name="birth" class="birth"></td>
	</tr>
	
	<tr>
		<td>취미</td>
			<td colspan="4">
			<input type="checkbox" name="hobby">독서
			<input type="checkbox" name="hobby">요리
			<input type="checkbox" name="hobby" checked="checked">운동
			<input type="checkbox" name="hobby">취침
			</td>
	</tr>
	
	<tr>
		<td>성별</td>
			<td colspan="2">
			<input type="radio" name="gender" checked="checked" id="m">남자
			<input type="radio" name="gender" id="f">여자
			</td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" class="email"></td>
	</tr>
	
	<tr>
		<td>메일수신</td>
		<td>
		<select multiple="multiple" name="mailSend" class="mailSend">
			<option>광고</option>
			<option>배송</option>
			<option selected="selected">공지</option>
			<option>배너</option>
		</select>
		</td>	
	</tr>
	<tr>
	
	</tr>
	<tr>
		<td colspan="3">
		<input type="submit" value="가입하기" class="joinBtn_style">
		<input type="button" value="다시하기" class="joinBtn_style">
		<input type="button" value="뒤로가기" class="joinBtn_style" onclick="history.back();">
		</td>
	</tr>
	</table>
	
</form>
 </div>
 <%@ include file="footer.jsp" %>
</body>
</html>