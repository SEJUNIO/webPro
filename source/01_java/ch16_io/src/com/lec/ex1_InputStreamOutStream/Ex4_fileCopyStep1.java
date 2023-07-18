package com.lec.ex1_InputStreamOutStream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
//파일 카피 D:/webpro/Download/01.java/bts_7.mp4(7,460,545 byte)
public class Ex4_fileCopyStep1 {
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); //1970.1.1부터 시작시점까지의 밀리세컨
		//file Copy 로직
		InputStream is =null;
		OutputStream os =null;
		try {
			is = new FileInputStream("D:/webpro/Download/01_java/bts_7.mp4");
			os = new FileOutputStream("D:/webpro/Download/01_java/bts_copy.mp4");
			int cnt = 0;
			while(true) {
				int i = is.read(); //read&write : 7,460,545번 수행
				if(i==-1)break;
				os.write(i); //write
				cnt++;
				if(cnt%1000000==0) {     //100만으로 나눈 나머지가 0이면
					System.out.println(cnt +"/7,460,545 : " +(int)(cnt/7460545.0 *100) +"%진행");
				}
			}
			System.out.println(cnt + "번 while문 실행하여 복사 성공");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(os!=null) is.close();
			}catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		long end = System.currentTimeMillis();   //1970,1,1부터 끝나는 시점까지의 밀리세컨
		System.out.println((end-start)/1000.0 + "초 걸림");
		
		
		
		
	}
}
