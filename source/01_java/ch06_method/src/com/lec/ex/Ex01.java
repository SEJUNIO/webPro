package com.lec.ex;
//1~10���� ������ �հ� �� ����� ¦������ Ȧ������ ���
public class Ex01 {
	public static void main(String[] args) {
		int tot =0; //���� �����ϴ� ����
		for(int i=1; i<=10; i++) {
			tot += i;
		}
		System.out.println("1~10���� ������ ���� : " + tot);
		System.out.println( tot%2==0 ? "¦���Դϴ�" : "Ȧ���Դϴ�"); //tot�� 2�� ���� ���� 0�̸� ¦���̳� Ȧ���̳�
		// 11~100���� ������ �հ� �� ����� ¦������ Ȧ������ ���
		tot=0;
		for(int i =11; i<=100; i++) {
			tot +=i;
		}
		System.out.println("11~100���� ������ ���� : " + tot);
		System.out.println( tot%2==0 ? "¦���Դϴ�" : "Ȧ���Դϴ�"); //tot�� 2�γ������� 0�̸� ¦���̳� Ȧ���̳�
	} 
}
