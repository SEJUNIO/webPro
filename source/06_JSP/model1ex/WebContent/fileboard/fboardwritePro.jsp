<%@page import="com.lec.fileboard.FileBoardDto"%>
<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.lec.fileboard.FileBoardDao"%>
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
	String path = request.getRealPath("fileboardUpload");
	int maxSize = 1024*1024*5;
	String filename = "";
	MultipartRequest multipartRequest = null;
	try{
		multipartRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> params = multipartRequest.getFileNames();
		String param = params.nextElement();
		filename = multipartRequest.getFilesystemName(param);
	}catch(IOException e){
		System.out.println(e.getMessage());
	}
	//System.out.println("서버에 저장 완료");
	InputStream is = null;
	OutputStream os = null;
	try{
		File serverFile = new File(path+"/"+filename);
		if(serverFile.exists()){
			is = new FileInputStream(serverFile);
			os = new FileOutputStream("D:/webpro/source/06_JSP/model1ex/WebContent/fileboardUpload/"+filename);
			byte[] bs = new byte[(int)serverFile.length()];
			int nReadByteCnt;
			while((nReadByteCnt=is.read(bs))!=-1){
				os.write(bs, 0, nReadByteCnt);
			}
		}
		
	}catch(IOException e){
		System.out.println(e.getMessage());
	}finally{
		if(is!=null) is.close();
		if(os!=null) os.close();
	}
	//System.out.println("복사완료");
	String pageNum = multipartRequest.getParameter("pageNum");
	String cid = ((CustomerDto)session.getAttribute("customer")).getCid();
	String ftitle = multipartRequest.getParameter("ftitle");
	String fcontent = multipartRequest.getParameter("fcontent");
	String fpw = multipartRequest.getParameter("fpw");
	String fip = request.getRemoteAddr();
	FileBoardDto fbDto = new FileBoardDto(0, cid, ftitle, fcontent, filename, 0, fpw, 0,
			0, 0, fip, null, null, null);
	FileBoardDao fDao = FileBoardDao.getInstance();
	int result = fDao.writeFileBoard(fbDto);
	if(result==FileBoardDao.SUCCESS){		
		%>
		<script>
			alert('글쓰기 성공');
			location.href = 'fboardList.jsp';
		</script>
		<%}else{%>
		<script>
			alert('글쓰기 실패');
			history.back();
		</script>
		<%}%>
</body>
</html>