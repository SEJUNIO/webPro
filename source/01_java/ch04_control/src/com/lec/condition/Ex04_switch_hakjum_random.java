package com.lec.condition;
<<<<<<< HEAD
//�������� (0~100)�� ���� ���
=======
<<<<<<< HEAD
//�������� (0~100)�� ���� ���
public class Ex04_switch_hakjum_random {
	public static void main(String[] args) {
		//0<=Math.random() < 1 �Ǽ� ���� �߻�
		//0<=Math.random()*101 <101 �Ǽ� ���� �߻� 
		//0<=(int)(Math.random()*101) < 101 �������� 
		int score = (int)(Math.random() * 101);
	System.out.println("���� : " + score);
	//���� ���
	switch(score/10) {
	case 10 : case 9 : 
		System.out.println("A"); break;
	case 8 : 
		System.out.println("B"); break;
	case 7 : 
		System.out.println("C"); break;
	case 6 : 
		System.out.println("D"); break;
	default:
		System.out.println("F"); break;
		}
	}
}
=======
// �������� (0~100)�� �������
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
public class Ex04_switch_hakjum_random {
	public static void main(String[] args) {
		//0<=Math.random() < 1 �Ǽ� ���� �߻�
		//0<=Math.random()*101 <101 �Ǽ� ���� �߻� 
		//0<=(int)(Math.random()*101) < 101 �������� 
		int score = (int)(Math.random() * 101);
	System.out.println("���� : " + score);
	//���� ���
	switch(score/10) {
	case 10 : case 9 : 
		System.out.println("A"); break;
	case 8 : 
		System.out.println("B"); break;
	case 7 : 
		System.out.println("C"); break;
	case 6 : 
		System.out.println("D"); break;
	default:
		System.out.println("F"); break;
		}
	}
}
<<<<<<< HEAD
=======
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
