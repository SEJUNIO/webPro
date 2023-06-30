package com.lec.loop;

import java.util.Scanner;
<<<<<<< HEAD
//짝수를 입력받아 출력(짝수가 아니면 짝수를 다시 입력받음)
=======
<<<<<<< HEAD
//짝수를 입력받아 출력(짝수가 아니면 짝수를 다시 입력받음)
public class Ex10dowhile {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	int num;
	do {
		System.out.println("짝수를 입력하세요 : ");
		 num = scanner.nextInt();
	}while(num%2 != 0);
		System.out.println("입력하신 수는 " + num);
		scanner.close();
	}
=======

// 짝수를 입력받아 출력(짝수가 아니면 짝수를 다시 입력 받음)
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
public class Ex10dowhile {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	int num;
	do {
		System.out.println("짝수를 입력하세요 : ");
		 num = scanner.nextInt();
	}while(num%2 != 0);
		System.out.println("입력하신 수는 " + num);
		scanner.close();
<<<<<<< HEAD
	}
=======
	}	
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
}
