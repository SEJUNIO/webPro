package com.lec.condition;
<<<<<<< HEAD

import java.util.Scanner;

//사용자로부터 점수(0~100)을 입력받아 학점 출력
public class Ex04_if_hakjum {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	System.out.print("점수(0~100)? ");
	int score = scanner.nextInt();
	if((90<=score) && (score<=100) ) {
		System.out.println("A");
	}else if (score>=80 && score<90) {
		System.out.println("B");
	}else if (score>=70 && score<80) {
		System.out.println("C");
	}else if (score>=60 && score<70) {
		System.out.println("D");
	}else if (score>=0 && score <60) {
		System.out.println("F");
	}else {
		System.out.println("유효하지 않는 점수입니다");
	}
	scanner.close();
	}
}
=======
import java.util.Scanner;
//점수(0~100)를 입력받아 학점 출력
public class Ex04_if_hakjum {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("점수 (0~100) ? ");
		int score = scanner.nextInt();
		if(score>=90 && score<=100) {
			System.out.println("A");
		}else if(score>=80 && score < 90) {
			System.out.println("B");
		}else if(score>=70 && score < 80) {
			System.out.println("C");
		}else if(score>=60 && score < 70) {
			System.out.println("D");
		}else if(score>=60 && score < 0) {
			System.out.println("F");
		}else {
			System.out.println("유효하지 않는 점수입니다");
		} //if
		scanner.close();
	}
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
