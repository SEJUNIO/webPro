package com.lec.ex1_string;

import java.util.Scanner;

public class Ex04_juminNo {
	public static void main(String[] args) {
		String juminNo;
		Scanner scanner = new Scanner(System.in);
		System.out.print("�ֹι�ȣ�� �Է��ϼ��� : ");
		juminNo = scanner.next(); // 981212-1025478
		
		//String������� ����
		String genderStr = juminNo.substring(7,8); // "1"
		if(genderStr.equals("1") || genderStr.equals("3")){
			System.out.println("����");
		}else if(genderStr.equals("2") || genderStr.equals("4")) {
			System.out.println("����");
		}else {
			System.out.println("�߸��Է�");
		}
		//char�����������
		char genderChar = juminNo.charAt(7); // '1'
		if(genderChar=='1' || genderChar=='3') { //�ҹ��ڸ� ==
			System.out.println("����");
		}else if(genderChar=='2' || genderChar=='4') {
			System.out.println("����");
		}else {
			System.out.println("�߸��Է�");
		}
		//��� 3   "1" -> 1
		int genderInt = Integer.parseInt(genderStr); //2
		if(genderInt==1 || genderInt==3) {
			System.out.println("�����̽ñ���");
		}else if(genderInt==2 || genderInt==4) {
			System.out.println("�����̽ñ���");
		}else {
			System.out.println("�߸��Է�");
		}
		scanner.close();
		}

}
