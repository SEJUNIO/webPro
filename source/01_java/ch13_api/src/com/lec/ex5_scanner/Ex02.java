package com.lec.ex5_scanner;

import java.util.Scanner;
//���� - �̸� - 
public class Ex02 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("����? ");
		int age = scanner.nextInt();
		System.out.println("�Է��� ���̴�: " + age);
		System.out.println("�̸�? ");
		String name = scanner.next();
		System.out.println("�Է��� �̸���: " + name); //��ũ����� �ȵ�  //white-space(space, tab, \n) �ձ��� ������, �Ǿտ� �ִ� \n�� ����
		System.out.println("�ּ�? ");
		scanner.nextLine(); // ���ۿ� �����ִ� \n�� ����� �뵵
		String address = scanner.nextLine(); //"\n�ձ��� �������� \n����
		System.out.println("�Է��� �ּҴ�: " + address);
		System.out.println("��");
		scanner.close();
		
		
		
		
	}
	
}
