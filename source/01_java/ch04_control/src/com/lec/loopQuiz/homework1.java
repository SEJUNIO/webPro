package com.lec.loopQuiz;

import java.util.Scanner;
//���������� ����
<<<<<<< HEAD
public class homework1 {
=======
public class Homework1 {
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
	public static void main(String[] args) {
	Scanner scanner = new Scanner(System.in);
	while(true) {
		System.out.println("����(0),����(1),���ڱ�(2) �� ���� �ϳ��� �����ϼ��� (����: -1) ");
		int you = scanner.nextInt(); //0,1,2
		if(you == -1 ) break;
		int computer =(int) (Math.random()*3); //0,1,2 �� �� ����
		String youStr = (you==0) ? "����" : (you==1)? "����" : "���ڱ�";
		String computerStr = (computer==0) ? "����" : (computer==1)? "����" : "���ڱ�";
		if(you>2 || you < 0) {
			System.out.println("�߸� �Է��Ͻ�");
			continue; //���ǽ� �κ����ΰ�
		}
		System.out.println("����� " + youStr +", ��ǻ�ʹ�" + computerStr);
		//����� �̰���ϴ� || ��ǻ�Ͱ� �̰���ϴ� || �����ϴ� ���
		if((you+2)%3 == computer) {
			System.out.println("����� �̰���ϴ�");
		}else if ( you == computer) {
			System.out.println("�����ϴ�");
		}else { 
			System.out.println("��ǻ�Ͱ� �̰���ϴ٤̤�");
			scanner.close();
		}
		
	}
	}
}
