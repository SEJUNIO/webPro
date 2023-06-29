package com.lec.quiz;

import java.util.Scanner;

public class example {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int kor;
		kor = 95;
		System.out.println("kor = " + kor);
		
		int eng;
		eng = 90;
		System.out.println("eng = " + eng);
		
		int math;
		math = 99;
		System.out.println("math = " + math);
		System.out.println("total = " + (kor+eng+math));
		double d2 = kor+eng+math;
		System.out.println( d2 / 3);
	}
		
}
