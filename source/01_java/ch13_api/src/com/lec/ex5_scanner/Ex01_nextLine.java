package com.lec.ex5_scanner;

import java.util.Scanner;
//���� - �̸� - 
public class Ex01_nextLine {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("����? ");
		int age = scanner.nextInt();
		System.out.println("�Է��� ���̴�: " + age);
		System.out.print("�̸�(�� ũ����|ȫ�浿)? ");
		scanner.nextLine(); //���ۿ� �����ִ� \n�� ����� �뵵
		String name = scanner.nextLine().trim();
		System.out.println("�Է��� �̸���: " + name); //��ũ����� �ȵ�  //white-space(space, tab, \n) �ձ��� ������, �Ǿտ� �ִ� \n�� ����
		System.out.print("�ּ�? ");
		scanner.nextLine(); // ���ۿ� �����ִ� \n�� ����� �뵵
		String address = scanner.nextLine(); //"\n�ձ��� �������� \n����
		System.out.println("�Է��� �ּҴ�: " + address);
		System.out.println("��");
		scanner.close();
		
		
		
		
	}
	
}
