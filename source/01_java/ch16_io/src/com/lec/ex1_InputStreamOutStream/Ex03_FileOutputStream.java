package com.lec.ex1_InputStreamOutStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 파일을 연다(스트림객체생성) ->쓴다 ->파일을 닫는다
public class Ex03_FileOutputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txtFile/outTest.txt", true); // true : append(추가)
																	// false : 기본(파일이 없으면 생성. 파일이 있으면 덮어씀)
//			byte[] bs = {'H','e','l','l','o', '\n'};
			String msg = "Hi, Java\n01234567\n안녕";
			byte[] bs = new byte[10]; // 스트링을 byte배열로 바꾸는 함수
//			for(byte b : bs) {
//				os.write(b);
//			}
			os.write(bs);
			System.out.println("파일 출력 완료");
		} catch (FileNotFoundException e) {
			System.out.println("폴더를 못 찾음. 예외 메세지 : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
