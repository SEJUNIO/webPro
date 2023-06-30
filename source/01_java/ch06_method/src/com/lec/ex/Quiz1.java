package com.lec.ex;

import java.util.Scanner;

public class Quiz1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int su;
		do{
			System.out.print("몇 단 출력할까?");	
			su = scanner.nextInt();	
		}while(su < 2 || su>9);
			method(su);
	}

	private static void method(int su) {
		for(int i=1; i<10; i++) {
			System.out.println(su + "*" + i + "=" + su*i);
			//System.out.printf("%d * %d = %d\n", su, i, dansu*i);
		}
		
	}
}
