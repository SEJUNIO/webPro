package com.lec.loopQuiz;
//1~10���� ���� �� ¦���� �հ� Ȧ���� ���� ���غ���
public class Quiz2_for {
	public static void main(String[] args) {
		int tot = 0; // Ȧ�� ���� ����
			for(int i=1; i<11; i++) {
				if(1%2 !=0) {
					tot += i;
				}
			}//for
			System.out.println("1~10������ Ȧ���� ���� " + tot);
	}
}
