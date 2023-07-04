package com.lec.ex1_student;

public class StudentMain {
	public static void main(String[] args) {
		Student s1 = new Student("���켺", 90, 90, 90);
		Student s2 = new Student("���ϴ�", 90, 90, 91);
		Student s3 = new Student("Ȳ����", 80, 80, 80);
		Student s4 = new Student("������", 80, 80, 81);
		Student s5 = new Student("������", 99, 99, 99);
		Student [] students = {s1, s2, s3, s4, s5};
		String title [] = {"�̸�", "����", "����", "����", "����", "���"};
		//int totkor = 0, toteng = 0, totmat = 0, totTot =0, totavg = 0;
		int [] total = new int[5]; //0��idx: �����, 1��idx:�����, 2��idx:���д���,3��idx:��������, 4��idx:��մ���,
		//�β��� ����
		line();
		System.out.println("\t\t\t�� �� ǥ");
		// ���� �ݺ�
		line('-');
		for(String t : title) {
			System.out.print("\t" + t);
		}
		System.out.println();
		line('-');
		for(int idx=0; idx<students.length; idx++) {
			System.out.println(students[idx].infoString() );
			//totKor += students[idx].getKor(); //�����
			total[0] += students[idx].getKor(); //�����
			total[1] += students[idx].getEng(); //�����
			total[2] += students[idx].getMat(); //���д���
			total[3] += students[idx].getTot(); //�հ贩��
			total[4] += students[idx].getAvg(); //��մ���
		}
		line('-');
		System.out.print("\t����");
		for(int tot : total) {
			System.out.printf("\t%4d", tot );
		}
		System.out.print("\n\t���");
		for(int tot : total) {
			System.out.printf("\t%.1f", (double)tot/students.length);
		}
		System.out.println(); //����
		
		line();
		
}
	//���� �ݺ� �޼ҵ�
	private static void line(char c) {
		System.out.print("\t");
		for(int i=0; i<50; i++) {
			System.out.print(c);
		}
		System.out.println();
	}

	//���ϰ� ����� �Ѹ��� �޼ҵ�
	private static void line() {
		for(int i =0; i<65; i ++) {
			System.out.print('��');			
		}
		System.out.println();  //��������
		
	}
}