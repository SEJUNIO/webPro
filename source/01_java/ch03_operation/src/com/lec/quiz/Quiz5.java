package com.lec.quiz;
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
>>>>>>> 599483f45739cf8128ffbe0d028efb8df7f935bd
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
import java.util.Scanner;
// ������������ ����, ��� ���
public class Quiz5 {
	public static void main(String[] args) {
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
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
<<<<<<< HEAD
=======
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
>>>>>>> 8ec08da9522e23faa3b266d5c549ab93305b654f
