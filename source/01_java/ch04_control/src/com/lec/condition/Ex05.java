package com.lec.condition;

import java.util.Scanner;
<<<<<<< HEAD
//����ڷκ��� ���� ������ Ȧ������ ¦������ ��� (���׿�����, if, switch) - switch
=======

//����ڷκ��� ���� ������ Ȧ������ ¦������ ���(���׿����� , if, switch) - switch
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
public class Ex05 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int su = scanner.nextInt();
<<<<<<< HEAD
		switch(su%2) {
		case 0 :
			System.out.println("¦��"); break;
		default : 
			System.out.println("Ȧ��"); break;
		}
		scanner.close();
	}
}
=======
		switch(su&2) {
		case 0: 
			System.out.println("¦��"); break;
		default: 
			System.out.println("Ȧ��"); break;
		
	}
		scanner.close();
}
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
