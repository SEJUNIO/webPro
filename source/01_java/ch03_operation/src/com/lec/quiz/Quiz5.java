package com.lec.quiz;
<<<<<<< HEAD

=======
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
import java.util.Scanner;
// ������������ ����, ��� ���
public class Quiz5 {
	public static void main(String[] args) {
<<<<<<< HEAD
	Scanner scanner = new Scanner(System.in);
	System.out.print("���� ������? : ");
	int kor = scanner.nextInt();
	System.out.print("���� ������? : ");
	int eng = scanner.nextInt();
	System.out.print("���� ������? : ");
	int mat = scanner.nextInt();
	int sum = kor + eng + mat;
	double avg = sum/3.;
	System.out.printf("���� = %d, ���� = %d, ���� = %d\n", kor, eng, mat);
	System.out.printf("���� = %d, ��� = %.2f\n", sum, avg);
	scanner.close();
}	
}
=======
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� ������?");
		int kor = scanner.nextInt();
		System.out.print("���� ������?");
		int eng = scanner.nextInt();
		System.out.print("���� ������?");
		int mat = scanner.nextInt();
		int sum = kor + eng + mat;
		double avg = sum/3.;
		System.out.printf("���� = %d, ���� = %d, ���� = %d\n",kor, eng, mat);
		System.out.printf("���� = %d, ��� = %.2f\n", sum, avg);
		scanner.close();
	}
}
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
