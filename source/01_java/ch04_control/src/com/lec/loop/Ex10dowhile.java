package com.lec.loop;

import java.util.Scanner;
<<<<<<< HEAD
//¦���� �Է¹޾� ���(¦���� �ƴϸ� ¦���� �ٽ� �Է¹���)
public class Ex10dowhile {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	int num;
	do {
		System.out.println("¦���� �Է��ϼ��� : ");
		 num = scanner.nextInt();
	}while(num%2 != 0);
		System.out.println("�Է��Ͻ� ���� " + num);
		scanner.close();
	}
=======

// ¦���� �Է¹޾� ���(¦���� �ƴϸ� ¦���� �ٽ� �Է� ����)
public class Ex10dowhile {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num;
		do {
			System.out.print("¦���� �Է��ϼ��� : ");
			num = scanner.nextInt();
		}while (num%2 !=0);		
		System.out.println("�Է��Ͻ� ����" + num);
		scanner.close();
	}	
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
}
