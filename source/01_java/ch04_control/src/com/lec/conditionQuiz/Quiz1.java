package com.lec.conditionQuiz;

import java.util.Scanner;
<<<<<<< HEAD

//����ڷκ��� ���� �Է¹޾� ���밪 ��� (ex. -5�� �Է��ϸ� 5�� ���)
public class Quiz1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� :");
		int su = scanner.nextInt();
		if(su >= 0) {
			System.out.println("�Է��Ͻ� ���� ���밪�� " + su);
		}else {
			System.out.println("�Է��Ͻ� ���� ���밪�� " + (-su) );
		}
		scanner.close();
	}
=======
//����ڷκ��� ���� �Է¹޾� ���밪 ��� (ex -5�Է��ϸ� 5���)
public class Quiz1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int su = scanner.nextInt();
		if(su >= 0) {
			System.out.println("�Է��Ͻ� ���� ���밪��" + su);
		}else { 
			System.out.println("�Է��Ͻ� ���� ���밪��" + (-su));
		}
		scanner.close();
	}
	
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
}
