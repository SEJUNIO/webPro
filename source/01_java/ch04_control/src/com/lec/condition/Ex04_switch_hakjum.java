package com.lec.condition;
<<<<<<< HEAD

=======
<<<<<<< HEAD

import java.util.Scanner;
//����ڷκ��� ����(0~100)�� �Է¹޾� ���� ���
public class Ex04_switch_hakjum {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	System.out.print("����(0~100) ? ");
	int score = scanner.nextInt();
	int temp = score==100 ? 99 : score;
	switch(temp/10) {
	case 9 : 
		System.out.println("A"); break;
	case 8 : 
		System.out.println("B"); break;
	case 7 : 
		System.out.println("C"); break;
	case 6 : 
		System.out.println("D"); break;
	case 5: case 4: case 3: case 2: case 1: case 0:
		System.out.println("F"); break;
		default : System.out.println("��ȿ���� ���� �����Դϴ�");
	}
	scanner.close();
}
}
=======
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;
//����ڷκ��� ����(0~100)�� �Է¹޾� ���� ���
public class Ex04_switch_hakjum {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	System.out.print("����(0~100) ? ");
	int score = scanner.nextInt();
	int temp = score==100 ? 99 : score;
	switch(temp/10) {
	case 9 : 
		System.out.println("A"); break;
	case 8 : 
		System.out.println("B"); break;
	case 7 : 
		System.out.println("C"); break;
	case 6 : 
		System.out.println("D"); break;
	case 5: case 4: case 3: case 2: case 1: case 0:
		System.out.println("F"); break;
		default : System.out.println("��ȿ���� ���� �����Դϴ�");
	}
<<<<<<< HEAD
	scanner.close();
}
}
=======
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
