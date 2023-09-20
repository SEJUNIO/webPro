<%@page import="com.lec.ex.dao.BoardDao"%>
<%@page import="com.lec.ex.dto.BoardDto"%>
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
	<a href="xx.jsp">에러 페이지로 갈까?</a>
	<%
		BoardDao bDao = BoardDao.getInstance();
		out.println("<h3>1. 글 목록</h3>");
		ArrayList<BoardDto> dtos = bDao.listBoard();
		for(BoardDto dto : dtos){
			out.println(dto + "<br>");
		}
		out.println("<h3>2. 글갯수 : " + bDao.getBoardTotalCnt() + "</h3>");
		out.println("<h3>3. 원글쓰기");
		BoardDto dto = new BoardDto(0, "박수진", "제목 5교시", "냉무", null, 0, "111",
				0, 0, 0, "192.168.0.1", null);
		int result = bDao.writeBoard(dto);
		out.print(result == BoardDao.SUCCESS ? ":성공</Wh3>" : "실패</h3>");
		out.print("<h3>6. 조회수 안 올리고, 글번호 dto가져오기</h3");
		out.print("2번글:" + bDao.getBoardNotHitup(2) + "<br>");
		out.print("<h3>4와5. 조회수 올리고, 글번호로 dto가져오기</h3>");
		out.print("2번글 상세보기 :" + bDao.getContent(2) + "상세보기 hitUp 수행");
		out.print("<h3>7.글수정</h3>");
		dto = bDao.getBoardNotHitup(2); //2번 글 정보
		dto.setBname("독특자");
		dto.setBtitle("독특한 제목");
		dto.setBcontent("독특한 본문 수정 하기");
		result = bDao.modifyBoard(dto);
		out.print(result == BoardDao.SUCCESS ? "성공</h3>" : "실패</h3>");
		out.print("<h4>8. 글 삭제</h4>");
		result = bDao.deleteBoard(2, "1");
		out.print(result == BoardDao.SUCCESS? "글삭제 성공":"비번오류로 글 삭제 실패<br>");
		result = bDao.deleteBoard(2, "0111");
		out.print(result == BoardDao.SUCCESS? "글삭제 성공":"비번오류로 글 삭제 실패<br>");
	%>
</body>
</html>