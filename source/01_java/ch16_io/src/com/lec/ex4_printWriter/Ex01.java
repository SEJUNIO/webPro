package com.lec.ex4_printWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;

// printWriter : OutputStream을 기본스트림으로 하는 보조스트림으로 사용
// printWriter : Writer를 기본스트림으로 하는 보조 스트림으로 사용
// printWriter 혼자 기본스트림처럼 사용
public class Ex01 {
	public static void main(String[] args) {
		OutputStream os           = null;
		Writer       writer       = null;
		PrintWriter  printWriter  = null;
		try {
			// 1. PrintWriter : OutputStream의 보조 스트림
//			os = new FileOutputStream("txtFile/outTest.txt", true); //append
//			printWriter = new PrintWriter(os);
			// 2. PrintWriter : Writer의 보조스트림
//			writer = new FileWriter("txtFile/outTest.txt", true); //append
//			printWriter = new PrintWriter(writer);
			// 3.PrintWriter를 기본 스트림처럼 사용 
			printWriter = new PrintWriter("txtFile/outTest.txt"); //append 불가
			
			//콘솔 및 파일 출력
			System.out.println("안녕하세요\n반갑습니다");
			printWriter.println("안녕하세요\n반갑습니다");
			System.out.print("print는 자동개행이 안되요. 그래서 개행추가\n");
			printWriter.print("print는 자동개행이 안되요. 그래서 개행추가\n");
			System.out.printf("%s %3d %3d %5.1f\n", "홍길동", 100, 100, 100.0);
			printWriter.printf("%s %3d %3d %5.1f\n", "홍길동", 100, 100, 100.0);
			System.out.printf("%s %3d %3d %5.1f\n", "신길동", 90, 91, 90.5);
			printWriter.printf("%s %3d %3d %5.1f\n", "신길동", 90, 91, 90.5);
			System.out.printf("%s %3d %3d %5.1f\n", "박길동", 95, 97, 96.0);
			printWriter.printf("%s %3d %3d %5.1f\n", "박길동", 95, 97, 96.0);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(printWriter!=null) printWriter.close();
				//if(os         !=null) os.close();
				//if(writer     !=null) writer.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}//close
		}//try절	
	}//main
}//class
