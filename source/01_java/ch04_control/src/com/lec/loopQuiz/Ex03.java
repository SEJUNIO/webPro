package com.lec.loopQuiz;

import java.util.Scanner;

public class Ex03 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
			System.out.print("��� ����ұ�? ");
		int su = scanner.nextInt();
		for(int i=1; i<=9; i++) {
			System.out.println(su + " * " + i + " = " + su*i);
		}
		scanner.close();
	}
}
