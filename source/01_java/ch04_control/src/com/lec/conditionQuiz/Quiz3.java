package com.lec.conditionQuiz;
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
// 0(가위), 1(바위), 2(보자기) 
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
<<<<<<< HEAD
		System.out.print("가위(0), 바위(1), 보자기(2) 중 숫자 하나를 선택하세요 :");
		int you = scanner.nextInt();  // 0,1,2
		String youStr = (you==0) ? "가위" : (you==1)? "바위":"보자기";
=======
<<<<<<< HEAD
		System.out.print("가위(0), 바위(1), 보자기(2) 중 숫자 하나를 선택하세요 :");
		int you = scanner.nextInt();  // 0,1,2
		String youStr = (you==0) ? "가위" : (you==1)? "바위":"보자기";
		if(you>2 || you<0) {
			System.out.println("잘못 입력하심");
			System.exit(0); // 프로그램 강제 종료
		}
		System.out.println(youStr);
//		if(you==0) {
//			System.out.println("가위");
//		}else if(you==1) {
//			System.out.println("바위");
//		}else if(you == 2) {
//			System.out.println("보자기");
//		}else {
//			System.out.println("잘못 하심");
//		}
//		switch(you) {
//		case 0 : System.out.println("가위"); break;
//		case 1 : System.out.println("바위"); break;
//		case 2 : System.out.println("보자기"); break;
//		default: System.out.println("잘못 입력하심"); break;
//		}
	}
}

=======
		System.out.print("가위(0), 바위(1), 보자기(2) 중 숫자 하나를 선택하세요 : ");
		int you = scanner.nextInt(); //0,1,2
		String youStr = (you==0) ? "가위" : (you==1)? "바위" : "보자기";
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
		if(you>2 || you<0) {
			System.out.println("잘못 입력하심");
			System.exit(0); // 프로그램 강제 종료
		}
		System.out.println(youStr);
//		if(you==0) {
//			System.out.println("가위");
//		}else if(you==1) {
//			System.out.println("바위");
//		}else if(you == 2) {
//			System.out.println("보자기");
//		}else {
//			System.out.println("잘못 하심");
//		}
//		switch(you) {
//		case 0 : System.out.println("가위"); break;
//		case 1 : System.out.println("바위"); break;
//		case 2 : System.out.println("보자기"); break;
//		default: System.out.println("잘못 입력하심"); break;
//		}
	}
}
<<<<<<< HEAD

=======
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
