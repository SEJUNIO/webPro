package com.lec.ex1_InputStreamOutStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
public class Ex4_fileCopyStep3 {
//파일 카피 D:/webpro/Download/01.java/bts_7.mp4(7,460,545 byte)
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); //1970.1.1부터 시작지점까지의 밀리세컨
		//file Copy 로직
		InputStream is = null;
		OutputStream os = null;
		File file = new File("D:/webpro/Download/01_java/bts_7.mp4");
		try {
			is = new FileInputStream(file);
			os = new FileOutputStream("D:/webpro/Download/01_java/bts_copy.mp4");
			int cnt = 0;
			byte[] bs = new byte[(int)file.length()]; //파일의 크기
			while(true) {    //read & write : 7,460,545 //1024번쯤 수행
				int readByteCount = is.read(bs); //read
				if(readByteCount==-1)break;
				os.write(bs, 0, readByteCount); //write
				cnt++;
			}
			System.out.println(cnt + "번 while문 실행하여 복사 성공");
		} catch(IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null)os.close();
				if(os!=null)is.close();
			}catch(IOException e) {
				System.out.println(e.getMessage());
			}
		}
		long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0 +"초 걸림");
	}
}
