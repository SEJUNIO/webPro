package com.lec.ex.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.ex.dao.MemberDao;
import com.lec.ex.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class MJoinService implements Service{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 첨부한 파일 저장 - > 파라미터 받아 DB 저장
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024; // 사진 업로드 제한 용량 : 1M
		String mphoto = ""; // 첨부된 파일 이름을 저장할 변수
		int result = MemberDao.FAIL; // 회원가입 결과를 저장할 변수
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames(); //파라미터 이름들
				String param = params.nextElement();
				mphoto = mRequest.getFilesystemName(param);
			// mRequest를 이용하여 파라미터 받아와서 db에 저장하기
			String mid = mRequest.getParameter("mid");
			String mpw = mRequest.getParameter("mpw");
			String mname = mRequest.getParameter("mname");
			String memail = mRequest.getParameter("memail");
			mphoto = mphoto==null? "NOIMG.JPG" : mphoto;
			String mbirthStr = mRequest.getParameter("mbirth");
			Date mbirth = mbirthStr.equals("") ? null:Date.valueOf(mbirthStr); // 아래와 같다
//			Date mbirth = null;
//			if(!mbirthStr.equals("")) {
//				mbirth = Date.valueOf(mbirthStr);
//			}
			String maddress = mRequest.getParameter("maddress");
			MemberDao mDao = MemberDao.getInstance();
			//mid 중복체크
			result = mDao.midConfirm(mid);
			if(result == MemberDao.NON_EXISTENT) { // 가입 가능한 mid라서 회원가입 진행
				MemberDto newMember = new MemberDto(mid, mpw, mname, memail, mphoto, mbirth, maddress, null);
				// 회원가입
				result = mDao.joinMember(newMember);
				if(result == MemberDao.SUCCESS) { // 가입성공
					HttpSession session = request.getSession();
					session.setAttribute("mid", mid);
					request.setAttribute("joinResult", "회원가입이 완료되었습니다.");
				}else { // 가입실패
					request.setAttribute("joinErrorMsg", "정보가 너무 길어서 회원가입 실패");
				}
			}else { // 가입 불가한 mid
				request.setAttribute("joinErrorMsg", "중복된 ID는 회원가입이 불가합니다.");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("joinErrorMsg", "첨부 파일의 용량이 1M 이내로 업로드 해주세요");
		}
		// 서버에 업로드된 파일을 소스폴더로 복사
		File serverFile = new File(path + "/" + mphoto);
		if(serverFile.exists() && !mphoto.equals("NOIMG.JPG") && result==MemberDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try{
				is = new FileInputStream(serverFile); // 서버에 업로드된 파일
				os = new FileOutputStream("D:/webpro/source/06_JSP/ch18_mvcmember/WebContent/memberPhotoUp/"+mphoto);																																
					byte[] bs = new byte[(int)serverFile.length()];
					while(true){
						int readByteCnt = is.read(bs);
						if(readByteCnt==-1) break;
						os.write(bs, 0, readByteCnt);
					}
					System.out.println(mphoto +" 복사 완료");				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				
					try {
						if(os!=null)os.close();
						if(is!=null) is.close();
					} catch (IOException e) {
						System.out.println(e.getMessage());
				}//close				
			}// try-catch -finally
		} // if - 파일복사 여부
	}//execute 함수
}//class
