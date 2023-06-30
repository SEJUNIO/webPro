package com.lec.condition;

import java.util.Scanner;
<<<<<<< HEAD
//사용자로부터 받은 정수가 홀수인지 짝수인지 출력 (삼항연산자, if, switch) - switch
=======
<<<<<<< HEAD
//사용자로부터 받은 정수가 홀수인지 짝수인지 출력 (삼항연산자, if, switch) - switch
=======

//사용자로부터 받은 정수가 홀수인지 짝수인지 출력(삼항연산자 , if, switch) - switch
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
public class Ex05 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int su = scanner.nextInt();
<<<<<<< HEAD
		switch(su%2) {
		case 0 :
=======
<<<<<<< HEAD
		switch(su%2) {
		case 0 :
			System.out.println("짝수"); break;
		default : 
			System.out.println("홀수"); break;
		}
		scanner.close();
	}
}
=======
		switch(su&2) {
		case 0: 
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
			System.out.println("짝수"); break;
		default : 
			System.out.println("홀수"); break;
		}
		scanner.close();
	}
}
<<<<<<< HEAD
=======
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
