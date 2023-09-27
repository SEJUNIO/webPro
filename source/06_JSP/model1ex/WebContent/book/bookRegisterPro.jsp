<%@page import="com.lec.book.BookDao"%>
<%@page import="com.lec.book.BookDto"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	<jsp:include page="../main/header.jsp"/>
<%
	//첨부한 파일 저장하고 파일이름 받아온다
	String path = request.getRealPath("bookImg");
	out.println("서버에 저장될 폴더 : " + path + "<br>");
	int maxSize = 1024*1024*3; // 최대업로드 사이지를 3M
	String[] images = {"",""};
	MultipartRequest mRequest = null;
	try{
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> params = mRequest.getFileNames();
		int idx = 0;
		while(params.hasMoreElements()){
			String param = params.nextElement();
			images[idx] = mRequest.getFilesystemName(param);
			System.out.println(idx+"번째 처리한 파라미터 :" + param + "/파일명:" + images[idx]);
			idx++;
		}
	}catch(IOException e){
		System.out.println(e.getMessage());
	}
	//서버에 저장된 파일을 소스폴터로 복사(사용자에게 베포시 제거 로직)
		for(String filename : images){
			InputStream is = null;
			OutputStream os = null;
			try{
				File serverFile = new File(path + "/" + filename); 
				//if(filename!=null){
				if(serverFile.exists()){
					is = new FileInputStream(serverFile); // 서버에 업로드된 파일
					os = new FileOutputStream("D:/webPro/source/06_JSP/ch13_fileUp/WebContent/fileUpFolder/"
																																+filename); // 소스폴더로 복사될 파일
					byte[] bs = new byte[(int)serverFile.length()];
					while(true){
						int readByteCnt = is.read(bs);
						if(readByteCnt==-1) break;
						os.write(bs, 0, readByteCnt);
					}
					System.out.println(filename +" 복사 완료");
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(os!=null) os.close();
				if(is!=null) is.close();
			}
		}
	//btitle, bprice, bcontent, bdiscount 파라미터값 받아온다
	String btitle = mRequest.getParameter("btitle");
	int bprice = Integer.parseInt(mRequest.getParameter("bprice"));
	String bimage1 = images[1]==null ? "noImg.png":images[1];
	String bimage2 = images[0]!=null ? images[0] : "NOTHING.JPG";
	String bcontent = mRequest.getParameter("bcontent");
	int bdiscount = Integer.parseInt(mRequest.getParameter("bdiscount"));;
	//String ip = request.getRemoteAddr();
	
	BookDto book = new BookDto(0, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, null);
	BookDao bDao = BookDao.getInstance();
	int result = bDao.insertBook(book);
	if(result==BookDao.SUCCESS){
%>
	<script>
	alert('책등록 성공');
	location.href='../main/main.jsp';
	</script>	
	<%}else{%>
		<script>
		alert('책등록 실패');
		location.href='history.back';
	</script>	
	<%}%>

	<jsp:include page="../main/footer.jsp"/>
</body>
</html>