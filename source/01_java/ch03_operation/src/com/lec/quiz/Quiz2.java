package com.lec.quiz;
import java.util.Scanner;
//�Է��� ���� ¦/Ȧ�� ���� ���
public class Quiz2{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("�� �Է�  : ");
		int i = sc.nextInt(); 
		int resuit = i%2;
		System.out.println((resuit==0)? "�Է��� ���� ¦��" : "�Է��� ���� Ȧ��");
		sc.close();
		}
	}
