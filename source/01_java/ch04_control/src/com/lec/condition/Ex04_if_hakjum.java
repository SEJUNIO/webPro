package com.lec.condition;
<<<<<<< HEAD

=======
<<<<<<< HEAD

import java.util.Scanner;

//����ڷκ��� ����(0~100)�� �Է¹޾� ���� ���
public class Ex04_if_hakjum {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	System.out.print("����(0~100)? ");
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
		System.out.println("��ȿ���� �ʴ� �����Դϴ�");
	}
	scanner.close();
	}
}
=======
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;

//����ڷκ��� ����(0~100)�� �Է¹޾� ���� ���
public class Ex04_if_hakjum {
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	System.out.print("����(0~100)? ");
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
		System.out.println("��ȿ���� �ʴ� �����Դϴ�");
	}
<<<<<<< HEAD
	scanner.close();
	}
}
=======
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
