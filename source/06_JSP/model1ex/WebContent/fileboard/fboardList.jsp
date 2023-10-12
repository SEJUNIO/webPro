<%@page import="com.lec.fileboard.FileBoardDto"%>
<%@page import="com.lec.fileboard.FileBoardDao"%>
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
	<script>
		$(document).ready(function() {
			$('tr').click(function(){
				var bid = $(this).children().eq(0).text().trim();
				if(!isNaN(Number(fid))){
					location.href = 'fboardContent.jsp?pageNum=<%=pageNum%>&fid='+fid;
				}
			});
		});
	</script>
	<style>
	#content_form{
			height: 670px; 
			padding-top:30px;
		}
	</style>
</head>
<body>
<%
	String result = request.getParameter("result");
	if(result!=null && result.equals("1")){
		out.print("<script>alert('글쓰기 완료');</script>");
	}else if(result!=null && result.equals("10")){
		out.print("<script>alert('글쓰기 실패(길어욤..)');</script>");
	}
%>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<table>
		<tr><td colspan="7"> 
					<%if(session.getAttribute("customer")!=null){%>
						<a href="fboardwriteForm.jsp">글쓰기</a>
					<%} %>
				</td>
			</tr>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>메일</th><th>IP</th><th>작성일</th><th>조회수</th></tr>
		<% //list.jsp 또는 list.jsp?pageNum=12
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=10, BLOCKSIZE=10;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow   = startRow + PAGESIZE - 1;
		FileBoardDao fbDao = FileBoardDao.getInstance();
		ArrayList<FileBoardDto> dtos = fbDao.listFileBoard(startRow, endRow);
		if(dtos.size()==0){
			out.print("<tr><td colspan='7'>등록된 글이 없습니다.</td></tr>");
		}else{
			for(FileBoardDto dto : dtos){
				out.print("<tr><td>"+dto.getFid()+"</td>");
				out.print("<td>"+dto.getCname()+"</td>");
				out.print("<td class='left'>");
				if(dto.getFindent()>0){	
					int width = dto.getFindent()*20;
					out.print("<img src='../img/level.gif' width='"+width+"' height='10'>");
					out.print("<img src='../img/re.gif'>");
				}
				if(dto.getFhit()>10){
					out.print("<img src='../img/hot.gif'>");
				}
				//out.print("<a href='fboardContent.jsp?fid="+dto.getFid()+"&pageNum="+pageNum+
				//															"'>"+dto.getFtitle()+"</a> ");
				out.print(d.getFtitle());
				if(dto.getFilename()!=null){
					out.print("<img src='../img/fileup.jpg' width='10'></td>");
				}
				out.print("<td>"+(dto.getCemail()!=null? dto.getCemail():"-")+"</td>");
				out.print("<td>"+dto.getFip()+"</td>");
				out.print("<td>"+dto.getFrdate()+"</td>");
				out.print("<td>"+dto.getFhit()+"</td>");
			
				}
			}
		%>
	</table>
	<div class="paging">
	<%
		int totalCnt = fbDao.getFileBoardTotalCnt();
		int pageCnt = (int)Math.ceil((double)totalCnt/PAGESIZE); //페이지 갯수
		int startPage =((currentPage -1)/BLOCKSIZE)*BLOCKSIZE +1; //시작페이지
		int endPage = startPage + BLOCKSIZE -1;
		if(endPage > pageCnt){
			endPage = pageCnt; //22
		}
		if(startPage > BLOCKSIZE){
			out.print("[ <a href='" + conPath + "/fileboard/fboardList.jsp?pageNum="+(startPage-1)+"'> 이전</a> ]");
		}
		for(int i=startPage; i<=endPage; i++){
			if(i == currentPage){
				out.print("[ <b>" + i + "</b> ]");
			}else{
				out.print("[ <a href='" + conPath +"/fileboard/fboardList.jsp?pageNum=" + i + "'>" + i + "</a> ]");
			}
		}
		if(endPage < pageCnt){
			out.print("[<a href='" + conPath + "/fileboard/fboardList.jsp?pageNum=" + (endPage+1) + "'>다음</a>]");
		}
	%>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>