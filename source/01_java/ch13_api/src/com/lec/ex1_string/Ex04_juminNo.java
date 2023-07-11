package com.lec.ex1_string;

import java.util.Scanner;

public class Ex04_juminNo {
	public static void main(String[] args) {
		String juminNo;
		Scanner scanner = new Scanner(System.in);
		System.out.print("주민번호를 입력하세요 : ");
		juminNo = scanner.next(); // 981212-1025478
		
		//String방법으로 추출
		String genderStr = juminNo.substring(7,8); // "1"
		if(genderStr.equals("1") || genderStr.equals("3")){
			System.out.println("남자");
		}else if(genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("여자");
		}else {
			System.out.println("잘못입력");
		}
		//char방법으로추출
		char genderChar = juminNo.charAt(7); // '1'
		if(genderChar=='1' || genderChar=='3') { //소문자면 ==
			System.out.println("남자");
		}else if(genderChar=='2' || genderChar=='4') {
			System.out.println("여자");
		}else {
			System.out.println("잘못입력");
		}
		//방법 3   "1" -> 1
		int genderInt = Integer.parseInt(genderStr); //2
		if(genderInt==1 || genderInt==3) {
			System.out.println("남성이시군요");
		}else if(genderInt==2 || genderInt==4) {
			System.out.println("여성이시군요");
		}else {
			System.out.println("잘못입력");
		}
		scanner.close();
		}

}
