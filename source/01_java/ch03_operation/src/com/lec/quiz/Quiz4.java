package com.lec.quiz;

import java.util.Scanner;
// 나이에 따른 경로우대, 일반 출력
public class Quiz4 {
	public static void main(String[] args) {
	System.out.print("나이를 입력하세요 :");
	Scanner scanner = new Scanner(System.in);
	int age = scanner.nextInt();
	System.out.println((age>=65)? "경로우대" : "일반" );
	scanner.close();
	}
}
