package com.lec.condition;
<<<<<<< HEAD

=======
<<<<<<< HEAD

import java.util.Scanner;

//�μ��� �Է¹޾� ���° ���� �󸶸�ŭ �� ū�� ���
public class Ex02_if {
	 public static void main(String[] args) {
	 Scanner scanner = new Scanner(System.in);
	 System.out.print("ù��° ���� : " );
	 int num1 = scanner.nextInt();
	 System.out.print("�ι�° ���� : " );
	 int num2 = scanner.nextInt();
	 if(num1>num2) {
		 System.out.printf("ù��° ��(%d)�� %d��ŭ �� Ů�ϴ�\n", num1, (num1-num2) );
	 }else if(num2>num1) {
		 System.out.printf("�ι�° ��(%d)�� %d��ŭ �� Ů�ϴ�\n", num2, (num2-num1) );
	 }else {
		 System.out.println("�� ���� �����ϴ�");
	 }
	 scanner.close();
=======
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;

//�μ��� �Է¹޾� ���° ���� �󸶸�ŭ �� ū�� ���
public class Ex02_if {
<<<<<<< HEAD
	 public static void main(String[] args) {
	 Scanner scanner = new Scanner(System.in);
	 System.out.print("ù��° ���� : " );
	 int num1 = scanner.nextInt();
	 System.out.print("�ι�° ���� : " );
	 int num2 = scanner.nextInt();
	 if(num1>num2) {
		 System.out.printf("ù��° ��(%d)�� %d��ŭ �� Ů�ϴ�\n", num1, (num1-num2) );
	 }else if(num2>num1) {
		 System.out.printf("�ι�° ��(%d)�� %d��ŭ �� Ů�ϴ�\n", num2, (num2-num1) );
	 }else {
		 System.out.println("�� ���� �����ϴ�");
	 }
	 scanner.close();
=======
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù��° ����");
		int num1 = scanner.nextInt();
		System.out.println("�ι�° ����");
		int num2 = scanner.nextInt();
		if(num1>num2) {
			System.out.printf("ù��° ��(%d)�� %d��ŭ �� Ů�ϴ�\n", num1, (num1-num2));			
		}else {
			System.out.println("�� ���� �����ϴ�");
		}
		scanner.close();
		
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
	}
}
