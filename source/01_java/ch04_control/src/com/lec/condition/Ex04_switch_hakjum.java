package com.lec.condition;

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