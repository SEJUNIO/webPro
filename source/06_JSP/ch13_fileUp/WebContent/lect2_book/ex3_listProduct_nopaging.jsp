<%@page import="com.lec.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.book.BookDao"%>
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
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook();
%>
	<table>
		<caption>책 리스트</caption>
		<tr>
		<%
			if(books.isEmpty()){
				out.print("<td>책이 없습니다</td>");
			}else{
				for(int i=0; i<books.size(); i++){
					int bid = books.get(i).getBid();
					int price = books.get(i).getBprice();
					int discount = books.get(i).getBdiscount();
					int disPrice = price * (100-discount)/100;
					if(i!=0 && i%3==0){
						out.print("</tr><tr>");
					}//if
		%>
			<td>
				<a href="content.jsp?bid=<%=bid%>">
					<img src="<%=conPath%>/bookImg/<%=books.get(i).getBimage1()%>"><br>
					<%=bid%>. <%=books.get(i).getBtitle() %><br>
				</a>
					<del><%=price %></del><br>
					<b><%=disPrice%>원(<%=discount%>%할인)</b>
			</td>
		<% 
				//if(i%3==2){out.print("</tr><tr>");} //3의 배수로 끝나면 tr한 행이 그냥 추가
				}//for
			}//if
		%>
		</tr>
	</table>
</body>
</html>