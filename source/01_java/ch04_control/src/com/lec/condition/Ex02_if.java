package com.lec.condition;
<<<<<<< HEAD

=======
<<<<<<< HEAD

import java.util.Scanner;

//두수를 입력받아 몇번째 수가 얼마만큼 더 큰지 출력
public class Ex02_if {
	 public static void main(String[] args) {
	 Scanner scanner = new Scanner(System.in);
	 System.out.print("첫번째 수는 : " );
	 int num1 = scanner.nextInt();
	 System.out.print("두번째 수는 : " );
	 int num2 = scanner.nextInt();
	 if(num1>num2) {
		 System.out.printf("첫번째 수(%d)가 %d만큼 더 큽니다\n", num1, (num1-num2) );
	 }else if(num2>num1) {
		 System.out.printf("두번째 수(%d)가 %d만큼 더 큽니다\n", num2, (num2-num1) );
	 }else {
		 System.out.println("두 수가 같습니다");
	 }
	 scanner.close();
=======
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;

//두수를 입력받아 몇번째 수가 얼마만큼 더 큰지 출력
public class Ex02_if {
<<<<<<< HEAD
	 public static void main(String[] args) {
	 Scanner scanner = new Scanner(System.in);
	 System.out.print("첫번째 수는 : " );
	 int num1 = scanner.nextInt();
	 System.out.print("두번째 수는 : " );
	 int num2 = scanner.nextInt();
	 if(num1>num2) {
		 System.out.printf("첫번째 수(%d)가 %d만큼 더 큽니다\n", num1, (num1-num2) );
	 }else if(num2>num1) {
		 System.out.printf("두번째 수(%d)가 %d만큼 더 큽니다\n", num2, (num2-num1) );
	 }else {
		 System.out.println("두 수가 같습니다");
	 }
	 scanner.close();
=======
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫번째 수는");
		int num1 = scanner.nextInt();
		System.out.println("두번째 수는");
		int num2 = scanner.nextInt();
		if(num1>num2) {
			System.out.printf("첫번째 수(%d)가 %d만큼 더 큽니다\n", num1, (num1-num2));			
		}else {
			System.out.println("두 수가 같습니다");
		}
		scanner.close();
		
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
	}
}
