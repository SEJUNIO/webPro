package com.lec.conditionQuiz;
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
// 0(����), 1(����), 2(���ڱ�) 
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
<<<<<<< HEAD
		System.out.print("����(0), ����(1), ���ڱ�(2) �� ���� �ϳ��� �����ϼ��� :");
		int you = scanner.nextInt();  // 0,1,2
		String youStr = (you==0) ? "����" : (you==1)? "����":"���ڱ�";
=======
<<<<<<< HEAD
		System.out.print("����(0), ����(1), ���ڱ�(2) �� ���� �ϳ��� �����ϼ��� :");
		int you = scanner.nextInt();  // 0,1,2
		String youStr = (you==0) ? "����" : (you==1)? "����":"���ڱ�";
		if(you>2 || you<0) {
			System.out.println("�߸� �Է��Ͻ�");
			System.exit(0); // ���α׷� ���� ����
		}
		System.out.println(youStr);
//		if(you==0) {
//			System.out.println("����");
//		}else if(you==1) {
//			System.out.println("����");
//		}else if(you == 2) {
//			System.out.println("���ڱ�");
//		}else {
//			System.out.println("�߸� �Ͻ�");
//		}
//		switch(you) {
//		case 0 : System.out.println("����"); break;
//		case 1 : System.out.println("����"); break;
//		case 2 : System.out.println("���ڱ�"); break;
//		default: System.out.println("�߸� �Է��Ͻ�"); break;
//		}
	}
}

=======
		System.out.print("����(0), ����(1), ���ڱ�(2) �� ���� �ϳ��� �����ϼ��� : ");
		int you = scanner.nextInt(); //0,1,2
		String youStr = (you==0) ? "����" : (you==1)? "����" : "���ڱ�";
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
		if(you>2 || you<0) {
			System.out.println("�߸� �Է��Ͻ�");
			System.exit(0); // ���α׷� ���� ����
		}
		System.out.println(youStr);
//		if(you==0) {
//			System.out.println("����");
//		}else if(you==1) {
//			System.out.println("����");
//		}else if(you == 2) {
//			System.out.println("���ڱ�");
//		}else {
//			System.out.println("�߸� �Ͻ�");
//		}
//		switch(you) {
//		case 0 : System.out.println("����"); break;
//		case 1 : System.out.println("����"); break;
//		case 2 : System.out.println("���ڱ�"); break;
//		default: System.out.println("�߸� �Է��Ͻ�"); break;
//		}
	}
}
<<<<<<< HEAD

=======
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
